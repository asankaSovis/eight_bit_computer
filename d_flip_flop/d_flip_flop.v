// ----D FLIP FLOP MODULE--------------------------------------
// Storage of a one bit of data
// Input enable -  Enables the memory to store the recieved bit
// Input data -  Data bit recieved
// Output Q - Sotred output
// Output not_Q - Inverted stored output

// Written by Asanka Sovis (08/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

module d_flip_flop (enable, data, Q, not_Q);

    input enable, data;
    output Q, not_Q;

    wire feedback1, feedback2;

    assign feedback1 = ~((~(data) && enable) || feedback2);
    assign feedback2 = ~((data && enable) || feedback1);

    assign Q = feedback1;
    assign not_Q = feedback2;

endmodule