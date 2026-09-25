`timescale 1ns/1ps
module tb_top_clk;
    reg clk=0, rst=1, start=0;
    wire done, pred;
    wire signed [31:0] logit0, logit1;
    reg lbl [0:0];

    top_clk dut(.clk(clk), .rst(rst), .start(start), .done(done),
                .pred(pred), .logit0(logit0), .logit1(logit1));

    always #5 clk = ~clk;
    initial begin
        $readmemb("top_label.mem", lbl);
        repeat (2) @(negedge clk);
        rst=0; start=1;
        @(negedge clk); start=0;
        wait (done);
        @(negedge clk);
        $display("pred=%0d label=%0d | logit0=%0d logit1=%0d", pred, lbl[0], logit0, logit1);
        if (pred===lbl[0]) $display("PASS: full pipeline clocked dung (pred==label)");
        else               $display("FAIL: pred != label");
        $finish;
    end
endmodule