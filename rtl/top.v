module top (
    output signed [31:0] logit0, logit1,
    output pred
);
    wire [8191:0] l1;   // conv1 -> 32x16x16
    wire [4095:0] l2;   // conv2 -> 64x8x8
    wire [1023:0] l3;   // conv3 -> 64x4x4
    wire [127:0]  f1;   // fc1   -> 128

    conv1 u1(.out_bits(l1));
    conv2 u2(.in_bits(l1), .out_bits(l2));
    conv3 u3(.in_bits(l2), .out_bits(l3));
    fc1   u4(.in_bits(l3), .out_bits(f1));
    fc2   u5(.in_bits(f1), .logit0(logit0), .logit1(logit1), .pred(pred));
endmodule
