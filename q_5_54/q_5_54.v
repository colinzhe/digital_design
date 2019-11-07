module q_5_54 (
    input rstn, clk,
    input [1:0] x_in,
    output y_out
);
    parameter S0 = 1'b0, S1 = 1'b1;
    reg state;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            state <= S0;
        end
        else
        begin
            case (state)
                S0 : state <= (^x_in) ? S0 : S1;
                S1 : state <= S0;
            endcase
        end
    end

    assign y_out = state;
endmodule
