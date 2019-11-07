module one_to_four_line_demux (
    A,
    B,
    E,
    D
);
    input A, B, E;
    output [3:0] D;

    assign D[0] = ~(~A && ~B && ~E);
    assign D[1] = ~(~A &&  B && ~E);
    assign D[2] = ~( A && ~B && ~E);
    assign D[3] = ~( A &&  B && ~E);
endmodule
