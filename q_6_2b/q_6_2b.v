module q_6_2b (
    input rst, clk, load,
    input [3:0] I,
    output [3:0] A
);
    wire [3:0] D_in;

    assign D_in[0] = ((A[0] && ~load) || (I[0] && load)) && (~rst);
    assign D_in[1] = ((A[1] && ~load) || (I[1] && load)) && (~rst);
    assign D_in[2] = ((A[2] && ~load) || (I[2] && load)) && (~rst);
    assign D_in[3] = ((A[3] && ~load) || (I[3] && load)) && (~rst);

    d_ff dff_0 (
        .clk (clk),
        .D (D_in[0]),
        .Q (A[0])
    );

    d_ff dff_1 (
        .clk (clk),
        .D (D_in[1]),
        .Q (A[1])
    );

    d_ff dff_2 (
        .clk (clk),
        .D (D_in[2]),
        .Q (A[2])
    );

    d_ff dff_3 (
        .clk (clk),
        .D (D_in[3]),
        .Q (A[3])
    );
endmodule

module d_ff (
    input clk, D,
    output reg Q
);
    always @ (posedge clk)
    begin
        Q <= D;
    end
endmodule
