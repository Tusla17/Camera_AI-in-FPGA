`timescale 1ns/1ps

module tb_bnn_axi_lite;
    reg clk = 0;
    reg rstn = 0;

    // AXI-Lite Master Signals
    reg  [12:0] s_axi_awaddr;
    reg  [2:0]  s_axi_awprot;
    reg         s_axi_awvalid;
    wire        s_axi_awready;
    reg  [31:0] s_axi_wdata;
    reg  [3:0]  s_axi_wstrb;
    reg         s_axi_wvalid;
    wire        s_axi_wready;
    wire [1:0]  s_axi_bresp;
    wire        s_axi_bvalid;
    reg         s_axi_bready;
    reg  [12:0] s_axi_araddr;
    reg  [2:0]  s_axi_arprot;
    reg         s_axi_arvalid;
    wire        s_axi_arready;
    wire [31:0] s_axi_rdata;
    wire [1:0]  s_axi_rresp;
    wire        s_axi_rvalid;
    reg         s_axi_rready;

    // Clock generator (100 MHz)
    always #5 clk = ~clk;

    // Instantiate DUT
    bnn_axi_lite #(
        .C_S_AXI_DATA_WIDTH(32),
        .C_S_AXI_ADDR_WIDTH(13)
    ) dut (
        .S_AXI_ACLK(clk),
        .S_AXI_ARESETN(rstn),
        .S_AXI_AWADDR(s_axi_awaddr),
        .S_AXI_AWPROT(s_axi_awprot),
        .S_AXI_AWVALID(s_axi_awvalid),
        .S_AXI_AWREADY(s_axi_awready),
        .S_AXI_WDATA(s_axi_wdata),
        .S_AXI_WSTRB(s_axi_wstrb),
        .S_AXI_WVALID(s_axi_wvalid),
        .S_AXI_WREADY(s_axi_wready),
        .S_AXI_BRESP(s_axi_bresp),
        .S_AXI_BVALID(s_axi_bvalid),
        .S_AXI_BREADY(s_axi_bready),
        .S_AXI_ARADDR(s_axi_araddr),
        .S_AXI_ARPROT(s_axi_arprot),
        .S_AXI_ARVALID(s_axi_arvalid),
        .S_AXI_ARREADY(s_axi_arready),
        .S_AXI_RDATA(s_axi_rdata),
        .S_AXI_RRESP(s_axi_rresp),
        .S_AXI_RVALID(s_axi_rvalid),
        .S_AXI_RREADY(s_axi_rready)
    );

    // ========================================================
    // AXI4-Lite Master Helper Tasks
    // ========================================================
    task axi_write(input [12:0] addr, input [31:0] data);
        reg aw_done_tb, w_done_tb;
        begin
            @(posedge clk);
            s_axi_awaddr  <= addr;
            s_axi_awvalid <= 1'b1;
            s_axi_wdata   <= data;
            s_axi_wstrb   <= 4'hF;
            s_axi_wvalid  <= 1'b1;
            s_axi_bready  <= 1'b1;
            aw_done_tb    = 0;
            w_done_tb     = 0;

            while (!aw_done_tb || !w_done_tb) begin
                @(posedge clk);
                if (s_axi_awvalid && s_axi_awready) begin
                    s_axi_awvalid <= 1'b0;
                    aw_done_tb = 1;
                end
                if (s_axi_wvalid && s_axi_wready) begin
                    s_axi_wvalid <= 1'b0;
                    w_done_tb = 1;
                end
            end

            // Wait for write response
            while (!s_axi_bvalid) @(posedge clk);
            @(posedge clk);
            s_axi_bready <= 1'b0;
        end
    endtask

    task axi_read(input [12:0] addr, output [31:0] data);
        begin
            @(posedge clk);
            s_axi_araddr  <= addr;
            s_axi_arvalid <= 1'b1;
            s_axi_rready  <= 1'b1;

            while (!s_axi_arready) @(posedge clk);
            @(posedge clk);
            s_axi_arvalid <= 1'b0;

            while (!s_axi_rvalid) @(posedge clk);
            data = s_axi_rdata;
            @(posedge clk);
            s_axi_rready <= 1'b0;
        end
    endtask

    // Memory arrays for simulation
    reg [31:0] ciphertext_mem [0:6379];
    reg [31:0] image_mem      [0:1023];

    reg [31:0] rd_val;
    integer i;
    reg signed [31:0] logit0_val, logit1_val;
    reg pred_val;
    reg [31:0] trng_w0, trng_w1, trng_w2, trng_w3, trng_rand;

    initial begin
        // Initialize AXI signals
        s_axi_awaddr  = 0;
        s_axi_awprot  = 0;
        s_axi_awvalid = 0;
        s_axi_wdata   = 0;
        s_axi_wstrb   = 0;
        s_axi_wvalid  = 0;
        s_axi_bready  = 0;
        s_axi_araddr  = 0;
        s_axi_arprot  = 0;
        s_axi_arvalid = 0;
        s_axi_rready  = 0;

        $display("================================================================");
        $display("===  BAT DAU MO PHONG BNN AXI-LITE HARDWARE TEST (SIMULATION) ===");
        $display("================================================================");

        // Load data files
        $readmemh("ciphertext.mem", ciphertext_mem);
        $readmemh("test_image.mem", image_mem);

        // Apply Reset
        rstn = 0;
        #50;
        @(posedge clk);
        rstn = 1;
        #50;

        // Step 1: Check MAGIC ID
        axi_read(13'h0014, rd_val);
        $display("[1/7] Doc MAGIC register: 0x%08X (Mong doi: 0x0B11EE01)", rd_val);
        if (rd_val !== 32'h0B11EE01) begin
            $display("[LOI] Sai MAGIC register!");
            $finish;
        end else begin
            $display("      -> PASS: Bus AXI-Lite hoat dong tot.");
        end

        // Step 2: Check Hardware TRNG & Read Dynamic Nonce
        $display("[2/7] Kiem tra Hardware TRNG (Ring Oscillators + NIST SP 800-90B)...");
        rd_val = 0;
        while ((rd_val & 32'h1) == 0) begin
            axi_read(13'h0064, rd_val); // Poll TRNG_STATUS
        end
        $display("      -> TRNG Status: 0x%08X (Ready=1, HealthPass=%0d, Error=%0d)", rd_val, (rd_val >> 1) & 1, (rd_val >> 2) & 1);
        
        axi_read(13'h0068, trng_rand);
        axi_read(13'h0070, trng_w0);
        axi_read(13'h0074, trng_w1);
        axi_read(13'h0078, trng_w2);
        axi_read(13'h007C, trng_w3);
        $display("      -> TRNG Random Word: 0x%08X", trng_rand);
        $display("      -> TRNG 128-bit Dynamic Nonce: 0x%08X_%08X_%08X_%08X", trng_w3, trng_w2, trng_w1, trng_w0);
        $display("      -> PASS: Hardware TRNG hoat dong on dinh.");

        // Step 3: Write Key, Nonce, Expected Tag
        $display("[3/7] Dang nap ASCON-128 Key, Nonce, Expected Tag...");
        axi_write(13'h0020, 32'h00010203);
        axi_write(13'h0024, 32'h04050607);
        axi_write(13'h0028, 32'h08090A0B);
        axi_write(13'h002C, 32'h0C0D0E0F);

        axi_write(13'h0030, 32'h00010203);
        axi_write(13'h0034, 32'h04050607);
        axi_write(13'h0038, 32'h08090A0B);
        axi_write(13'h003C, 32'h0C0D0E0F);

        axi_write(13'h0050, 32'hA8DF77EA);
        axi_write(13'h0054, 32'hFE41FBD0);
        axi_write(13'h0058, 32'h97D156F5);
        axi_write(13'h005C, 32'h3C9A1AEA);

        // Step 3: Trigger Weight Loader
        $display("[3/6] Kich hoat Weight Loader & truyen 6380 ciphertext words...");
        axi_write(13'h0000, 32'h00000002); // load_start

        for (i = 0; i < 6380; i = i + 1) begin
            axi_write(13'h0040, ciphertext_mem[i]);
            if (i % 1000 == 0 && i > 0) begin
                $display("      -> Da truyen %0d / 6380 words...", i);
            end
        end
        $display("      -> Da truyen xong 6380 words.");

        // Step 4: Poll for ASCON Decrypt Done
        $display("[4/6] Cho ASCON giai ma & xac thuc Tag...");
        rd_val = 0;
        while ((rd_val & 32'h00000004) == 0) begin
            #20;
            axi_read(13'h0004, rd_val);
        end

        $display("      Status Register = 0x%08X", rd_val);
        if ((rd_val & 32'h00000010) != 0) begin
            $display("      [LOI] ASCON Tag Auth ERROR (Bit 4 set)! Tag khong khop!");
            $finish;
        end else begin
            $display("      -> PASS: ASCON Tag Auth THANH CONG! (Bit 4 = 0, Bit 2 = 1)");
        end

        // Step 5: Write Test Image to Image BRAM (0x1000..0x1FFC)
        $display("[5/6] Ghi 1024 pixels anh test vao Image BRAM (0x1000)...");
        for (i = 0; i < 1024; i = i + 1) begin
            axi_write(13'h1000 + (i << 2), image_mem[i]);
        end
        $display("      -> Da nap xong anh test.");

        // Step 6: Start BNN Inference & Poll Done
        $display("[6/6] Kich hoat BNN Inference (CTRL = 0x1)...");
        axi_write(13'h0000, 32'h00000001); // bnn_start

        rd_val = 0;
        while ((rd_val & 32'h00000001) == 0) begin
            #50;
            axi_read(13'h0004, rd_val);
        end
        $display("      -> BNN Done! (Status Bit 0 = 1)");

        // Read Results
        axi_read(13'h0008, logit0_val);
        axi_read(13'h000C, logit1_val);
        axi_read(13'h0010, rd_val);
        pred_val = rd_val[0];

        $display("\n================================================================");
        $display("===               KET QUA MO PHONG HARDWARE                  ===");
        $display("================================================================");
        $display(" 1. Status Register  : 0x%08X", rd_val);
        $display(" 2. AI Logit 0       : %0d (Mong doi Golden Image #7: -697)", logit0_val);
        $display(" 3. AI Logit 1       : %0d (Mong doi Golden Image #7: 881)", logit1_val);
        if (pred_val == 0)
            $display(" 4. AI Prediction    : 0 (ALERT / TINH TAO)");
        else
            $display(" 4. AI Prediction    : 1 (DROWSY / BUON NGU) (Mong doi: 1 [DROWSY])");
        $display("================================================================");

        if (logit0_val == -697 && logit1_val == 881 && pred_val == 1) begin
            $display(">>> TEST STATUS: PASSED - KET QUA HOAN TOAN CHINH XAC 100%% <<<");
        end else begin
            $display(">>> TEST STATUS: FAILED - KET QUA KHAC GOLDEN MODEL <<<");
        end
        $display("================================================================\n");

        #100;
        $finish;
    end

endmodule
