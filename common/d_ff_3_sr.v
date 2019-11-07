module d_ff_3_sr (
    input D, clk,
    output Q, Qn
);
    wire S, R, T;

    sr_latch sr_latch_0 (
        .S (S),
        .R (R),
        .Q (Q),
        .Qn (Qn)
    );

    sr_latch sr_latch_1 (
        .S(T),
        .R(clk),
        .Q(),
        .Qn(S)
    );

    nand
        G1 (R, S, clk, T),
        G2 (T, R, D);
endmodule
