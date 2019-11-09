module q_6_17 (
    input rstb, clk,
    output [3:0] count
);
    wire [3:0] D;
    wire [3:0] Q;
    wire [3:0] Qb;

    assign D[0] = Qb[0];
    assign D[1] = Q[0] ^ Q[1];
    assign D[2] = (Q[2] & ~Q[1]) | (Q[2] & ~Q[0]) | (~Q[2] & Q[1] & Q[0]);
    assign D[3] = (Q[3] & ~Q[2]) | (Q[3] & ~Q[1]) | (Q[3] & ~Q[0]) | (~Q[3] & Q[2] & Q[1] & Q[0]);

    assign count = Q;

    d_ff dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (D[0]),
        .Q (Q[0]),
        .Qb (Qb[0])
    );

    d_ff dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (D[1]),
        .Q (Q[1]),
        .Qb (Qb[1])
    );

    d_ff dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (D[2]),
        .Q (Q[2]),
        .Qb (Qb[2])
    );

    d_ff dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (D[3]),
        .Q (Q[3]),
        .Qb (Qb[3])
    );
endmodule

module d_ff (
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            Q <= 1'b0;
        end
        else
        begin
            Q <= D;
        end
    end
    
    assign Qb = ~Q;
endmodule
