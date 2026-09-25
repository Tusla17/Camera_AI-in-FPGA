`timescale 1ns/1ps
module fc_engine #(
    parameter NIN1=1024, NH=128, NOUT=2, Q=8, CHUNK=64,
    parameter W1MEM="fc1_w_bits.mem",
    parameter T1MEM="fc1_tau.mem",
    parameter W2MEM="fc2_w.mem",
    parameter B2MEM="fc2_b.mem"
)(
    input  clk, rst, start,
    input  [NIN1-1:0] in_bits,
    input  w_we,
    input  [11:0] w_waddr,
    input  [31:0] w_wdata,
    input  tau_we,
    input  [6:0] tau_waddr,
    input  [31:0] tau_wdata,
    input  w2_we,
    input  [7:0] w2_waddr,
    input  [31:0] w2_wdata,
    input  b2_we,
    input  [0:0] b2_waddr,
    input  [31:0] b2_wdata,
    output reg done,
    output reg [NH-1:0] fc1_bin,
    output reg signed [31:0] logit0,
    output reg signed [31:0] logit1,
    output reg pred
);
    reg [31:0] wbit_mem [0:(NH*NIN1/32)-1];
    reg signed [31:0] tau_q [0:NH-1];
    reg signed [31:0] w2    [0:NOUT*NH-1];
    reg signed [31:0] b2    [0:NOUT-1];

    always @(posedge clk) begin
        if (w_we) begin
            wbit_mem[w_waddr] <= w_wdata;
        end
    end

    always @(posedge clk) begin
        if (tau_we) begin
            tau_q[tau_waddr] <= tau_wdata;
        end
    end

    always @(posedge clk) begin
        if (w2_we) begin
            w2[w2_waddr] <= w2_wdata;
        end
    end

    always @(posedge clk) begin
        if (b2_we) begin
            b2[b2_waddr] <= b2_wdata;
        end
    end

    localparam S_IDLE=2'd0, S_FC1=2'd1, S_FC2=2'd2, S_DONE=2'd3;
    reg [1:0] state;
    reg [$clog2(NH):0]   n;
    reg [$clog2(NIN1):0] ki;      // offset chunk (pipeline)
    integer k;
    reg signed [31:0] acc1, part;
    reg signed [63:0] a0, a1;

    wire [31:0] w_word  = wbit_mem[n * 32 + ki];
    wire [31:0] in_word = in_bits[ki * 32 +: 32];

    always @(posedge clk) begin
        if (rst) begin state<=S_IDLE; done<=1'b0; n<=0; ki<=0; acc1<=0; end
        else case (state)
        S_IDLE: begin done<=1'b0; if (start) begin n<=0; ki<=0; acc1<=0; state<=S_FC1; end end
        S_FC1: begin                          // 32 tap / chu ky
            part = 0;
            for (k=0; k<32; k=k+1)
                part = part + ((in_word[k] == w_word[k]) ? 1 : -1);
            if (ki == 5'd31) begin
                fc1_bin[n] <= (((acc1+part)<<<Q) > tau_q[n]) ? 1'b1 : 1'b0;
                acc1 <= 0;  ki <= 0;
                if (n==NH-1) begin
                    n <= 0;
                    ki <= 0;
                    a0 <= b2[0];
                    a1 <= b2[1];
                    state <= S_FC2;
                end
                else n <= n + 1'b1;
            end else begin
                acc1 <= acc1 + part;
                ki   <= ki + 1'b1;
            end
        end
        S_FC2: begin
            if (ki == NH) begin
                logit0 <= a0[31:0];
                logit1 <= a1[31:0];
                pred   <= (a1 > a0) ? 1'b1 : 1'b0;
                state  <= S_DONE;
            end else begin
                a0 <= a0 + (fc1_bin[ki] ? w2[ki] : -w2[ki]);
                a1 <= a1 + (fc1_bin[ki] ? w2[NH+ki] : -w2[NH+ki]);
                ki <= ki + 1'b1;
            end
        end
        S_DONE: done<=1'b1;
        endcase
    end
endmodule
