module conv3 #(parameter C=64, H=8, W=8, K=3, Q=8) (
    input  [C*H*W-1:0] in_bits,               // l2_bin: index c*64+h*8+w (1=+1,0=-1)
    output reg [C*(H/2)*(W/2)-1:0] out_bits   // l3_bin: index oc*16+ph*4+pw
);
    localparam NTAP = C*K*K;                  // 576
    reg wbit [0:C*NTAP-1];                    // oc*576 + ic*9 + kh*3 + kw
    reg signed [31:0] tau_q [0:C-1];
    integer oc, ic, oh, ow, kh, kw, ih, iw, ph, pw;
    integer acc, m, s0, s1, s2, s3;
    reg signed [31:0] psum [0:H*W-1];

    initial begin
        $readmemb("conv3_w_bits.mem", wbit);
        $readmemh("conv3_tau.mem",    tau_q);
    end

    always @(in_bits) begin
        for (oc=0; oc<C; oc=oc+1) begin
            // 1) conv 3x3 pad1 -> psum (H x W)
            for (oh=0; oh<H; oh=oh+1)
              for (ow=0; ow<W; ow=ow+1) begin
                acc = 0;
                for (ic=0; ic<C; ic=ic+1)
                  for (kh=0; kh<K; kh=kh+1)
                    for (kw=0; kw<K; kw=kw+1) begin
                        ih = oh + kh - 1;
                        iw = ow + kw - 1;
                        if (ih>=0 && ih<H && iw>=0 && iw<W)   // padding: ngoai bien cong 0
                            acc = acc + ((in_bits[ic*H*W + ih*W + iw] ==
                                          wbit[oc*NTAP + ic*K*K + kh*K + kw]) ? 1 : -1);
                    end
                psum[oh*W + ow] = acc;
              end
            // 2) maxpool 2x2 tren tong -> 3) so tau
            for (ph=0; ph<H/2; ph=ph+1)
              for (pw=0; pw<W/2; pw=pw+1) begin
                s0 = psum[(2*ph  )*W + (2*pw  )];
                s1 = psum[(2*ph  )*W + (2*pw+1)];
                s2 = psum[(2*ph+1)*W + (2*pw  )];
                s3 = psum[(2*ph+1)*W + (2*pw+1)];
                m = s0;
                if (s1>m) m=s1;
                if (s2>m) m=s2;
                if (s3>m) m=s3;
                out_bits[oc*(H/2)*(W/2) + ph*(W/2) + pw] =
                    ((m <<< Q) > tau_q[oc]) ? 1'b1 : 1'b0;
              end
        end
    end
endmodule
