module q_6_2c (
    input rst, clk, load,
    input [3:0] I,
    output [3:0] A
);
    wire [3:0] D_in;

    assign D_in[0] = ((A[0] && ~load) || (I[0] && load));
    assign D_in[1] = ((A[1] && ~load) || (I[1] && load));
    assign D_in[2] = ((A[2] && ~load) || (I[2] && load));
    assign D_in[3] = ((A[3] && ~load) || (I[3] && load));

    d_ff dff_0 (
        .rst (rst),
        .clk (clk),
        .D (D_in[0]),
        .Q (A[0])
    );

    d_ff dff_1 (
        .rst (rst),
        .clk (clk),
        .D (D_in[1]),
        .Q (A[1])
    );

    d_ff dff_2 (
        .rst (rst),
        .clk (clk),
        .D (D_in[2]),
        .Q (A[2])
    );

    d_ff dff_3 (
        .rst (rst),
        .clk (clk),
        .D (D_in[3]),
        .Q (A[3])
    );
endmodule

module d_ff (
    input rst, clk, D,
    output reg Q
);
    always @ (posedge clk)
    begin
        if (rst)
        begin
            Q <= 1'b0;
        end
        else
        begin
            Q <= D;
        end
    end
endmodule
