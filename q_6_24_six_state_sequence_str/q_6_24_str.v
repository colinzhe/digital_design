module q_6_24_str (
    input rstb, clk,
    output [2:0] count
);
    wire [2:0] T_in;
    wire [2:0] countb;

    //assign T_in[0] = (countb[2] & countb[0]) | (count[2] & count[0]);
    assign T_in[0] = (countb[2] & & countb[1] & countb[0]) | (count[2] & count[1] & count[0]);
    assign T_in[1] = count[1] ^ count[0];
    assign T_in[2] = count[2] ^ count[1];

    t_ff #(.RESET_VALUE(1'b0)) tff_0 (
        .rstb (rstb),
        .clk (clk),
        .T (T_in[0]),
        .Q (count[0]),
        .Qn (countb[0])
    );

    t_ff #(.RESET_VALUE(1'b1)) tff_1 (
        .rstb (rstb),
        .clk (clk),
        .T (T_in[1]),
        .Q (count[1]),
        .Qn (countb[1])
    );

    t_ff #(.RESET_VALUE(1'b0)) tff_2 (
        .rstb (rstb),
        .clk (clk),
        .T (T_in[2]),
        .Q (count[2]),
        .Qn (countb[2])
    );
endmodule

module t_ff
#(
    parameter RESET_VALUE = 1'b0
)
(
    input rstb, clk, T,
    output reg Q,
    output Qn
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            Q <= RESET_VALUE;
        end
        else
        begin
            Q <= T ? ~Q : Q;
        end
    end

    assign Qn = ~Q;
endmodule
