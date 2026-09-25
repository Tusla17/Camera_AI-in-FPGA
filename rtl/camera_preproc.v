`timescale 1ns/1ps
//=============================================================================
// camera_preproc.v
// Video Preprocessing Unit for Camera AI on ZCU106
// - Inputs: AXI4-Stream Video (RGB888) from MIPI CSI-2 / Demosaic
// - Converts RGB to Grayscale Y (BT.601: Y = (77*R + 150*G + 29*B) >> 8)
// - Crops ROI (Region of Interest: Driver Eye Region)
// - Downsamples to 32x32 resolution
// - Converts to Q1.15 signed fixed-point: Q15 = (Y * 257) - 32768
// - Streams 1024 words directly into BNN Image BRAM (0..1023)
//=============================================================================

module camera_preproc #(
    parameter integer FRAME_WIDTH  = 1920,
    parameter integer FRAME_HEIGHT = 1080,
    parameter integer DEFAULT_ROI_X0 = 800,  // Center eye ROI
    parameter integer DEFAULT_ROI_Y0 = 380,
    parameter integer DEFAULT_ROI_SIZE = 320 // 320x320 -> step 10 -> 32x32
)(
    input  wire        clk,
    input  wire        rstn,

    // AXI4-Stream Video Input (from Demosaic IP)
    input  wire [23:0] s_axis_tdata,   // [23:16]=R, [15:8]=G, [7:0]=B
    input  wire        s_axis_tvalid,
    output wire        s_axis_tready,
    input  wire        s_axis_tuser,   // SOF (Start of Frame)
    input  wire        s_axis_tlast,   // EOL (End of Line)

    // Configurable ROI Parameters
    input  wire [11:0] roi_x0,
    input  wire [11:0] roi_y0,
    input  wire [11:0] roi_size,
    input  wire        cfg_valid,

    // Direct BNN Image BRAM Master Interface
    output reg         bnn_img_we,
    output reg  [9:0]  bnn_img_waddr,
    output reg  [31:0] bnn_img_wdata,
    output reg         frame_done_trigger
);

    // Stream ready (always accepts pixels)
    assign s_axis_tready = 1'b1;

    // Active ROI registers
    reg [11:0] reg_roi_x0;
    reg [11:0] reg_roi_y0;
    reg [11:0] reg_roi_size;
    reg [5:0]  reg_step;

    always @(posedge clk) begin
        if (!rstn) begin
            reg_roi_x0   <= DEFAULT_ROI_X0[11:0];
            reg_roi_y0   <= DEFAULT_ROI_Y0[11:0];
            reg_roi_size <= DEFAULT_ROI_SIZE[11:0];
            reg_step     <= 6'd10; // 320 / 32 = 10
        end else if (cfg_valid) begin
            reg_roi_x0   <= roi_x0;
            reg_roi_y0   <= roi_y0;
            reg_roi_size <= roi_size;
            reg_step     <= roi_size[11:5]; // size / 32
        end
    end

    // Pixel Coordinates Tracking
    reg [11:0] x_cnt;
    reg [11:0] y_cnt;

    always @(posedge clk) begin
        if (!rstn) begin
            x_cnt <= 12'd0;
            y_cnt <= 12'd0;
        end else if (s_axis_tvalid && s_axis_tready) begin
            if (s_axis_tuser) begin
                // Start of Frame
                x_cnt <= 12'd0;
                y_cnt <= 12'd0;
            end else if (s_axis_tlast) begin
                // End of Line
                x_cnt <= 12'd0;
                y_cnt <= y_cnt + 1'b1;
            end else begin
                x_cnt <= x_cnt + 1'b1;
            end
        end
    end

    // Stage 1: RGB to Grayscale Y (BT.601)
    // Y = (77*R + 150*G + 29*B) >> 8
    wire [7:0] r_val = s_axis_tdata[23:16];
    wire [7:0] g_val = s_axis_tdata[15:8];
    wire [7:0] b_val = s_axis_tdata[7:0];

    reg [15:0] y_accum;
    reg [7:0]  gray_y;
    reg        pipe_valid;
    reg [11:0] pipe_x, pipe_y;
    reg        pipe_sof, pipe_eol;

    always @(posedge clk) begin
        if (!rstn) begin
            y_accum    <= 16'd0;
            gray_y     <= 8'd0;
            pipe_valid <= 1'b0;
            pipe_x     <= 12'd0;
            pipe_y     <= 12'd0;
            pipe_sof   <= 1'b0;
            pipe_eol   <= 1'b0;
        end else begin
            pipe_valid <= s_axis_tvalid && s_axis_tready;
            pipe_x     <= x_cnt;
            pipe_y     <= y_cnt;
            pipe_sof   <= s_axis_tuser;
            pipe_eol   <= s_axis_tlast;
            
            y_accum <= (16'd77 * r_val) + (16'd150 * g_val) + (16'd29 * b_val);
            gray_y  <= y_accum[15:8];
        end
    end

    // Stage 2: ROI Check & Subsampling (32x32 Downscale)
    wire in_roi_x = (pipe_x >= reg_roi_x0) && (pipe_x < (reg_roi_x0 + reg_roi_size));
    wire in_roi_y = (pipe_y >= reg_roi_y0) && (pipe_y < (reg_roi_y0 + reg_roi_size));

    wire [11:0] rel_x = pipe_x - reg_roi_x0;
    wire [11:0] rel_y = pipe_y - reg_roi_y0;

    // Sample exactly 1 pixel every `reg_step` pixels along X and Y
    wire sample_x = in_roi_x && ((rel_x % reg_step) == 0) && ((rel_x / reg_step) < 32);
    wire sample_y = in_roi_y && ((rel_y % reg_step) == 0) && ((rel_y / reg_step) < 32);
    wire sample_pixel = pipe_valid && sample_x && sample_y;

    wire [4:0] grid_x = rel_x / reg_step;
    wire [4:0] grid_y = rel_y / reg_step;
    wire [9:0] bnn_pixel_addr = {grid_y, grid_x}; // grid_y * 32 + grid_x (0..1023)

    // Stage 3: Normalize to Q1.15 signed fixed-point: Q15 = (Y * 257) - 32768
    // Result is signed 16-bit: range -32768 to +32767
    wire [15:0] q15_raw = (16'd257 * gray_y) - 16'd32768;
    wire signed [31:0] q15_sign_ext = {{16{q15_raw[15]}}, q15_raw};

    // Stage 4: Write to BNN Image BRAM
    reg [9:0] write_counter;

    always @(posedge clk) begin
        if (!rstn) begin
            bnn_img_we         <= 1'b0;
            bnn_img_waddr      <= 10'd0;
            bnn_img_wdata      <= 32'd0;
            frame_done_trigger <= 1'b0;
            write_counter      <= 10'd0;
        end else begin
            frame_done_trigger <= 1'b0;

            if (pipe_sof && pipe_valid) begin
                write_counter <= 10'd0;
            end

            if (sample_pixel) begin
                bnn_img_we    <= 1'b1;
                bnn_img_waddr <= bnn_pixel_addr;
                bnn_img_wdata <= q15_sign_ext;
                write_counter <= write_counter + 1'b1;

                // When 1024th pixel is written, trigger inference
                if (bnn_pixel_addr == 10'd1023) begin
                    frame_done_trigger <= 1'b1;
                end
            end else begin
                bnn_img_we <= 1'b0;
            end
        end
    end

endmodule
