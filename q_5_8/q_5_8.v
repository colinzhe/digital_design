module q_5_8 (
    input rstn, clk,
    output [1:0] y_out
);
    wire TA, TB;
    wire A, An, B, Bn;

    assign TA = A || B;
    assign TB = An || B;

    t_ff t_ff_A (
        .rstn (rstn),
        .clk (clk),
        .T (TA),
        .Q (A),
        .Qn (An)
    );

    t_ff t_ff_B (
        .rstn (rstn),
        .clk (clk),
        .T (TB),
        .Q (B),
        .Qn (Bn)
    );

    assign y_out = {A, B};
endmodule

module t_ff (
    input rstn, clk, T,
    output reg Q,
    output Qn
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            Q <= 1'b0;
        else
            Q <= T ^ Q;
    end

    assign Qn = ~Q;
endmodule
