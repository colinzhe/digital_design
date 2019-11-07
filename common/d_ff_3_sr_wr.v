module d_ff_3_sr_wr (
    input D, clk, rstn,
    output Q, Qn
);
    wire S, R, T1, T2;

    nand
        G1 (T1, T2, S),
        G2 (S, T1, clk, rstn),
        G3 (R, S, clk, T2),
        G4 (T2, R, D, rstn),
        G5 (Q, S, Qn),
        G6 (Qn, rstn, R, Q);
endmodule
