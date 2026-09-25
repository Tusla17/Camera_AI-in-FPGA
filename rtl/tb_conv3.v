`timescale 1ns/1ps
module tb_conv3;
    localparam C=64, H=8, W=8;
    localparam NIN=C*H*W;            // 4096
    localparam NOUT=C*(H/2)*(W/2);   // 1024
    reg  [NIN-1:0]  in_bits;
    wire [NOUT-1:0] out_bits;
    reg  inmem [0:NIN-1];
    reg  expm  [0:NOUT-1];
    integer k, errors;

    conv3 dut(.in_bits(in_bits), .out_bits(out_bits));

    initial begin
        $readmemb("conv3_in.mem",  inmem);
        $readmemb("conv3_exp.mem", expm);
        if (inmem[0] === 1'bx || expm[0] === 1'bx) begin
            $display("LOI: thieu file .mem -> chay gen_conv3_test.py"); $finish;
        end
        #1;
        for (k=0;k<NIN;k=k+1) in_bits[k] = inmem[k];
        #10;
        errors = 0;
        for (k=0;k<NOUT;k=k+1)
            if (out_bits[k] !== expm[k]) begin
                errors = errors + 1;
                if (errors<=20) $display("MISMATCH idx %0d: dut=%b exp=%b", k, out_bits[k], expm[k]);
            end
        if (errors==0) $display("PASS: conv3 khop golden 100%% (%0d bit)", NOUT);
        else           $display("FAIL: %0d/%0d bit sai", errors, NOUT);
        $finish;
    end
endmodule
