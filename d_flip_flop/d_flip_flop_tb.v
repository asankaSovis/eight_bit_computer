// ----TESTBENCH FOR D FLIP FLOP--------------------------------

// Written by Asanka Sovis (08/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

`timescale 1ns/1ns
`include "d_flip_flop.v"

module d_flip_flop_tb;

    reg enable, data;
    wire Q, not_Q;

    d_flip_flop uut(enable, data, Q, not_Q);

    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);

        enable <= 1; // Enable data storage
        data <= 0; // Data is low
        // Must set Q to low

        #10 data <= 1; // Data goes high
        // Must set Q to high

        #10 enable <= 0; // Disable data storage
        data <= 0; // Data goes low
        // Must not change the Q value

        #10 enable <= 1; // Enable data storage
        // Must set Q to low

        #10 enable <= 0; // Disable data storage
        data <= 1; // Data goes high
        // Must not change the Q value

        #10 $finish;
        $display("Test Complete");
    end

endmodule