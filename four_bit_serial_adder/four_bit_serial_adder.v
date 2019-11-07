module four_bit_serial_adder (
    input rstn, clk, SI, SE,
    output [3:0] shift_reg_A_out, shift_reg_B_out,
    output reg Q,
    output x, y, Cin, Sum, Cout
);
    four_bit_shift_reg shift_reg_A (
        .rstn (rstn),
        .clk (clk),
        .SI (Sum),
        .SE (SE),
        .SO (x),
        .shift_reg (shift_reg_A_out)
    );

    four_bit_shift_reg shift_reg_B (
        .rstn (rstn),
        .clk (clk),
        .SI (SI),
        .SE (SE),
        .SO (y),
        .shift_reg (shift_reg_B_out)
    );

    full_adder adder_0 (
        .x (x),
        .y (y),
        .Cin (Q),
        .S (Sum),
        .Cout (Cout)
    );

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
        end
        else
        begin
            Q <= Cout;
        end
    end

    assign Cin = Q;
endmodule
