module q_5_27 (
    input rstn, clk, x_in,
    output reg y_out,
    output reg [1:0] state, next_state
);    
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    //reg [1:0] state, next_state = S0;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            state <= S0;
        else
            state <= next_state;
    end

    always @ (x_in, state)
    begin
        case (state)
            S0 :    begin
                        if (x_in) begin next_state = S1; end
                        else begin next_state = S0; end
                        y_out = 1'b0;
                    end
            S1 :    begin
                        if (x_in) begin next_state = S3; end
                        else begin next_state = S0; end
                        y_out = ~x_in;
                    end
            S2 :    begin
                        if (x_in) begin next_state = S2; end
                        else begin next_state = S0; end
                        y_out = ~x_in;
                    end
            S3 :    begin
                        if (x_in) begin next_state = S2; end
                        else begin next_state = S0; end
                        y_out = ~x_in;
                    end
        endcase
    end
endmodule
