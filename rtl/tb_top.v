`timescale 1ns/1ps
module tb_top;
    wire signed [31:0] logit0, logit1;
    wire pred;
    reg  [31:0] labmem [0:0];
    integer label;

    top dut(.logit0(logit0), .logit1(logit1), .pred(pred));

    initial begin
        $readmemh("top_label.mem", labmem);
        if ((^labmem[0]) === 1'bx) begin
            $display("LOI: thieu top_label.mem -> chay gen_top_test.py"); $finish;
        end
        label = labmem[0];
        #20;
        $display("pred=%0d label=%0d | logit0=%0d logit1=%0d", pred, label, logit0, logit1);
        if (pred === label[0]) $display("PASS: full pipeline dung (pred==label)");
        else                   $display("FAIL: pred != label");
        $finish;
    end
endmodule
