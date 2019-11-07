module q_5_53 (
    input rstn, clk, x_in,
    output reg y_out,
    output reg [1:0] state
);
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            state <= S0;
        end
        else
        begin
            case (state)
                S0 : state <= x_in ? S1 : S0;
                S1 : state <= x_in ? S2 : S1;
                S2 : state <= x_in ? S3 : S2;
                S3 : state <= x_in ? S1 : S3;
            endcase
        end
    end
    
    always @ (state, x_in)
    begin
        case (state)
            S2: y_out = x_in ? 1'b1 : 1'b0;
            S3: y_out = x_in ? 1'b0 : 1'b1;
            S0, S1: y_out = 1'b0;
        endcase
    end
endmodule
