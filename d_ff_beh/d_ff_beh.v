module d_ff_beh (
    input rstn, clk, D,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
        if (!rstn)
            Q <= 1'b0;
        else
            Q <= D;
endmodule
