module q_6_28a (
    input rstb, clk,
    output [2:0] count
);
    wire [2:0] D_in, countb;

    assign D_in[0] = &countb;
    assign D_in[1] = (countb[2] & count[0]) | (count[2] & countb[1]);
    assign D_in[2] = count[2] ^ count[1];

    d_ff #(.RESET_VALUE(1'b1)) dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[0]),
        .Q (count[0]),
        .Qb (countb[0])
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[1]),
        .Q (count[1]),
        .Qb (countb[1])
    );

    d_ff #(.RESET_VALUE(1'b1)) dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[2]),
        .Q (count[2]),
        .Qb (countb[2])
    );
endmodule

module d_ff
#(
    parameter RESET_VALUE = 1'b0
)
(
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            Q <= RESET_VALUE;
        end
        else
        begin
            Q <= D;
        end
    end

    assign Qb = ~Q;
endmodule
