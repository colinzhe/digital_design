module moore_binary_counter_str (
    input rstn, clk, x_in,
    output y_out, A, B
);
    wire TA, TB;

    assign TA = x_in && B;
    assign TB = x_in;
    assign y_out = A && B;

    t_ff t_ff_A (rstn, clk, TA, A);
    t_ff t_ff_B (rstn, clk, TB, B);
endmodule

module t_ff (
    input rstn, clk, T,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            Q <= 1'b0;
        else
            Q <= Q ^ T;
    end
endmodule
