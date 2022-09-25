// ----BIT REGISTER MODULE-------------------------------------
// One bit register to store a bit
// Input clk -  Clock input
// Input input_enable -  Enable the input
// Input output_enable - Enable the output
// Input data - Input data
// Output out - Output data

// Written by Asanka Sovis (25/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

`include "../d_flip_flop/d_flip_flop.v"

module bit_register(clk, input_enable, output_enable, data, out);

    input clk, input_enable, output_enable, data;
    output out;

    wire not_out;
    wire buf_out;

    wire mem_data;

    assign mem_data = (buf_out && ~input_enable) || (input_enable && data);

    d_flip_flop flip_memory (clk, mem_data, buf_out, not_out);

    buffer buf_memory (buf_out, output_enable, out);

endmodule

// ----BUFFER MODULE-------------------------------------------
// Buffer to hold data without output
// Input data - Input data
// Input enable - Enable the output
// Output out - Output data

// Written by Asanka Sovis (24/09/2022)
// Based on the 8-bit Computer series by Ben Eater
// ------------------------------------------------------------

module buffer(data, enable, out);

    input data, enable;
    output reg out;

    always @* begin
        if (enable == 1) begin
            out <= data;
        end
        else begin
            out <= 1'bZ;
        end
    end

endmodule