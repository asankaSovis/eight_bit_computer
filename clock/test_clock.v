`timescale 1ns/1ns
`include "../clock/clock.v"

module test_clock (clk);

    reg apulse, select, mpulse, hlt;
    output clk;

    initial apulse = 1;

    initial select = 1; // Selecting astable pulse
    initial mpulse = 0; // Resetting manual pulse
    initial hlt = 0; // Resetting halt signal

    clock test(apulse, select, mpulse, hlt, clk);

    always begin
        #2 apulse = ~apulse;
        #2 apulse = ~apulse;
    end

endmodule