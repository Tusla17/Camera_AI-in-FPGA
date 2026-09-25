`timescale 1ns/1ps
module conv_engine #(
    parameter CIN=64, COUT=64, H=8, W=8, K=3, Q=8,
    parameter WMEM="conv3_w_bits.mem",
    parameter TMEM="conv3_tau.mem",
    parameter W_AWIDTH=11,
    parameter TAU_AWIDTH=6
)(
    input  clk, rst, start,
    input  [CIN*H*W-1:0] in_bits,
    input  w_we,
    input  [W_AWIDTH-1:0] w_waddr,
    input  [31:0] w_wdata,
    input  tau_we,
    input  [TAU_AWIDTH-1:0] tau_waddr,
    input  [31:0] tau_wdata,
    output reg done,
    output reg [COUT*(H/2)*(W/2)-1:0] out_bits
);
    localparam NTAP  = CIN*K*K;
    localparam WLOG  = $clog2(W);
    localparam PWLOG = $clog2(W/2);
    localparam NPOOL = (H/2)*(W/2);

    reg [31:0] w_mem [0:(COUT*NTAP/32)-1];
    reg signed [31:0]  tau_q [0:COUT-1];
    reg signed [31:0]  psum  [0:H*W-1];

    always @(posedge clk) begin
        if (w_we) begin
            w_mem[w_waddr] <= w_wdata;
        end
    end

    always @(posedge clk) begin
        if (tau_we) begin
            tau_q[tau_waddr] <= tau_wdata;
        end
    end

    localparam S_IDLE=2'd0, S_COMP=2'd1, S_POOL=2'd2, S_DONE=2'd3;
    reg [1:0] state;
    reg [$clog2(COUT):0]  oc;
    reg [$clog2(H*W):0]   pos;
    reg [$clog2(CIN):0]   ci;      // kenh vao dang cong (pipeline)
    reg [$clog2(NPOOL):0] pp;      // diem ra dang pool (pipeline)

    integer kh, kw, ih, iw, oh, ow, ph, pw;
    reg signed [31:0] acc, part, s0, s1, s2, s3, m;

    wire [15:0] tap_idx      = oc * NTAP + ci * 9;
    wire [10:0] w_word_idx   = tap_idx >> 5;
    wire [4:0]  w_bit_offset = tap_idx[4:0];
    wire [63:0] w_pair       = (w_word_idx >= (COUT*NTAP/32)-1) ? 
                               {32'b0, w_mem[w_word_idx]} : 
                               {w_mem[w_word_idx + 1'b1], w_mem[w_word_idx]};
    wire [8:0]  wbit_slice   = w_pair[w_bit_offset +: 9];

    always @(posedge clk) begin
        if (rst) begin
            state<=S_IDLE; done<=1'b0; oc<=0; pos<=0; ci<=0; acc<=0; pp<=0;
        end else case (state)
        S_IDLE: begin
            done<=1'b0;
            if (start) begin oc<=0; pos<=0; ci<=0; acc<=0; state<=S_COMP; end
        end
        S_COMP: begin                          // 1 kenh vao / chu ky
            oh = pos >> WLOG;  ow = pos & (W-1);
            part = 0;
            for (kh=0; kh<K; kh=kh+1)
              for (kw=0; kw<K; kw=kw+1) begin
                  ih = oh + kh - 1;  iw = ow + kw - 1;
                  if (ih>=0 && ih<H && iw>=0 && iw<W)
                      part = part + ((in_bits[ci*H*W + ih*W + iw] ==
                                      wbit_slice[kh*K + kw]) ? 1 : -1);
              end
            if (ci == CIN-1) begin
                psum[pos] <= acc + part;
                acc <= 0;  ci <= 0;
                if (pos == H*W-1) begin pos<=0; pp<=0; state<=S_POOL; end
                else pos <= pos + 1'b1;
            end else begin
                acc <= acc + part;
                ci  <= ci + 1'b1;
            end
        end
        S_POOL: begin                          // 1 diem ra / chu ky
            ph = pp >> PWLOG;
            pw = pp & ((W/2)-1);
            s0 = psum[(2*ph  )*W + (2*pw  )];
            s1 = psum[(2*ph  )*W + (2*pw+1)];
            s2 = psum[(2*ph+1)*W + (2*pw  )];
            s3 = psum[(2*ph+1)*W + (2*pw+1)];
            m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
            out_bits[oc*NPOOL + pp] <= ((m <<< Q) > tau_q[oc]) ? 1'b1 : 1'b0;
            if (pp == NPOOL-1) begin
                pp <= 0;
                if (oc == COUT-1) state <= S_DONE;
                else begin oc <= oc + 1'b1; pos<=0; ci<=0; acc<=0; state<=S_COMP; end
            end else pp <= pp + 1'b1;
        end
        S_DONE: done <= 1'b1;
        endcase
    end
endmodule
