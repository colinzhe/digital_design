module q_5_42 (
    input rstn, clk, x,
    output y, A, B
);
    wire DA, DB;
    wire Bn;

    assign DA = x && A || x && B;
    assign DB = x && A || x && Bn;

    d_ff_beh d_ff_A (
        .rstn (rstn),
        .clk (clk),
        .D (DA),
        .Q (A),
        .Qn ()
    );

    d_ff_beh d_ff_B (
        .rstn (rstn),
        .clk (clk),
        .D (DB),
        .Q (B),
        .Qn (Bn)
    );

    assign y = B && A;
endmodule
