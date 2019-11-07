module mealy_zero_detector (
    input rstn, clk, x_in,
    output reg y_out
);
    reg [1:0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @ (posedge clk, negedge rstn)
        if (!rstn)
            state <= S0;
        else
            state <= next_state;

    always @ (state, x_in)
        case (state)
            S0 : if (x_in) next_state = S1; else next_state = S0;
            S1 : if (x_in) next_state = S3; else next_state = S0;
            S2 : if (x_in) next_state = S2; else next_state = S0;
            S3 : if (x_in) next_state = S2; else next_state = S0;
        endcase

    always @ (state, x_in)
        case (state)
            S0 : y_out = 1'b0;
            S1, S2, S3 : y_out = ~x_in;
        endcase
endmodule
