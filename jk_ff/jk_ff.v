module jk_ff (
    input rstn, clk, J, K,
    output Q, Qn
);
    wire D;

    assign D = (J && Qn) || (~K && Q);

    d_ff_3_sr_wr d_ff_3_sr_wr_0 (
        .D (D),
        .Q (Q),
        .Qn (Qn),
        .clk (clk),
        .rstn (rstn)
    );
endmodule
