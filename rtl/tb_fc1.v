`timescale 1ns/1ps
module tb_fc1;
    localparam NIN=1024, NOUT=128;
    reg  [NIN-1:0]  in_bits;
    wire [NOUT-1:0] out_bits;
    reg  inmem [0:NIN-1];
    reg  exp   [0:NOUT-1];
    integer k, j, errors;

    fc1 dut(.in_bits(in_bits), .out_bits(out_bits));

    initial begin
        $readmemb("g0_in_bits.mem",       inmem);
        $readmemb("g0_fc1_expected.mem",  exp);
        if (exp[0] === 1'bx || inmem[0] === 1'bx) begin  // chan PASS gia khi thieu file .mem
            $display("LOI: khong nap duoc .mem -> chay gen_fc1_test.py, va chay vvp trong thu muc mem/");
            $finish;
        end
        #1;                                       // cho fc1 nap xong weight/tau (o t=0)
        for (k=0;k<NIN;k=k+1) in_bits[k] = inmem[k];
        #10;
        errors = 0;
        for (j=0;j<NOUT;j=j+1)
            if (out_bits[j] !== exp[j]) begin
                errors = errors + 1;
                $display("MISMATCH neuron %0d: dut=%b exp=%b", j, out_bits[j], exp[j]);
            end
        if (errors==0) $display("PASS: fc1 khop golden 100%% (%0d neurons)", NOUT);
        else           $display("FAIL: %0d/%0d neuron sai", errors, NOUT);
        $finish;
    end
endmodule
