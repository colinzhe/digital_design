module q_6_51 (
    input rstb, clk, x_in,
    output reg [2:0] shift_reg,
    output y_out
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb) shift_reg <= 3'b000;
        else shift_reg <= {x_in, shift_reg[2:1]};
    end

    assign y_out = &shift_reg;
endmodule
