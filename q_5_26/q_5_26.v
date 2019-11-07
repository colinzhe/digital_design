module q_5_26 (
    input rstn, clk, J, K,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            Q <= 1'b0;
        else
            if (Q)
                Q <= ~K;
            else
                Q <= J;
    end
endmodule
