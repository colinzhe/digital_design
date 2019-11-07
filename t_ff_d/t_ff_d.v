module t_ff_d (
    input rstn, clk, T,
    output Q, Qn
);
    d_ff_3_sr_wr d_ff_3_sr_wr_0 (
        .rstn (rstn),
        .clk (clk),
        .D (T ^ Q),
        .Q (Q),
        .Qn (Qn)
    );
endmodule
