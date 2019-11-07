module t_ff_beh_st (
    input rstn, clk, T,
    output Q
);
    d_ff_beh d_ff_beh_0 (
        .rstn (rstn),
        .clk (clk),
        .D (Q ^ T),
        .Q (Q)
    );
endmodule
