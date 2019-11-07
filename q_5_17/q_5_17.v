module q_5_17 (
    input rstn, clk, x_in,
    output reg y_out
);
    reg state;
    parameter S0 = 1'b0, S1 = 1'b1;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            state <= S0;
        else
            case (state)
                S0 : if (!x_in) state <= S0; else state <= S1;
                S1 : state <= S1;
            endcase
    end

    always @ (state, x_in)
    begin
        y_out = state ? ~x_in : x_in;
    end
endmodule
