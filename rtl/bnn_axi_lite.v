`timescale 1ns/1ps
//==================================================================
// bnn_axi_lite : AXI4-Lite wrapper cho top_clk (BNN drowsiness accel)
//  0x00 CTRL   [WO] bit0=start (ghi 1 -> chay 1 frame, tu xoa)
//  0x04 STATUS [RO] bit0=done, bit1=busy
//  0x08 LOGIT0 [RO] signed 32-bit
//  0x0C LOGIT1 [RO] signed 32-bit
//  0x10 PRED   [RO] bit0=lop du doan (0=nham,1=mo)
//  0x14 MAGIC  [RO] 0x0B11EE01
//==================================================================
module bnn_axi_lite #(
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 13
)(
    input  wire                              S_AXI_ACLK,
    input  wire                              S_AXI_ARESETN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_AWADDR,
    input  wire [2:0]                        S_AXI_AWPROT,
    input  wire                              S_AXI_AWVALID,
    output wire                              S_AXI_AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_WDATA,
    input  wire [(C_S_AXI_DATA_WIDTH/8)-1:0] S_AXI_WSTRB,
    input  wire                              S_AXI_WVALID,
    output wire                              S_AXI_WREADY,
    output wire [1:0]                        S_AXI_BRESP,
    output wire                              S_AXI_BVALID,
    input  wire                              S_AXI_BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     S_AXI_ARADDR,
    input  wire [2:0]                        S_AXI_ARPROT,
    input  wire                              S_AXI_ARVALID,
    output wire                              S_AXI_ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0]     S_AXI_RDATA,
    output wire [1:0]                        S_AXI_RRESP,
    output wire                              S_AXI_RVALID,
    input  wire                              S_AXI_RREADY
);
    wire clk  = S_AXI_ACLK;
    wire rstn = S_AXI_ARESETN;

    reg                          axi_awready, axi_wready, axi_bvalid;
    reg                          axi_arready, axi_rvalid;
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_awaddr, axi_araddr;
    reg [C_S_AXI_DATA_WIDTH-1:0] axi_rdata;

    assign S_AXI_AWREADY = axi_awready;
    assign S_AXI_WREADY  = axi_wready;
    assign S_AXI_BRESP   = 2'b00;
    assign S_AXI_BVALID  = axi_bvalid;
    assign S_AXI_ARREADY = axi_arready;
    assign S_AXI_RDATA   = axi_rdata;
    assign S_AXI_RRESP   = 2'b00;
    assign S_AXI_RVALID  = axi_rvalid;

    // ---- Ciphertext write detection ----
    reg aw_done, w_done;
    reg [C_S_AXI_DATA_WIDTH-1:0] axi_wdata_reg;
    wire load_ready; // from weight_loader

    wire [C_S_AXI_DATA_WIDTH-1:0] wdata_eff = (w_done ? axi_wdata_reg : S_AXI_WDATA);
    wire wr_en = (axi_awready || aw_done) && (axi_wready || w_done) && ~axi_bvalid;

    // ---- Clean Decoupled Write Address / Data Handshake ----
    always @(posedge clk) begin
        if (!rstn) begin
            axi_awready <= 1'b0;
            aw_done     <= 1'b0;
            axi_awaddr  <= 0;
        end else begin
            if (~axi_awready && S_AXI_AWVALID && ~aw_done) begin
                axi_awready <= 1'b1;
                aw_done     <= 1'b1;
                axi_awaddr  <= S_AXI_AWADDR;
            end else begin
                axi_awready <= 1'b0;
            end
            if (wr_en) aw_done <= 1'b0;
        end
    end

    always @(posedge clk) begin
        if (!rstn) begin
            axi_wready    <= 1'b0;
            w_done        <= 1'b0;
            axi_wdata_reg <= 0;
        end else begin
            if (~axi_wready && S_AXI_WVALID && ~w_done) begin
                axi_wready    <= 1'b1;
                w_done        <= 1'b1;
                axi_wdata_reg <= S_AXI_WDATA;
            end else begin
                axi_wready <= 1'b0;
            end
            if (wr_en) w_done <= 1'b0;
        end
    end

    always @(posedge clk) begin
        if (!rstn) begin
            axi_bvalid <= 1'b0;
        end else begin
            if (wr_en) begin
                axi_bvalid <= 1'b1;
            end else if (S_AXI_BREADY && axi_bvalid) begin
                axi_bvalid <= 1'b0;
            end
        end
    end

    // ---- read handshake ----
    always @(posedge clk) begin
        if (!rstn) begin axi_arready <= 1'b0; axi_araddr <= 0; end
        else if (!axi_arready && S_AXI_ARVALID) begin
            axi_arready <= 1'b1; axi_araddr <= S_AXI_ARADDR;
        end else axi_arready <= 1'b0;
    end
    always @(posedge clk) begin
        if (!rstn) axi_rvalid <= 1'b0;
        else if (axi_arready && S_AXI_ARVALID && !axi_rvalid) axi_rvalid <= 1'b1;
        else if (axi_rvalid && S_AXI_RREADY) axi_rvalid <= 1'b0;
    end

    // ---- Image BRAM write logic (offset 0x1000 - 0x1FFF) ----
    wire        img_we;
    wire [9:0]  img_waddr;
    wire [31:0] img_wdata;

    assign img_we    = wr_en && axi_awaddr[12];
    assign img_waddr = axi_awaddr[11:2];
    assign img_wdata = wdata_eff;

    // ---- ASCON loader registers & instantiation ----
    reg [31:0] reg_key [0:3];
    reg [31:0] reg_nonce [0:3];
    reg [31:0] reg_expected_tag [0:3];
    reg        load_start_reg;

    wire ctrl_write = wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] == 5'h00);
    always @(posedge clk) begin
        if (!rstn) load_start_reg <= 1'b0;
        else if (ctrl_write && wdata_eff[1]) load_start_reg <= 1'b1;
        else load_start_reg <= 1'b0;
    end

    always @(posedge clk) begin
        if (!rstn) begin
            reg_key[0] <= 32'd0; reg_key[1] <= 32'd0; reg_key[2] <= 32'd0; reg_key[3] <= 32'd0;
        end else if (wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] >= 5'h08 && axi_awaddr[6:2] <= 5'h0B)) begin
            reg_key[axi_awaddr[3:2]] <= wdata_eff;
        end
    end

    always @(posedge clk) begin
        if (!rstn) begin
            reg_nonce[0] <= 32'd0; reg_nonce[1] <= 32'd0; reg_nonce[2] <= 32'd0; reg_nonce[3] <= 32'd0;
        end else if (wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] >= 5'h0C && axi_awaddr[6:2] <= 5'h0F)) begin
            reg_nonce[axi_awaddr[3:2]] <= wdata_eff;
        end
    end

    always @(posedge clk) begin
        if (!rstn) begin
            reg_expected_tag[0] <= 32'd0; reg_expected_tag[1] <= 32'd0; reg_expected_tag[2] <= 32'd0; reg_expected_tag[3] <= 32'd0;
        end else if (wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] >= 5'h14 && axi_awaddr[6:2] <= 5'h17)) begin
            reg_expected_tag[axi_awaddr[3:2]] <= wdata_eff;
        end
    end

    // ---- TRNG Control Registers & Instantiation (0x60 - 0x7C) ----
    reg [2:0] reg_trng_ctrl;
    always @(posedge clk) begin
        if (!rstn) begin
            reg_trng_ctrl <= 3'b001; // Enable TRNG by default
        end else if (wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] == 5'h18)) begin
            reg_trng_ctrl <= wdata_eff[2:0];
        end
    end

    wire        trng_ready;
    wire        trng_health_pass;
    wire        trng_health_error;
    wire [4:0]  trng_entropy_cnt;
    wire [31:0] trng_data_out;
    wire [127:0] trng_nonce_out;

    trng u_trng (
        .clk(clk),
        .rstn(rstn),
        .enable(reg_trng_ctrl[0]),
        .reseed(reg_trng_ctrl[1]),
        .health_rst(reg_trng_ctrl[2]),
        .trng_ready(trng_ready),
        .health_pass(trng_health_pass),
        .health_error(trng_health_error),
        .entropy_count(trng_entropy_cnt),
        .trng_data_out(trng_data_out),
        .trng_nonce_out(trng_nonce_out)
    );

    wire ciphertext_we = wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] == 5'h10);
    wire [31:0] ciphertext_wdata = wdata_eff;

    wire        load_we;
    wire [12:0] load_addr;
    wire [31:0] load_data;
    wire        load_busy;
    wire        load_done;
    wire        load_error;

    weight_loader u_loader (
        .clk(clk),
        .rstn(rstn),
        .load_start(load_start_reg),
        .load_busy(load_busy),
        .load_done(load_done),
        .load_error(load_error),
        .load_ready(load_ready),
        .key_data({reg_key[0], reg_key[1], reg_key[2], reg_key[3]}),
        .nonce_data({reg_nonce[0], reg_nonce[1], reg_nonce[2], reg_nonce[3]}),
        .expected_tag({reg_expected_tag[0], reg_expected_tag[1], reg_expected_tag[2], reg_expected_tag[3]}),
        .ciphertext_we(ciphertext_we),
        .ciphertext_wdata(ciphertext_wdata),
        .load_we(load_we),
        .load_addr(load_addr),
        .load_data(load_data)
    );

    // ---- top_clk core ----
    reg  tc_rst, tc_start;
    wire tc_done, tc_pred;
    wire signed [31:0] tc_logit0, tc_logit1;

    top_clk u_top (
        .clk(clk), .rst(tc_rst), .start(tc_start),
        .img_we(img_we), .img_waddr(img_waddr), .img_wdata(img_wdata),
        .load_we(load_we), .load_addr(load_addr), .load_data(load_data),
        .done(tc_done), .pred(tc_pred),
        .logit0(tc_logit0), .logit1(tc_logit1)
    );

    // ---- run sequencer: reset core -> pulse start -> cho done, latch ket qua ----
    localparam R_IDLE=2'd0, R_RST=2'd1, R_GO=2'd2, R_RUN=2'd3;
    reg [1:0] rs;
    reg busy, done_lat, pred_lat;
    reg signed [31:0] logit0_lat, logit1_lat;

    wire start_cmd = wr_en && ~axi_awaddr[12] && (axi_awaddr[6:2] == 5'h00) && wdata_eff[0];

    always @(posedge clk) begin
        if (!rstn) begin
            rs <= R_IDLE; tc_rst <= 1'b1; tc_start <= 1'b0;
            busy <= 1'b0; done_lat <= 1'b0; pred_lat <= 1'b0;
            logit0_lat <= 32'd0; logit1_lat <= 32'd0;
        end else begin
            tc_start <= 1'b0;
            case (rs)
                R_IDLE: begin
                    tc_rst <= 1'b0;
                    if (start_cmd) begin tc_rst <= 1'b1; busy <= 1'b1; done_lat <= 1'b0; rs <= R_RST; end
                end
                R_RST: begin tc_rst <= 1'b0; rs <= R_GO; end
                R_GO:  begin tc_start <= 1'b1; rs <= R_RUN; end
                R_RUN: if (tc_done) begin
                           busy <= 1'b0; done_lat <= 1'b1;
                           logit0_lat <= tc_logit0; logit1_lat <= tc_logit1; pred_lat <= tc_pred;
                           rs <= R_IDLE;
                       end
            endcase
        end
    end

    // ---- read mux ----
    always @(*) begin
        if (axi_araddr[12]) begin
            axi_rdata = 32'd0;
        end else begin
            case (axi_araddr[6:2])
                5'd1:    axi_rdata = {27'd0, load_error, load_busy, load_done, busy, done_lat};
                5'd2:    axi_rdata = logit0_lat;
                5'd3:    axi_rdata = logit1_lat;
                5'd4:    axi_rdata = {31'd0, pred_lat};
                5'd5:    axi_rdata = 32'h0B11EE01;
                5'h18:   axi_rdata = {29'd0, reg_trng_ctrl};
                5'h19:   axi_rdata = {24'd0, trng_entropy_cnt, trng_health_error, trng_health_pass, trng_ready};
                5'h1A:   axi_rdata = trng_data_out;
                5'h1C:   axi_rdata = trng_nonce_out[31:0];
                5'h1D:   axi_rdata = trng_nonce_out[63:32];
                5'h1E:   axi_rdata = trng_nonce_out[95:64];
                5'h1F:   axi_rdata = trng_nonce_out[127:96];
                default: axi_rdata = 32'd0;
            endcase
        end
    end
endmodule
