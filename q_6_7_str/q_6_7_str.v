module q_6_7_str (
    input clk,
    input [1:0] sel,
    input [3:0] I,
    output [3:0] A
);
    wire [3:0] D_in;
    wire [3:0] Qn;

    four_by_one_mux mux_3 (
        .sel (sel),
        .I ({I[3], Qn[3], 1'b0, A[3]}),
        .y (D_in[3])
    );

    d_ff dff_3 (
        .clk (clk),
        .D (D_in[3]),
        .Q (A[3]),
        .Qn (Qn[3])
    );

    four_by_one_mux mux_2 (
        .sel (sel),
        .I ({I[2], Qn[2], 1'b0, A[2]}),
        .y (D_in[2])
    );

    d_ff dff_2 (
        .clk (clk),
        .D (D_in[2]),
        .Q (A[2]),
        .Qn (Qn[2])
    );

    four_by_one_mux mux_1 (
        .sel (sel),
        .I ({I[1], Qn[1], 1'b0, A[1]}),
        .y (D_in[1])
    );

    d_ff dff_1 (
        .clk (clk),
        .D (D_in[1]),
        .Q (A[1]),
        .Qn (Qn[1])
    );

    four_by_one_mux mux_0 (
        .sel (sel),
        .I ({I[0], Qn[0], 1'b0, A[0]}),
        .y (D_in[0])
    );

    d_ff dff_0 (
        .clk (clk),
        .D (D_in[0]),
        .Q (A[0]),
        .Qn (Qn[0])
    );
endmodule

module d_ff (
    input clk, D,
    output reg Q,
    output Qn
);
    always @ (posedge clk)
    begin
        Q <= D;
    end

    assign Qn = ~Q;
endmodule

module four_by_one_mux (
    input [1:0] sel,
    input [3:0] I,
    output reg y
);
    always @ (sel, I)
    begin
        case (sel)
            2'b00 : y = I[0];
            2'b01 : y = I[1];
            2'b10 : y = I[2];
            2'b11 : y = I[3];
        endcase
    end
endmodule
