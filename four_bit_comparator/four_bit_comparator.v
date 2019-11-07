module four_bit_comparator (
    A,
    B,
    AeqB,
    AgtB,
    AltB
);
    input [3:0] A, B;
    output AeqB, AgtB, AltB;

    wire [3:0] x;

    //xnor (x, A, B);
    assign x = A ~^ B;

    assign AeqB = &x;

    assign AgtB = (A[3] && ~B[3]) || (x[3] && A[2] && ~B[2]) || (&x[3:2] && A[1] && ~B[1])
        || (&x[3:1] && A[0] && ~B[0]);

    assign AltB = (~A[3] && B[3]) || (x[3] && ~A[2] && B[2]) || (&x[3:2] && ~A[1] && B[1])
        || (&x[3:1] && ~A[0] && B[0]);
endmodule
