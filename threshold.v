// binary_out = (s > tau).  s là tổng nguyên; tau ở fixed-point Qx.8.
module threshold #(parameter W = 24, Q = 8) (
    input  signed [W-1:0] s,       // tổng từ binmac
    input  signed [31:0] tau_q,    // tau * 2^Q
    output out_bit                 // 1 = +1, 0 = -1
);
    wire signed [W+Q-1:0] s_scaled = s <<< Q;
    assign out_bit = (s_scaled > tau_q);
endmodule
