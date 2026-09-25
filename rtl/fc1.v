module fc1 #(parameter NIN=1024, NOUT=128, Q=8) (
    input  [NIN-1:0]  in_bits,        // in_bits[k]: 1=+1, 0=-1
    output reg [NOUT-1:0] out_bits    // out_bits[j]: 1=+1, 0=-1
);
    reg wbit [0:NOUT*NIN-1];          // trọng số 1 bit, neuron-major
    reg signed [31:0] tau_q [0:NOUT-1];
    integer j, k, acc;

    initial begin
        $readmemb("fc1_w_bits.mem", wbit);
        $readmemh("fc1_tau.mem",   tau_q);
    end

    always @(in_bits) begin
        for (j=0; j<NOUT; j=j+1) begin
            acc = 0;
            for (k=0; k<NIN; k=k+1)
                acc = acc + ((in_bits[k] == wbit[j*NIN+k]) ? 1 : -1); // XNOR -> ±1
            out_bits[j] = ((acc <<< Q) > tau_q[j]) ? 1'b1 : 1'b0;      // fold BN
        end
    end
endmodule
