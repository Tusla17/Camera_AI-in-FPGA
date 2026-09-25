`timescale 1ns/1ps

module tb_trng;
    reg clk = 0;
    reg rstn = 0;
    reg enable = 0;
    reg reseed = 0;
    reg health_rst = 0;

    wire trng_ready;
    wire health_pass;
    wire health_error;
    wire [4:0] entropy_count;
    wire [31:0] trng_data_out;
    wire [127:0] trng_nonce_out;

    always #5 clk = ~clk; // 100 MHz clock

    trng #(
        .NUM_RINGS(8),
        .RCT_CUTOFF(32),
        .APT_WINDOW(512),
        .APT_MIN_ONES(180),
        .APT_MAX_ONES(332)
    ) dut (
        .clk(clk),
        .rstn(rstn),
        .enable(enable),
        .reseed(reseed),
        .health_rst(health_rst),
        .trng_ready(trng_ready),
        .health_pass(health_pass),
        .health_error(health_error),
        .entropy_count(entropy_count),
        .trng_data_out(trng_data_out),
        .trng_nonce_out(trng_nonce_out)
    );

    integer i;

    initial begin
        $display("================================================================");
        $display("===           TESTBENCH HARDWARE TRNG (NIST SP 800-90B)       ===");
        $display("================================================================");
        
        #100;
        rstn = 1;
        #50;
        enable = 1;
        
        $display("[1/3] Enabling TRNG entropy accumulation...");
        
        // Wait until TRNG collects 128 random bits
        for (i = 0; i < 2000; i = i + 1) begin
            @(posedge clk);
            if (trng_ready) begin
                $display("      -> TRNG Ready achieved at cycle %0d!", i);
                i = 2000;
            end
        end

        if (!trng_ready) begin
            $display("[ERROR]: TRNG timeout waiting for ready flag!");
            $stop;
        end

        $display("[2/3] Checking NIST SP 800-90B Health Tests:");
        $display("      -> Health Pass : %0d (1 = PASS)", health_pass);
        $display("      -> Health Error: %0d (0 = NO ERROR)", health_error);
        $display("      -> Random Data : 0x%08X", trng_data_out);
        $display("      -> 128-bit Nonce: 0x%032X", trng_nonce_out);

        if (health_pass && !health_error && trng_nonce_out != 128'd0) begin
            $display("================================================================");
            $display(">>> TEST TRNG PASSED: ENTROPY & NONCE GENERATED SUCCESSFULLY <<<");
            $display("================================================================");
        end else begin
            $display("[ERROR]: TRNG test verification failed!");
            $stop;
        end

        #200;
        $finish;
    end

endmodule
