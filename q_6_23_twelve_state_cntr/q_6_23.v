module q_6_23 (
    input rstb, clk, cnt_en,
    output [3:0] count,
    output y
);
    wire [3:0] D_in;
    wire [3:0] countb;

    assign D_in[0] = (~cnt_en & ((countb[3] & count[2] & countb[0]) | (count[3] & countb[2] & countb[0]) & (count[1] & countb[0]))) |
        (cnt_en & ((countb[3] & countb[0]) | (countb[2] & countb[0]) | (count[1] & countb[0]))) | (|count & countb[0] & (count != 4'b1100));
    assign D_in[1] = (countb[1] & count[0]) | (count[1] & countb[0]);
    assign D_in[2] = (countb[2] & count[1] & count[0]) |
        (countb[3] & count[2] & countb[0]) | (count[2] & countb[1] & count[0]);
    assign D_in[3] = (count[3] & countb[2]) | (count[2] & count[1] & count[0]);

    d_ff #(.RESET_VALUE(1'b1)) dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[0]),
        .Q (count[0]),
        .Qb (countb[0])
    );

    d_ff #(.RESET_VALUE(1'b1)) dff_1 (
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

    d_ff #(.RESET_VALUE(1'b1)) dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[3]),
        .Q (count[3]),
        .Qb (countb[3])
    );

    assign y = |count;
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
