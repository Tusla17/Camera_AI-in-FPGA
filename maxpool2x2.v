module maxpool2x2 #(parameter W = 24) (
    input  signed [W-1:0] a, b, c, d,
    output signed [W-1:0] y
);
    wire signed [W-1:0] m0 = (a > b) ? a : b;
    wire signed [W-1:0] m1 = (c > d) ? c : d;
    assign y = (m0 > m1) ? m0 : m1;
endmodule
