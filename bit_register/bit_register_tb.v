// ----TESTBENCH FOR ONE BIT REGISTER--------------------------

// Written by Asanka Sovis (25/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

`timescale 1ns/1ns
`include "bit_register.v"
`include "../clock/test_clock.v"

module bit_register_tb;

    reg input_enable, output_enable, data;
    wire out, clk;

    test_clock clock(clk);

    bit_register uut(clk, input_enable, output_enable, data, out);

    initial begin
        $dumpfile("bit_register_tb.vcd");
        $dumpvars(0, bit_register_tb);

        input_enable <= 0;
        output_enable <= 0;
        data <= 0;

        #2 input_enable <= 1; // Enable input
        data <= 1; // Set data high
        // On next clock pulse, the memory should go hgih

        #2 input_enable <= 0; // Disable input
        data <= 0; // Set data low
        // Memory must stay high
        
        #3 output_enable <= 1;
        #1 output_enable <= 0; // Enable output for one clock pulse
        // Output must show high

        #2 input_enable <= 1;
        #2 input_enable <= 0; // Enable input for one clock pulse
        // Memory must switch to low
        
        #2 output_enable <= 1;
        #1 output_enable <= 0; // Enable output for one clock pulse
        // Output must show low

        #10 $finish;
        $display("Test Complete");
    end

endmodule