// ----TESTBENCH FOR BUFFER MODULE-----------------------------

// Written by Asanka Sovis (24/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

`timescale 1ns/1ns
`include "bit_register.v"

module buffer_tb;

    reg data, enable;
    wire out;

    buffer uut(data, enable, out);

    initial begin
        $dumpfile("buffer_tb.vcd");
        $dumpvars(0, buffer_tb);

        data <= 0;
        enable <= 0; // Data and enable is low
        // Output must stay high impedance

        #5 data <= 1; // Set data to high
        // No change

        #5 enable <= 1; // Enable
        // Output should go high

        #5 data <= 0; // Set data to low
        // Output should go low

        #5 data <= 1; // Set data to high
        // Output should go high

        #5 enable <= 0; // Disable
        // Output should go high impedance

        #10 $finish;
        $display("Test Complete");
    end

endmodule