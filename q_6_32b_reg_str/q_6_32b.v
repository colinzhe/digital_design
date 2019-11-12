module q_6_32b (
    input rstb, clk, load,
    input [3:0] I,
    output [3:0] A
);
    wire [3:0] D_in;

    two_by_one_mux mux_0 (
        .sel (load),
        .x ({I[0], A[0]}),
        .y_out (D_in[0])
    );

    two_by_one_mux mux_1 (
        .sel (load),
        .x ({I[1], A[1]}),
        .y_out (D_in[1])
    );

    two_by_one_mux mux_2 (
        .sel (load),
        .x ({I[2], A[2]}),
        .y_out (D_in[2])
    );

    two_by_one_mux mux_3 (
        .sel (load),
        .x ({I[3], A[3]}),
        .y_out (D_in[3])
    );

    d_ff dff_0 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[0]),
        .Q (A[0]),
        .Qb ()
    );

    d_ff dff_1 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[1]),
        .Q (A[1]),
        .Qb ()
    );

    d_ff dff_2 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[2]),
        .Q (A[2]),
        .Qb ()
    );

    d_ff dff_3 (
        .rstb (rstb),
        .clk (clk),
        .D (D_in[3]),
        .Q (A[3]),
        .Qb ()
    );
endmodule

module two_by_one_mux (
    input sel,
    input [1:0] x,
    output y_out
);
    assign y_out = sel ? x[1] : x[0];
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
