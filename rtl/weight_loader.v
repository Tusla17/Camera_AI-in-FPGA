`timescale 1ns/1ps
module weight_loader (
    input  wire         clk,
    input  wire         rstn,
    
    // Control / Status
    input  wire         load_start,
    output reg          load_busy,
    output reg          load_done,
    output reg          load_error,
    output reg          load_ready, // Drives backpressure for S_AXI_WREADY
    
    // Key, Nonce, Expected Tag inputs from AXI Registers
    input  wire [127:0] key_data,
    input  wire [127:0] nonce_data,
    input  wire [127:0] expected_tag,
    
    // Ciphertext word write from AXI-Lite
    input  wire         ciphertext_we,
    input  wire [31:0]  ciphertext_wdata,
    
    // Unified weight memory write interface
    output reg          load_we,
    output reg  [12:0]  load_addr,
    output reg  [31:0]  load_data
);

    // IV for ASCON-128 AEAD decryption
    // iv = [1, 0, (8<<4)+12, 128 in little-endian (80 00), 16, 0, 0]
    // Hex big-endian: 01 00 8c 80 00 10 00 00
    // As little-endian 64-bit integer: 0x00001000808c0001
    localparam [63:0] ASCON_IV = 64'h00001000808c0001;

    // FSM States
    localparam [2:0] L_IDLE         = 3'd0,
                     L_INIT_PERM    = 3'd1,
                     L_READY        = 3'd2,
                     L_DECRYPT_PERM = 3'd3,
                     L_WRITE_BRAM   = 3'd4,
                     L_FINALIZE     = 3'd5,
                     L_DONE         = 3'd6;

    reg [2:0] ls;

    // ASCON State Registers (320 bits)
    reg [319:0] state_reg;
    
    // Ciphertext buffer and word count
    reg [95:0]  c_data_buf;
    reg [1:0]   c_word_cnt;
    
    // Plaintext buffer for writing
    reg [127:0] p_data_reg;
    reg [1:0]   write_cnt;
    
    // Loading address counter (up to 6378)
    reg [12:0]  load_word_cnt;

    // ASCON Permutation Round Interface
    reg  [3:0]  round_idx;
    wire [319:0] round_state_out;
    
    ascon_round u_round (
        .round_idx(round_idx),
        .state_in(state_reg),
        .state_out(round_state_out)
    );

    // Decode Key & Nonce endianness to match standard C representation
    // If PS writes them, we can keep them in native format. Let's do simple bit-swap/word-swap if needed.
    // We assume AXI registers feed them directly:
    // key_data = {REG_KEY_0, REG_KEY_1, REG_KEY_2, REG_KEY_3}
    // expected_tag = {REG_EXPECTED_TAG_0, REG_EXPECTED_TAG_1, REG_EXPECTED_TAG_2, REG_EXPECTED_TAG_3}
    wire [63:0] k0 = key_data[127:64];
    wire [63:0] k1 = key_data[63:0];

    wire [127:0] c_block = {c_data_buf, ciphertext_wdata};
    wire [127:0] calculated_tag = {
        round_state_out[127:64] ^ k0,
        round_state_out[63:0]   ^ k1
    };
    wire [63:0] n0 = nonce_data[127:64];
    wire [63:0] n1 = nonce_data[63:0];

    // FSM Logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            ls <= L_IDLE;
            load_busy <= 1'b0;
            load_done <= 1'b0;
            load_error <= 1'b0;
            load_ready <= 1'b0;
            state_reg <= 320'd0;
            c_word_cnt <= 2'd0;
            c_data_buf <= 96'd0;
            p_data_reg <= 128'd0;
            write_cnt <= 2'd0;
            load_word_cnt <= 13'd0;
            round_idx <= 4'd0;
            load_we <= 1'b0;
            load_addr <= 13'd0;
            load_data <= 32'd0;
        end else begin
            load_we <= 1'b0;
            case (ls)
                L_IDLE: begin
                    load_done <= 1'b0;
                    load_error <= 1'b0;
                    load_ready <= 1'b0;
                    if (load_start) begin
                        load_busy <= 1'b1;
                        load_word_cnt <= 13'd0;
                        c_word_cnt <= 2'd0;
                        // Initialize state: S = IV || Key || Nonce
                        // S[0] = IV
                        // S[1] = Key[127:64]
                        // S[2] = Key[63:0]
                        // S[3] = Nonce[127:64]
                        // S[4] = Nonce[63:0]
                        state_reg <= {ASCON_IV, k0, k1, n0, n1};
                        round_idx <= 4'd0; // Rounds go 0 to 11
                        ls <= L_INIT_PERM;
                    end
                end
                
                L_INIT_PERM: begin
                    state_reg <= round_state_out;
                    if (round_idx == 4'd11) begin
                        // XOR Key at the end of initialization
                        // state_reg[191:128] is S[2], state_reg[127:64] is S[3], state_reg[63:0] is S[4]
                        // Wait, in Python:
                        // S[3] ^= Key[127:64], S[4] ^= Key[63:0]
                        // S[3] is state_reg[127:64], S[4] is state_reg[63:0]
                        state_reg[127:64] <= round_state_out[127:64] ^ k0;
                        state_reg[63:0]   <= round_state_out[63:0]   ^ k1;
                        load_ready <= 1'b1;
                        ls <= L_READY;
                    end else begin
                        round_idx <= round_idx + 1'b1;
                    end
                end
                
                L_READY: begin
                    load_ready <= 1'b1;
                    if (ciphertext_we) begin
                        if (c_word_cnt == 2'd3) begin
                            // Backpressure: pull ready low immediately to stall next writes
                            load_ready <= 1'b0;
                            c_word_cnt <= 2'd0;
                            
                            // Decrypt block: P_i = S[0..1] ^ C_i
                            // S[0] is state_reg[319:256], S[1] is state_reg[255:192]
                            p_data_reg[127:64] <= state_reg[319:256] ^ c_block[127:64];
                            p_data_reg[63:0]   <= state_reg[255:192] ^ c_block[63:0];
                            
                            // Update State with Ciphertext
                            state_reg[319:256] <= c_block[127:64];
                            state_reg[255:192] <= c_block[63:0];
                            
                            // Run P8 permutation (rounds 4 to 11)
                            round_idx <= 4'd4;
                            ls <= L_DECRYPT_PERM;
                        end else begin
                            // Latch ciphertext word
                            case (c_word_cnt)
                                2'd0: c_data_buf[95:64] <= ciphertext_wdata;
                                2'd1: c_data_buf[63:32] <= ciphertext_wdata;
                                2'd2: c_data_buf[31:0]  <= ciphertext_wdata;
                            endcase
                            c_word_cnt <= c_word_cnt + 1'b1;
                        end
                    end
                end
                
                L_DECRYPT_PERM: begin
                    state_reg <= round_state_out;
                    if (round_idx == 4'd11) begin
                        write_cnt <= 2'd0;
                        ls <= L_WRITE_BRAM;
                    end else begin
                        round_idx <= round_idx + 1'b1;
                    end
                end
                
                L_WRITE_BRAM: begin
                    // Write 4 plaintext words to memory
                    load_we <= 1'b1;
                    load_addr <= load_word_cnt;
                    case (write_cnt)
                        2'd0: load_data <= p_data_reg[127:96];
                        2'd1: load_data <= p_data_reg[95:64];
                        2'd2: load_data <= p_data_reg[63:32];
                        2'd3: load_data <= p_data_reg[31:0];
                    endcase
                    
                    load_word_cnt <= load_word_cnt + 1'b1;
                    
                    if (write_cnt == 2'd3) begin
                        // Check if all 6379 words have been written
                        // Wait! The last block writes up to 6380 words (since 1595 blocks * 4 words = 6380 words).
                        // The last block will have 1 extra padding word at index 6379, which we can safely write or ignore.
                        if (load_word_cnt >= 13'd6378) begin
                            // XOR Key into S[2] and S[3] BEFORE finalization permutation P12
                            state_reg <= {
                                state_reg[319:192],
                                state_reg[191:128] ^ k0,
                                state_reg[127:64]  ^ k1,
                                state_reg[63:0]
                            };
                            round_idx <= 4'd0; // rounds 0..11
                            ls <= L_FINALIZE;
                        end else begin
                            load_ready <= 1'b1;
                            ls <= L_READY;
                        end
                    end else begin
                        write_cnt <= write_cnt + 1'b1;
                    end
                end
                
                L_FINALIZE: begin
                    state_reg <= round_state_out;
                    if (round_idx == 4'd11) begin
                        $display("[ASCON RTL] Calculated Tag = 0x%032X", calculated_tag);
                        $display("[ASCON RTL] Expected Tag   = 0x%032X", expected_tag);
                        if (calculated_tag == expected_tag) begin
                            load_error <= 1'b0;
                        end else begin
                            load_error <= 1'b1;
                        end
                        load_busy <= 1'b0;
                        load_done <= 1'b1;
                        ls <= L_DONE;
                    end else begin
                        round_idx <= round_idx + 1'b1;
                    end
                end
                
                L_DONE: begin
                    load_busy  <= 1'b0;
                    load_ready <= 1'b0;
                    load_done  <= 1'b1;
                    if (load_start) begin
                        load_done <= 1'b0;
                        ls <= L_IDLE;
                    end
                end
                
                default: ls <= L_IDLE;
            endcase
        end
    end

endmodule
