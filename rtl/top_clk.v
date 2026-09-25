`timescale 1ns/1ps
module top_clk(
    input  clk, rst, start,
    input  img_we,
    input  [9:0]  img_waddr,
    input  [31:0] img_wdata,
    
    // Weight loader interface
    input  load_we,
    input  [12:0] load_addr,
    input  [31:0] load_data,
    
    output done,
    output pred,
    output signed [31:0] logit0,
    output signed [31:0] logit1
);
    wire d1, d2, d3, df;
    reg  s1, s2, s3, sf;
    wire [8191:0] l1;   // conv1 out (32*16*16)
    wire [4095:0] l2;   // conv2 out (64*8*8)
    wire [1023:0] l3;   // conv3 out (64*4*4)
    wire [127:0]  fc1_unused;

    // ---- Weight loader address decoding ----
    wire w1_we = load_we && (load_addr <= 13'd8);
    wire [3:0] w1_waddr = load_addr[3:0];
    
    wire tau1_we = load_we && (load_addr >= 13'd9 && load_addr <= 13'd40);
    wire [4:0] tau1_waddr = load_addr - 13'd9;
    
    wire w2_we = load_we && (load_addr >= 13'd41 && load_addr <= 13'd616);
    wire [9:0] w2_waddr = load_addr - 13'd41;
    
    wire tau2_we = load_we && (load_addr >= 13'd617 && load_addr <= 13'd680);
    wire [5:0] tau2_waddr = load_addr - 13'd617;
    
    wire w3_we = load_we && (load_addr >= 13'd681 && load_addr <= 13'd1832);
    wire [10:0] w3_waddr = load_addr - 13'd681;
    
    wire tau3_we = load_we && (load_addr >= 13'd1833 && load_addr <= 13'd1896);
    wire [5:0] tau3_waddr = load_addr - 13'd1833;
    
    wire fc_w_we = load_we && (load_addr >= 13'd1897 && load_addr <= 13'd5992);
    wire [11:0] fc_w_waddr = load_addr - 13'd1897;
    
    wire fc_tau_we = load_we && (load_addr >= 13'd5993 && load_addr <= 13'd6120);
    wire [6:0] fc_tau_waddr = load_addr - 13'd5993;
    
    wire fc_w2_we = load_we && (load_addr >= 13'd6121 && load_addr <= 13'd6376);
    wire [7:0] fc_w2_waddr = load_addr - 13'd6121;
    
    wire fc_b2_we = load_we && (load_addr >= 13'd6377 && load_addr <= 13'd6378);
    wire [0:0] fc_b2_waddr = load_addr - 13'd6377;

    conv1_engine u1(
        .clk(clk), .rst(rst), .start(s1),
        .img_we(img_we), .img_waddr(img_waddr), .img_wdata(img_wdata),
        .w_we(w1_we), .w_waddr(w1_waddr), .w_wdata(load_data),
        .tau_we(tau1_we), .tau_waddr(tau1_waddr), .tau_wdata(load_data),
        .done(d1), .out_bits(l1)
    );

    conv_engine #(.CIN(32), .COUT(64), .H(16), .W(16), .Q(8),
                  .WMEM("conv2_w_bits.mem"), .TMEM("conv2_tau.mem"),
                  .W_AWIDTH(10), .TAU_AWIDTH(6))
      u2(.clk(clk), .rst(rst), .start(s2), .in_bits(l1), 
         .w_we(w2_we), .w_waddr(w2_waddr), .w_wdata(load_data),
         .tau_we(tau2_we), .tau_waddr(tau2_waddr), .tau_wdata(load_data),
         .done(d2), .out_bits(l2));

    conv_engine #(.CIN(64), .COUT(64), .H(8), .W(8), .Q(8),
                  .WMEM("conv3_w_bits.mem"), .TMEM("conv3_tau.mem"),
                  .W_AWIDTH(11), .TAU_AWIDTH(6))
      u3(.clk(clk), .rst(rst), .start(s3), .in_bits(l2), 
         .w_we(w3_we), .w_waddr(w3_waddr), .w_wdata(load_data),
         .tau_we(tau3_we), .tau_waddr(tau3_waddr), .tau_wdata(load_data),
         .done(d3), .out_bits(l3));

    fc_engine u5(.clk(clk), .rst(rst), .start(sf), .in_bits(l3),
                 .w_we(fc_w_we), .w_waddr(fc_w_waddr), .w_wdata(load_data),
                 .tau_we(fc_tau_we), .tau_waddr(fc_tau_waddr), .tau_wdata(load_data),
                 .w2_we(fc_w2_we), .w2_waddr(fc_w2_waddr), .w2_wdata(load_data),
                 .b2_we(fc_b2_we), .b2_waddr(fc_b2_waddr), .b2_wdata(load_data),
                 .done(df), .fc1_bin(fc1_unused), .logit0(logit0), .logit1(logit1), .pred(pred));

    localparam I=3'd0, C1=3'd1, C2=3'd2, C3=3'd3, FCs=3'd4, D=3'd5;
    reg [2:0] st;
    always @(posedge clk) begin
        if (rst) begin st<=I; s1<=0; s2<=0; s3<=0; sf<=0; end
        else case (st)
            I:   begin if (start) begin s1<=1'b1; st<=C1; end end
            C1:  begin s1<=1'b0; if (d1) begin s2<=1'b1; st<=C2; end end
            C2:  begin s2<=1'b0; if (d2) begin s3<=1'b1; st<=C3; end end
            C3:  begin s3<=1'b0; if (d3) begin sf<=1'b1; st<=FCs; end end
            FCs: begin sf<=1'b0; if (df) st<=D; end
            D:   ;
        endcase
    end
    assign done = (st==D);
endmodule