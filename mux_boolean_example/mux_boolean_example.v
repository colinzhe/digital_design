module mux_boolean_example (
    A,
    B,
    C,
    D,
    F
);
    input A, B, C, D;
    output F;

    wire [3:0] S;
    wire [7:0] I;

    assign S = {A, B, C};

    assign I[1:0] = {D, D};
    assign I[2] = ~D;
    assign I[4:3] = 2'b00;
    assign I[5] = D;
    assign I[7:6] = 2'b11;

    eight_to_one_line_mux eight_to_one_line_mux_0 (
        .S (S),
        .I (I),
        .Y (F)
    );
endmodule
