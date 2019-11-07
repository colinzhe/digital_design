module q_5_28_str (
    input rstn, clk,
    input [1:0] x_in,
    output y_out
);
    wire A, A_next;

    d_ff dff_A (
        .rstn (rstn),
        .clk (clk),
        .D (A_next),
        .Q (A)
    );

    assign A_next = ^x_in ^ A;
    assign y_out = A;
endmodule

module d_ff (
    input rstn, clk, D,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule
