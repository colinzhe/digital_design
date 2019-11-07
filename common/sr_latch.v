module sr_latch (
    input S, R,
    output Q, Qn
);
    nand
        G1 (Q, S, Qn),
        G2 (Qn, R, Q);
endmodule
