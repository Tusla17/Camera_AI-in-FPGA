`timescale 1ns/1ps
module tb_fc2;
    localparam NIN=128;
    reg  [NIN-1:0] in_bits;
    wire signed [31:0] logit0, logit1;
    wire pred;
    reg  inmem [0:NIN-1];
    reg  [31:0] labmem [0:0];
    integer k, label;

    fc2 dut(.in_bits(in_bits), .logit0(logit0), .logit1(logit1), .pred(pred));

    initial begin
        $readmemb("g0_fc1_expected.mem", inmem);   // fc1_bin = input cua fc2
        $readmemh("g0_label.mem",        labmem);
        if (inmem[0] === 1'bx || (^labmem[0]) === 1'bx) begin
            $display("LOI: thieu file .mem -> chay gen_fc2_test.py");
            $finish;
        end
        label = labmem[0];
        #1;
        for (k=0;k<NIN;k=k+1) in_bits[k] = inmem[k];
        #10;
        $display("logit0=%0d  logit1=%0d  (Q.8, chia 256 ra thuc)", logit0, logit1);
        $display("pred=%0d  label=%0d", pred, label);
        if (pred == label) $display("PASS: fc2 argmax dung");
        else               $display("FAIL: fc2 argmax sai");
        $finish;
    end
endmodule
