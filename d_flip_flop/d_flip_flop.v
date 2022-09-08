module d_flip_flop (enable, data, Q, not_Q);

    input enable, data;
    output Q, not_Q;

    wire feedback1, feedback2;

    assign feedback1 = ~((~(data) && enable) || feedback2);
    assign feedback2 = ~((data && enable) || feedback1);

    assign Q = feedback1;
    assign not_Q = feedback2;

endmodule