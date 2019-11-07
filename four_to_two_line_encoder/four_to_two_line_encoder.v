module four_to_two_line_encoder (
    D,
    x,
    y,
    V
);
    input [3:0] D;
    output x, y, V;

    assign x = D[3] || D[2];
    assign y = D[3] || (D[1] && ~D[2]);
    assign V = |D;
endmodule
