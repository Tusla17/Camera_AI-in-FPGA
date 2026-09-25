`timescale 1ns/1ps
module tb_head;
    localparam NIN=1024, N=8;
    reg  [NIN-1:0] in_bits;
    wire signed [31:0] logit0, logit1;
    wire pred;
    reg  inall [0:N*NIN-1];
    reg  [31:0] labs [0:N-1];
    integer i, k, label, errors;

    head dut(.in_bits(in_bits), .logit0(logit0), .logit1(logit1), .pred(pred));

    initial begin
        $readmemb("head_in.mem",     inall);
        $readmemh("head_labels.mem", labs);
        if (inall[0] === 1'bx || (^labs[0]) === 1'bx) begin
            $display("LOI: thieu file .mem -> chay gen_head_test.py"); $finish;
        end
        #1;
        errors = 0;
        for (i=0; i<N; i=i+1) begin
            for (k=0;k<NIN;k=k+1) in_bits[k] = inall[i*NIN + k];
            #10;
            label = labs[i];
            $display("golden_%0d: pred=%0d label=%0d | logit0=%0d logit1=%0d",
                     i, pred, label, logit0, logit1);
            if (pred !== label[0]) errors = errors + 1;
        end
        if (errors==0) $display("PASS: head (fc1->fc2) dung het %0d/%0d golden", N, N);
        else           $display("FAIL: %0d/%0d golden sai", errors, N);
        $finish;
    end
endmodule
