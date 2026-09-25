`timescale 1ns/1ps
module conv1 #(parameter COUT=32, H=32, W=32, K=3, QI=15) (
    output reg [COUT*(H/2)*(W/2)-1:0] out_bits    // l1_bin: oc*256 + ph*16 + pw
);
    localparam NTAP = K*K;
    reg wbit [0:COUT*NTAP-1];
    reg signed [31:0] tau_q [0:COUT-1];
    reg signed [31:0] img   [0:H*W-1];
    integer oc, oh, ow, kh, kw, ih, iw, ph, pw;
    reg signed [63:0] acc, s0, s1, s2, s3, mm;
    reg signed [63:0] psum [0:H*W-1];

    initial begin
        $readmemb("conv1_w_bits.mem", wbit);
        $readmemh("conv1_tau.mem",    tau_q);
        $readmemh("conv1_in.mem",     img);
        if (img[0] === 64'bx) begin
            $display("LOI: thieu conv1_in.mem -> chay gen_conv1_test.py"); $finish;
        end
        #1;                                       // 1ns (nho co `timescale) -> tranh race pipeline
        for (oc=0; oc<COUT; oc=oc+1) begin
            for (oh=0; oh<H; oh=oh+1)
              for (ow=0; ow<W; ow=ow+1) begin
                acc = 0;
                for (kh=0; kh<K; kh=kh+1)
                  for (kw=0; kw<K; kw=kw+1) begin
                    ih = oh + kh - 1;
                    iw = ow + kw - 1;
                    if (ih>=0 && ih<H && iw>=0 && iw<W)
                        acc = acc + (wbit[oc*NTAP + kh*K + kw] ?
                                       img[ih*W+iw] : -img[ih*W+iw]);
                  end
                psum[oh*W+ow] = acc;
              end
            for (ph=0; ph<H/2; ph=ph+1)
              for (pw=0; pw<W/2; pw=pw+1) begin
                s0 = psum[(2*ph  )*W + (2*pw  )];
                s1 = psum[(2*ph  )*W + (2*pw+1)];
                s2 = psum[(2*ph+1)*W + (2*pw  )];
                s3 = psum[(2*ph+1)*W + (2*pw+1)];
                mm = s0;
                if (s1>mm) mm=s1;
                if (s2>mm) mm=s2;
                if (s3>mm) mm=s3;
                out_bits[oc*(H/2)*(W/2) + ph*(W/2) + pw] =
                    (mm > tau_q[oc]) ? 1'b1 : 1'b0;
              end
        end
    end
endmodule
