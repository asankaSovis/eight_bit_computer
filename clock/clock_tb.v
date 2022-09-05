`timescale 1ns/1ns
`include "clock.v"

module clock_tb;

    reg apulse, select, mpulse, hlt;
    wire clk;

    clock uut(apulse, select, mpulse, hlt, clk);

    always begin
        #1 apulse = ~apulse;
        #1 apulse = ~apulse;
    end

    initial begin
        $dumpfile("clock_tb.vcd");
        $dumpvars(0, clock_tb);

        apulse <= 1;

        select <= 1; // Selecting astable pulse
        mpulse <= 0; // Resetting manual pulse
        hlt <= 0; // Resetting halt signal

        #10 mpulse <= 1; // Set manual pulse
        // Must still return astable pulse as manual pulse is not yet selected

        #10 select <= 0; // Select manual pulse
        // Must now return manual pulse

        #5 mpulse <= 0; // Lowering the manual pulse

        #10 hlt <= 1; // Halting the clock
        // Must not return anything from this point onward

        #5 mpulse <= 1; // Setting the manual piulse

        #10 select <= 1; // Selecting astable clock

        #10 $finish;

        $display("Test Complete");
    end

endmodule