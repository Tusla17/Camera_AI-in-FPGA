module head (
    input  [1023:0] in_bits,              // l3_bin
    output signed [31:0] logit0, logit1,
    output pred
);
    wire [127:0] fc1_out;
    fc1 u_fc1(.in_bits(in_bits), .out_bits(fc1_out));
    fc2 u_fc2(.in_bits(fc1_out), .logit0(logit0), .logit1(logit1), .pred(pred));
endmodule
