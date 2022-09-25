// ----TESTBENCH FOR D FLIP FLOP--------------------------------

// Written by Asanka Sovis (08/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

`timescale 1ns/1ns
`include "d_flip_flop.v"
`include "../clock/test_clock.v"

module d_flip_flop_tb;

    reg data;
    wire clk, Q, not_Q;

    test_clock clock(clk);
    d_flip_flop uut(clk, data, Q, not_Q);

    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);

        data <= 0; // Data is low
        // Must set Q to low

        #10 data <= 1; // Data goes high
        // Must set Q to high on next pulse

        data <= 0; // Data goes low
        // Must not change the Q value

        data <= 1; // Data goes high
        // Must not change the Q value

        #10 $finish;
        $display("Test Complete");
    end

endmodule