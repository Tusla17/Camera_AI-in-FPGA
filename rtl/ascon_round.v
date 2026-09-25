`timescale 1ns/1ps
module ascon_round (
    input  wire [3:0]   round_idx,
    input  wire [319:0] state_in,
    output wire [319:0] state_out
);
    // Unpack 320-bit state into five 64-bit words
    wire [63:0] x0_in = state_in[319:256];
    wire [63:0] x1_in = state_in[255:192];
    wire [63:0] x2_in = state_in[191:128];
    wire [63:0] x3_in = state_in[127:64];
    wire [63:0] x4_in = state_in[63:0];

    // --- 1. Round Constant Addition ---
    reg [7:0] round_const;
    always @(*) begin
        case (round_idx)
            4'd0:  round_const = 8'hf0;
            4'd1:  round_const = 8'he1;
            4'd2:  round_const = 8'hd2;
            4'd3:  round_const = 8'hc3;
            4'd4:  round_const = 8'hb4;
            4'd5:  round_const = 8'ha5;
            4'd6:  round_const = 8'h96;
            4'd7:  round_const = 8'h87;
            4'd8:  round_const = 8'h78;
            4'd9:  round_const = 8'h69;
            4'd10: round_const = 8'h5a;
            4'd11: round_const = 8'h4b;
            default: round_const = 8'h00;
        endcase
    end

    wire [63:0] x0_const = x0_in;
    wire [63:0] x1_const = x1_in;
    wire [63:0] x2_const = x2_in ^ {56'd0, round_const};
    wire [63:0] x3_const = x3_in;
    wire [63:0] x4_const = x4_in;

    // --- 2. Substitution Layer (S-box) ---
    wire [63:0] s0 = x0_const ^ x4_const;
    wire [63:0] s4 = x4_const ^ x3_const;
    wire [63:0] s2 = x2_const ^ x1_const;
    wire [63:0] s1 = x1_const;
    wire [63:0] s3 = x3_const;

    wire [63:0] t0 = ~s0 & s1;
    wire [63:0] t1 = ~s1 & s2;
    wire [63:0] t2 = ~s2 & s3;
    wire [63:0] t3 = ~s3 & s4;
    wire [63:0] t4 = ~s4 & s0;

    wire [63:0] x0_stage2 = s0 ^ t1;
    wire [63:0] x1_stage2 = s1 ^ t2;
    wire [63:0] x2_stage2 = s2 ^ t3;
    wire [63:0] x3_stage2 = s3 ^ t4;
    wire [63:0] x4_stage2 = s4 ^ t0;

    wire [63:0] x0_sbox = x0_stage2 ^ x4_stage2;
    wire [63:0] x1_sbox = x1_stage2 ^ x0_stage2;
    wire [63:0] x2_sbox = ~x2_stage2;
    wire [63:0] x3_sbox = x3_stage2 ^ x2_stage2;
    wire [63:0] x4_sbox = x4_stage2;

    // --- 3. Linear Diffusion Layer ---
    wire [63:0] x0_out = x0_sbox ^ {x0_sbox[18:0], x0_sbox[63:19]} ^ {x0_sbox[27:0], x0_sbox[63:28]};
    wire [63:0] x1_out = x1_sbox ^ {x1_sbox[60:0], x1_sbox[63:61]} ^ {x1_sbox[38:0], x1_sbox[63:39]};
    wire [63:0] x2_out = x2_sbox ^ {x2_sbox[0],    x2_sbox[63:1]}  ^ {x2_sbox[5:0],  x2_sbox[63:6]};
    wire [63:0] x3_out = x3_sbox ^ {x3_sbox[9:0],  x3_sbox[63:10]} ^ {x3_sbox[16:0], x3_sbox[63:17]};
    wire [63:0] x4_out = x4_sbox ^ {x4_sbox[6:0],  x4_sbox[63:7]}  ^ {x4_sbox[40:0], x4_sbox[63:41]};

    // Pack output words back into 320-bit state
    assign state_out = {x0_out, x1_out, x2_out, x3_out, x4_out};

endmodule
