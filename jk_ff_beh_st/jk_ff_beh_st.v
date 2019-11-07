module jk_ff_beh_st (
    input rstn, clk, J, K,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
    if (!rstn)
        Q <= 1'b0;
    else
        case ({J, K})
            2'b00 : Q <= Q;
            2'b01 : Q <= 1'b0;
            2'b10 : Q <= 1'b1;
            2'b11 : Q <= ~Q;
        endcase
endmodule
