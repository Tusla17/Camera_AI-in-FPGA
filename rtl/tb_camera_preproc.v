`timescale 1ns/1ps

module tb_camera_preproc;
    reg clk = 0;
    reg rstn = 0;

    // Stream inputs
    reg [23:0] s_axis_tdata = 0;
    reg        s_axis_tvalid = 0;
    wire       s_axis_tready;
    reg        s_axis_tuser = 0;
    reg        s_axis_tlast = 0;

    // Config inputs
    reg [11:0] roi_x0 = 12'd100;
    reg [11:0] roi_y0 = 12'd50;
    reg [11:0] roi_size = 12'd320;
    reg        cfg_valid = 1;

    // BNN Write Interface outputs
    wire        bnn_img_we;
    wire [9:0]  bnn_img_waddr;
    wire [31:0] bnn_img_wdata;
    wire        frame_done_trigger;

    // Clock generator (100 MHz)
    always #5 clk = ~clk;

    // Instantiate DUT with smaller frame for fast simulation (640x480)
    camera_preproc #(
        .FRAME_WIDTH(640),
        .FRAME_HEIGHT(480),
        .DEFAULT_ROI_X0(100),
        .DEFAULT_ROI_Y0(50),
        .DEFAULT_ROI_SIZE(320)
    ) dut (
        .clk(clk),
        .rstn(rstn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tlast(s_axis_tlast),
        .roi_x0(roi_x0),
        .roi_y0(roi_y0),
        .roi_size(roi_size),
        .cfg_valid(cfg_valid),
        .bnn_img_we(bnn_img_we),
        .bnn_img_waddr(bnn_img_waddr),
        .bnn_img_wdata(bnn_img_wdata),
        .frame_done_trigger(frame_done_trigger)
    );

    integer x, y;
    integer write_count = 0;
    reg trigger_received = 0;

    always @(posedge clk) begin
        if (bnn_img_we) begin
            write_count = write_count + 1;
        end
        if (frame_done_trigger) begin
            trigger_received = 1;
        end
    end

    initial begin
        $display("================================================================");
        $display("===    BAT DAU MO PHONG TESTBENCH CAMERA PREPROCESSOR        ===");
        $display("================================================================");

        rstn = 0;
        #50;
        @(posedge clk);
        rstn = 1;
        #50;

        $display("[1/3] Phat luong AXI4-Stream Video (640x480, RGB)...");

        // Send a 640x480 frame
        for (y = 0; y < 480; y = y + 1) begin
            for (x = 0; x < 640; x = x + 1) begin
                @(posedge clk);
                s_axis_tvalid <= 1'b1;
                s_axis_tuser  <= (x == 0 && y == 0) ? 1'b1 : 1'b0; // SOF
                s_axis_tlast  <= (x == 639) ? 1'b1 : 1'b0;         // EOL

                // Pattern: gradient RGB
                s_axis_tdata[23:16] <= (x + y) & 8'hFF; // R
                s_axis_tdata[15:8]  <= (x) & 8'hFF;     // G
                s_axis_tdata[7:0]   <= (y) & 8'hFF;     // B
            end
        end

        @(posedge clk);
        s_axis_tvalid <= 1'b0;
        s_axis_tuser  <= 1'b0;
        s_axis_tlast  <= 1'b0;

        #200;

        $display("\n================================================================");
        $display("===               KET QUA MO PHONG PREPROCESSOR              ===");
        $display("================================================================");
        $display(" 1. So luong diem anh ghi vao BNN BRAM: %0d (Mong doi: 1024)", write_count);
        $display(" 2. Tin hieu frame_done_trigger       : %0d (Mong doi: 1)", trigger_received);
        $display("================================================================");

        if (write_count == 1024 && trigger_received == 1) begin
            $display(">>> TEST STATUS: PASSED - CAMERA PREPROCESSOR HOAT DONG DUNG <<<");
        end else begin
            $display(">>> TEST STATUS: FAILED - LOI XU LY TIEN XU LY ANH <<<");
        end
        $display("================================================================\n");

        #100;
        $finish;
    end

endmodule
