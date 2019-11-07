module q_5_51 (
    input rstn, clk, x_in,
    output reg y_out,
    output reg [1:0] state
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] next_state;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            state <= S0;
        end
        else
        begin
            state <= next_state;
        end
    end

    always @ (x_in, state)
    begin
        y_out = 0;
        next_state = S0;
        case (state)
            S0 :    if (x_in)
                    begin
                        y_out = 0;
                        if (x_in) next_state = S1;
                        else next_state = S0;
                    end
            S1 :    if (x_in)
                    begin
                        y_out = 0;
                        if (x_in) next_state = S2;
                        else next_state = S1;
                    end
            S2 :    if (x_in)
                    begin
                        y_out = 1;
                        if (x_in) next_state = S3;
                        else next_state = S2;
                    end
            S3 :    if (x_in)
                    begin
                        y_out = 1;
                        if (x_in) next_state = S0;
                        else next_state = S3;
                    end
            default : next_state = S0;
        endcase
    end
endmodule
