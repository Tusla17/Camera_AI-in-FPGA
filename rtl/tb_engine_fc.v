`timescale 1ns/1ps
module tb_engine_fc;
    localparam NH=128;
    reg clk=0, rst=1, start=0;
    wire done, pred;
    wire [NH-1:0] fc1_bin;
    wire signed [31:0] logit0, logit1;
    reg expb [0:NH-1];
    reg lbl  [0:0];
    integer k, errors;

    fc_engine dut(.clk(clk), .rst(rst), .start(start), .done(done),
                  .fc1_bin(fc1_bin), .logit0(logit0), .logit1(logit1), .pred(pred));

    always #5 clk = ~clk;
    initial begin
        $readmemb("fc_exp_bin.mem", expb);
        $readmemb("fc_label.mem",   lbl);
        if (expb[0]===1'bx) begin $display("LOI: thieu fc_exp_bin.mem"); $finish; end
        repeat (2) @(negedge clk);
        rst=0; start=1;
        @(negedge clk); start=0;
        wait (done);
        @(negedge clk);
        errors=0;
        for (k=0; k<NH; k=k+1)
            if (fc1_bin[k] !== expb[k]) begin
                errors=errors+1;
                if (errors<=10) $display("FC1 MISMATCH %0d: dut=%b exp=%b", k, fc1_bin[k], expb[k]);
            end
        $display("logit0=%0d logit1=%0d | pred=%0d label=%0d", logit0, logit1, pred, lbl[0]);
        if (errors==0 && pred===lbl[0])
            $display("PASS: fc_engine dung (fc1_bin 128/128 + pred==label)");
        else
            $display("FAIL: fc1 sai %0d bit hoac pred!=label", errors);
        $finish;
    end
endmodule
