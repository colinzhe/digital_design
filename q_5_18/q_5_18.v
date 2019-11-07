module q_5_18 (
    input rstn, clk, E, F,
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
                S0 :
                begin
                    casez ({E, F})
                        2'b0? : state <= S0;
                        2'b11 : state <= S1;
                        2'b10 : state <= S3;
                    endcase
                end
                S1 :
                begin
                    casez ({E, F})
                        2'b0? : state <= S1;
                        2'b11 : state <= S2;
                        2'b10 : state <= S0;
                    endcase
                end
                S2 :
                begin
                    casez ({E, F})
                        2'b0? : state <= S2;
                        2'b11 : state <= S3;
                        2'b10 : state <= S1;
                    endcase
                end
                S3 :
                begin
                    casez ({E, F})
                        2'b0? : state <= S3;
                        2'b11 : state <= S0;
                        2'b10 : state <= S2;
                    endcase
                end
            endcase
    end

    assign y_out = state;
endmodule
