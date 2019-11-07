module q_5_30 (
    input clk, A, B, C,
    output reg Q, E
);
    always @ (posedge clk)
    begin
        Q = E && C;
        E = A || B;
    end
endmodule
