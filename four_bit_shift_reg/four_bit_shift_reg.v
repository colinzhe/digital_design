module four_bit_shift_reg (
    input rstn, clk, SI, SE,
    output SO,
    output reg [3:0] shift_reg
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            shift_reg <= 4'b0000;
        end
        else
        begin
            if (SE)
            begin
                shift_reg[3] <= shift_reg[2];
                shift_reg[2] <= shift_reg[1];
                shift_reg[1] <= shift_reg[0];
                shift_reg[0] <= SI;
            end
            else
            begin
                shift_reg <= shift_reg;
            end
        end
    end

    assign SO = shift_reg[3];
endmodule
