module clk_gen (
    input logic rst_b, clk_in,
    output logic clk_out
);
    reg [1:0] cntr;
    
    always @ (clk_in)
    begin
        if (!rst_b)
            cntr <= 2'b00;
            clk_out <= 1'b0;
        else
        begin
            cntr <= cntr + 1'b1;
            if (cntr == 2'b11) clk_out <= ~clk_out;
        end
    end
endmodule