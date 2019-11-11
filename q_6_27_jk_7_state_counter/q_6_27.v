module q_6_27 (
    input rstb, clk,
    output [2:0] count
);
    wire [2:0] J_in, K_in;
    wire [2:0] countb;

    assign J_in[2] = &count[1:0];
    assign K_in[2] = count[1];
    assign J_in[1] = count[0];
    assign K_in[1] = count[2] | count[0];
    assign J_in[0] = countb[2] | countb[1];
    assign K_in[0] = 1'b1;

    jk_ff #(.RESET_VALUE(1'b1)) jkff_0 (
        .rstb (rstb),
        .clk (clk),
        .J (J_in[0]),
        .K (K_in[0]),
        .Q (count[0]),
        .Qb (countb[0])
    );

    jk_ff #(.RESET_VALUE(1'b1)) jkff_1 (
        .rstb (rstb),
        .clk (clk),
        .J (J_in[1]),
        .K (K_in[1]),
        .Q (count[1]),
        .Qb (countb[1])
    );

    jk_ff #(.RESET_VALUE(1'b1)) jkff_2 (
        .rstb (rstb),
        .clk (clk),
        .J (J_in[2]),
        .K (K_in[2]),
        .Q (count[2]),
        .Qb (countb[2])
    );
endmodule

module jk_ff
#(
    parameter RESET_VALUE = 1'b0
)
(
    input rstb, clk, J, K,
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
            Q <= (J & Qb) | (~K & Q);
        end
    end

    assign Qb = ~Q;
endmodule
