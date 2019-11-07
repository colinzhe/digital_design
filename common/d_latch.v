module d_latch (
    input D, En,
    output Q, Qn
);
    wire T1, T2;

    sr_latch sr_latch_0 (
        .S (T1),
        .R (T2),
        .Q (Q),
        .Qn (Qn)
    );

    nand
        G1 (T1, D, En),
        G2 (T2, ~D, En);
endmodule
