`timescale 1ns/1ns  // Define timescale

module Traffic_Light_Controller_TB;
    reg clk, rst;
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    // Instantiate the DUT (Device Under Test)
    Traffic_Light_Controller dut (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_S(light_S),
        .light_M2(light_M2),
        .light_MT(light_MT)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #(1000000000 / 2) clk = ~clk;
    end

    // Reset sequence
    initial begin
        // Set up waveform dumping
        $dumpfile("waveform.vcd");  // Specify the name of the dump file
        $dumpvars(0, Traffic_Light_Controller_TB);  // Dump all variables in the testbench module

        rst = 0;
        #1000000000;  // Delay for 1e9 time units (1 second)
        rst = 1;
        #1000000000;  // Delay for 1e9 time units (1 second)
        rst = 0;
      #(1000000000 * 2000);  // Delay for 1e9 * 200 time units (200 seconds)

        $finish;  // End simulation
    end
endmodule
