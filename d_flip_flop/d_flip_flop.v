// ----D FLIP FLOP MODULE--------------------------------------
// Storage of a one bit of data
// Input clk -  Clock input
// Input data -  Data bit recieved
// Output Q - Sotred output
// Output not_Q - Inverted stored output

// Written by Asanka Sovis (08/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

module d_flip_flop (clk, data, Q, not_Q);

    input clk, data;
    output Q, not_Q;

    wire feedback1, feedback2;
    reg a;

    assign feedback1 = ~((~(a)) || feedback2);
    assign feedback2 = ~((a) || feedback1);

    always @(posedge clk) 
    begin
        a <= data;
    end 

    assign Q = feedback1;
    assign not_Q = feedback2;

endmodule