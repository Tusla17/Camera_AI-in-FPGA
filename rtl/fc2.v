module fc2 #(parameter NIN=128, NOUT=2, Q=8) (
    input  [NIN-1:0] in_bits,             // fc1_bin: 1=+1, 0=-1
    output reg signed [31:0] logit0,
    output reg signed [31:0] logit1,
    output reg pred                       // 0=closed, 1=open
);
    reg signed [31:0] w_q [0:NOUT*NIN-1]; // Q.8, o-major
    reg signed [31:0] b_q [0:NOUT-1];
    integer o, k;
    reg signed [63:0] acc, l0, l1;

    initial begin
        $readmemh("fc2_w.mem", w_q);
        $readmemh("fc2_b.mem", b_q);
    end

    always @(in_bits) begin
        l0 = 0; l1 = 0;
        for (o=0; o<NOUT; o=o+1) begin
            acc = b_q[o];
            for (k=0; k<NIN; k=k+1)
                acc = acc + (in_bits[k] ? w_q[o*NIN+k] : -w_q[o*NIN+k]);
            if (o==0) l0 = acc; else l1 = acc;
        end
        logit0 = l0[31:0];
        logit1 = l1[31:0];
        pred   = (l1 > l0) ? 1'b1 : 1'b0;
    end
endmodule
