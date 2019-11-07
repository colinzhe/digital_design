module q_5_9 (
    input rstn, clk, x_in,
    output [1:0] y_out
);
    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            state <= S0;
        else
            case (state)
                S0 : if (!x_in) state <= S0; else state <= S3;
                S1 : if (!x_in) state <= S0; else state <= S2;
                S2 : if (!x_in) state <= S2; else state <= S3;
                S3 : if (!x_in) state <= S1; else state <= S1;
            endcase
    end

    assign y_out = state;
endmodule
