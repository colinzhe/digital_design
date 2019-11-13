module q_6_43 (
    input rstb, clk,
    input [1:0] mode, // 0 = hold, 1 = shift, 2 = load
    input [3:0] I,
    output [3:0] SR_A, SR_B,
    output SO_A, SO_B
);
    wire [3:0] sra_D_in;
    wire [3:0] srb_D_in;

    assign SO_A = SR_A[0];
    assign SO_B = SR_B[0];

    two_by_one_mux sra_mux_0 (
        .sel (mode),
        .x_in ({SR_A[0], I[0], SR_A[1], SR_A[0]}),
        .y_out (sra_D_in[0])
    );

    two_by_one_mux sra_mux_1 (
        .sel (mode),
        .x_in ({SR_A[1], I[1], SR_A[2], SR_A[1]}),
        .y_out (sra_D_in[1])
    );

    two_by_one_mux sra_mux_2 (
        .sel (mode),
        .x_in ({SR_A[2], I[2], SR_A[3], SR_A[2]}),
        .y_out (sra_D_in[2])
    );

    two_by_one_mux sra_mux_3 (
        .sel (mode),
        .x_in ({SR_A[3], I[3], SR_A[0], SR_A[3]}),
        .y_out (sra_D_in[3])
    );

    d_ff sra_dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (sra_D_in[0]),
        .Q (SR_A[0]),
        .Qb ()
    );

    d_ff sra_dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (sra_D_in[1]),
        .Q (SR_A[1]),
        .Qb ()
    );

    d_ff sra_dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (sra_D_in[2]),
        .Q (SR_A[2]),
        .Qb ()
    );

    d_ff sra_dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (sra_D_in[3]),
        .Q (SR_A[3]),
        .Qb ()
    );

    two_by_one_mux srb_mux_0 (
        .sel (mode),
        .x_in ({SR_B[0], SR_B[0], SR_B[1], SR_B[0]}),
        .y_out (srb_D_in[0])
    );

    two_by_one_mux srb_mux_1 (
        .sel (mode),
        .x_in ({SR_B[1], SR_B[1], SR_B[2], SR_B[1]}),
        .y_out (srb_D_in[1])
    );

    two_by_one_mux srb_mux_2 (
        .sel (mode),
        .x_in ({SR_B[2], SR_B[2], SR_B[3], SR_B[2]}),
        .y_out (srb_D_in[2])
    );

    two_by_one_mux srb_mux_3 (
        .sel (mode),
        .x_in ({SR_B[3], SR_B[3], SR_A[0], SR_B[3]}),
        .y_out (srb_D_in[3])
    );

    d_ff srb_dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (srb_D_in[0]),
        .Q (SR_B[0]),
        .Qb ()
    );

    d_ff srb_dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (srb_D_in[1]),
        .Q (SR_B[1]),
        .Qb ()
    );

    d_ff srb_dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (srb_D_in[2]),
        .Q (SR_B[2]),
        .Qb ()
    );

    d_ff srb_dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (srb_D_in[3]),
        .Q (SR_B[3]),
        .Qb ()
    );
endmodule

module two_by_one_mux (
    input [1:0] sel,
    input [3:0] x_in,
    output reg y_out
);
    always @ (x_in, sel)
    begin
        if (sel == 2'b00) y_out = x_in[0];
        else if (sel == 2'b01) y_out = x_in[1];
        else if (sel == 2'b10) y_out = x_in[2];
        else y_out = x_in[0];
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
