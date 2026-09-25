`timescale 1ns/1ps
module tb_engine_conv3;
    localparam C=64, H=8, W=8;
    localparam NOUT=C*(H/2)*(W/2);   // 1024
    reg clk=0, rst=1, start=0;
    wire done;
    wire [NOUT-1:0] out_bits;
    reg expm [0:NOUT-1];
    integer k, errors;

    conv_engine #(.CIN(64), .COUT(64), .H(8), .W(8), .Q(8),
                  .WMEM("conv3_w_bits.mem"), .TMEM("conv3_tau.mem"),
                  .IMEM("conv3_in.mem"))
      dut(.clk(clk), .rst(rst), .start(start), .done(done), .out_bits(out_bits));

    always #5 clk = ~clk;            // 100 MHz

    initial begin
        $readmemb("conv3_exp.mem", expm);
        if (expm[0] === 1'bx) begin $display("LOI: thieu conv3_exp.mem"); $finish; end
        repeat (2) @(negedge clk);
        rst = 0; start = 1;
        @(negedge clk); start = 0;
        wait (done);
        @(negedge clk);
        errors = 0;
        for (k=0; k<NOUT; k=k+1)
            if (out_bits[k] !== expm[k]) begin
                errors = errors + 1;
                if (errors<=20) $display("MISMATCH %0d: dut=%b exp=%b", k, out_bits[k], expm[k]);
            end
        if (errors==0) $display("PASS: conv_engine conv3 khop golden 100%% (%0d bit)", NOUT);
        else           $display("FAIL: %0d/%0d bit sai", errors, NOUT);
        $finish;
    end
endmodule
