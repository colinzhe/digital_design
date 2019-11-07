module jk_ff_beh (
    input rstn, clk, J, K,
    output Q
);
    d_ff_beh d_ff_beh_0 (
        .rstn (rstn),
        .clk (clk),
        .D (J && ~Q || ~K && Q),
        .Q (Q)
    );
endmodule
