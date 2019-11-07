module q_5_45 (
    input rstn, clk, x_in,
    output y_out,
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
                S1 : state <= x_in ? S2 : S0;
                S2 : state <= x_in ? S3 : S0;
                S3 : state <= x_in ? S3 : S0;
            endcase
        end
    end

    assign y_out = &state;
endmodule
