`timescale 1ns/1ps
module tb_conv1;
    localparam COUT=32, H=32, W=32;
    localparam NOUT=COUT*(H/2)*(W/2);   // 32*16*16 = 8192
    wire [NOUT-1:0] out_bits;
    reg  expm [0:NOUT-1];
    integer k, errors;
    real pct;

    conv1 dut(.out_bits(out_bits));

    initial begin
        $readmemb("conv1_exp.mem", expm);
        if (expm[0] === 1'bx) begin
            $display("LOI: thieu conv1_exp.mem -> chay gen_conv1_test.py"); $finish;
        end
        #5;
        errors = 0;
        for (k=0;k<NOUT;k=k+1)
            if (out_bits[k] !== expm[k]) begin
                errors = errors + 1;
                if (errors<=20) $display("MISMATCH idx %0d: dut=%b exp=%b", k, out_bits[k], expm[k]);
            end
        pct = 100.0*(NOUT-errors)/NOUT;
        $display("conv1: %0d/%0d sai | khop = %.2f%%", errors, NOUT, pct);
        if (errors==0)        $display("PASS: conv1 khop golden 100%%");
        else if (pct >= 99.0) $display("PASS (chap nhan): conv1 khop %.2f%% (>=99%%)", pct);
        else                  $display("FAIL: conv1 chi khop %.2f%%", pct);
        $finish;
    end
endmodule
