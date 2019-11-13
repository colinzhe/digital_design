module q_6_40 (
    input rstb, clk,
    output [7:0] count
);
    d_ff #(.RESET_VALUE(1'b1)) dff_7 (
        .rstb (rstb),
        .clk (clk),
        .D (count[0]),
        .Q (count[7]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_6 (
        .rstb (rstb),
        .clk (clk),
        .D (count[7]),
        .Q (count[6]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_5 (
        .rstb (rstb),
        .clk (clk),
        .D (count[6]),
        .Q (count[5]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_4 (
        .rstb (rstb),
        .clk (clk),
        .D (count[5]),
        .Q (count[4]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (count[4]),
        .Q (count[3]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (count[3]),
        .Q (count[2]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (count[2]),
        .Q (count[1]),
        .Qb ()
    );

    d_ff #(.RESET_VALUE(1'b0)) dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (count[1]),
        .Q (count[0]),
        .Qb ()
    );
endmodule

module d_ff #(parameter RESET_VALUE = 1'b0)
(
    input rstb, clk, D,
    output reg Q,
    output Qb
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
            Q <= RESET_VALUE;
        else
            Q <= D;
    end

    assign Qb = ~Q;
endmodule
