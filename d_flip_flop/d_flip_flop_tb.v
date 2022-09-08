`timescale 1ns/1ns
`include "d_flip_flop.v"

module d_flip_flop_tb;

    reg enable, data;
    wire Q, not_Q;

    d_flip_flop uut(enable, data, Q, not_Q);

    initial begin
        $dumpfile("d_flip_flop_tb.vcd");
        $dumpvars(0, d_flip_flop_tb);

        enable <= 1;
        data <= 0;

        #10 data <= 1;

        #10 enable <= 0;
        data <= 0;

        #10 enable <= 1;

        #10 enable <= 0;
        data <= 1;

        #10 $finish;
        $display("Test Complete");
    end

endmodule