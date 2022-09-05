// ----CLOCK MODULE--------------------------------------------
// Outputs the clock pulse needed to drive the computer
// Input apulse -  Astable pulse from a clock source
// Input select -  Select line (Select astable pulse if high and
//                          manual pulse when low)
// Input mpulse - Manual pulse that a user can send
// Input hlt - Overrides all other inputs and halt the clock
// Output clk - The returned clock pulse

// Written by Asanka Sovis (04/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

module clock (apulse, select, mpulse, hlt, clk);

    input apulse, select, mpulse, hlt;
    output clk;

    assign clk = ((apulse && select) || (mpulse && ~select)) && ~hlt;

endmodule