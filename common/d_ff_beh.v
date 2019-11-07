module d_ff_beh (
    input rstn, clk, D,
    output reg Q, Qn
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
            Qn <= 1'b1;
        end
        else
        begin
            Q <= D;
            Qn <= ~D;
        end
    end
endmodule
