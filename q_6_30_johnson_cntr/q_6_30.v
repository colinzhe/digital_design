module q_6_30 (
    input rstb, clk,
    output [4:0] st_count,
    output [9:0] count
);
    wire [4:0] Q, Qb;

    assign st_count = Q;

    assign count[9] = Qb[4] & Qb[0];
    assign count[8] = Q[4] & Qb[3];
    assign count[7] = Q[3] & Qb[2];
    assign count[6] = Q[2] & Qb[1];
    assign count[5] = Q[1] & Qb[0];
    assign count[4] = Q[4] & Q[0];
    assign count[3] = Qb[4] & Q[3];
    assign count[2] = Qb[3] & Q[2];
    assign count[1] = Qb[2] & Q[1];
    assign count[0] = Qb[1] & Q[0];

    d_ff dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (Qb[0]),
        .Q (Q[4]),
        .Qb (Qb[4])
    );

    d_ff dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (Q[4]),
        .Q (Q[3]),
        .Qb (Qb[3])
    );

    d_ff dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (Q[3]),
        .Q (Q[2]),
        .Qb (Qb[2])
    );

    d_ff dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (Q[2]),
        .Q (Q[1]),
        .Qb (Qb[1])
    );

    d_ff dff_4 (
        .rstb (rstb),
        .clk (clk),
        .D (Q[1]),
        .Q (Q[0]),
        .Qb (Qb[0])
    );
endmodule

module d_ff (
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb) Q <= 1'b0;
        else Q <= D;
    end

    assign Qb = ~Q;
endmodule
