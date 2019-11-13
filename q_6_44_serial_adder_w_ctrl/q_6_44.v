module q_6_44 (
    input rstn, clk, SI, SE,
    output [3:0] shift_reg_A_out, shift_reg_B_out,
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
        .Cin (Cin),
        .S (Sum),
        .Cout (Cout)
    );

    wire D_in;

    two_by_one_mux mux (
        .sel (SE),
        .x_in ({Cout, Cin}),
        .y_out (D_in)
    );

    d_ff dff (
        .rstb (rstn),
        .clk (clk),
        .D (D_in),
        .Q (Cin),
        .Qb ()
    );
endmodule

module two_by_one_mux (
    input sel,
    input [1:0] x_in,
    output y_out
);
    assign y_out = sel ? x_in[1] : x_in[0];
endmodule

module d_ff #(parameter RESET_VALUE = 1'b0)
(
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            Q <= RESET_VALUE;
        end
        else
        begin
            Q <= D;
        end
    end

    assign Qb = ~Q;
endmodule
