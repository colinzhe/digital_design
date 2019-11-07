module tri_buf (
    A,
    B,
    E
);
    input A, E;
    output B;

    assign B = (E) ? A : 1'bz;
endmodule
