module t_ff_jk (
    input rstn, clk, T,
    output Q, Qn
);
    jk_ff jk_ff_0 (
        .J (T),
        .K (T),
        .clk (clk),
        .Q (Q),
        .Qn (Qn),
        .rstn (rstn)
    );
endmodule
