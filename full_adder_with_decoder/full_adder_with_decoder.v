module full_adder_with_decoder (
    A,
    B,
    Cin,
    S,
    Cout
);
    input A, B, Cin;
    output S, Cout;

    wire [8:0] D;

    three_to_eight_line_decoder three_to_eight_line_decoder_0 (
        .x (A),
        .y (B),
        .z (Cin),
        .D (D)
    );

    assign S = D[1] || D[2] || D[4] || D[7];
    assign Cout = D[3] || D[5] || D[6] || D[7];
endmodule
