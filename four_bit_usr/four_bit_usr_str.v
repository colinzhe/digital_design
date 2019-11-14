module four_bit_usr_str (
    input rstb, clk,
    input [1:0] mode,
    input [3:0] par_in,
    input SI,
    output [3:0] par_out,
    output [3:0] shift_reg,
    output reg SO
);
    wire [3:0] D_in;

    assign par_out = shift_reg;
    
    d_ff dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[0]),
        .Q (shift_reg[0]),
        .Qb ()
    );

    d_ff dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[1]),
        .Q (shift_reg[1]),
        .Qb ()
    );

    d_ff dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[2]),
        .Q (shift_reg[2]),
        .Qb ()
    );

    d_ff dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[3]),
        .Q (shift_reg[3]),
        .Qb ()
    );

    four_by_one_mux mux_0 (
        .sel (mode),
        .x_in ({par_in[0], SI, shift_reg[1], shift_reg[0]}),
        .y_out (D_in[0])
    );

    four_by_one_mux mux_1 (
        .sel (mode),
        .x_in ({par_in[1], shift_reg[0], shift_reg[2], shift_reg[1]}),
        .y_out (D_in[1])
    );

    four_by_one_mux mux_2 (
        .sel (mode),
        .x_in ({par_in[2], shift_reg[1], shift_reg[3], shift_reg[2]}),
        .y_out (D_in[2])
    );

    four_by_one_mux mux_3 (
        .sel (mode),
        .x_in ({par_in[3], shift_reg[2], SI, shift_reg[3]}),
        .y_out (D_in[3])
    );

    always @ (mode, shift_reg)
    begin
        if (mode == 2'b01) SO = shift_reg[0];
        else if (mode == 2'b10) SO = shift_reg[3];
        else SO = 1'bZ;
    end
endmodule

module four_by_one_mux (
    input [1:0] sel,
    input [3:0] x_in,
    output reg y_out
);
    always @ (sel, x_in)
    begin
        case (sel)
            2'b00 : y_out = x_in[0];
            2'b01 : y_out = x_in[1];
            2'b10 : y_out = x_in[2];
            2'b11 : y_out = x_in[3];
            default : y_out = x_in[0];
        endcase
    end
endmodule

module d_ff #(parameter RESET_VALUE = 1'b0)
(
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb) Q <= RESET_VALUE;
        else Q <= D;
    end

    assign Qb = ~Q;
endmodule
