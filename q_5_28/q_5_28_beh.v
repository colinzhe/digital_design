module q_5_28_beh (
    input rstn, clk,
    input [1:0] x_in,
    output y_out
);
    reg state;
    wire x_in_xor;
    assign x_in_xor = ^x_in;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            state <= 1'b0;
        else
            state <= state ? (x_in_xor ? 1'b0 : 1'b1) : (x_in_xor ? 1'b1 : 1'b0);
    end

    assign y_out = state;
endmodule
