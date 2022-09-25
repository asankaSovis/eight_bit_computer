`timescale 1ns/1ns
`include "test_clock.v"

module test_clock_tb;

    wire clk;

    test_clock uut(clk);

    initial begin
        $dumpfile("test_clock_tb.vcd");
        $dumpvars(0, test_clock_tb);

        #10 $finish;

        $display("Test Complete");
    end

endmodule