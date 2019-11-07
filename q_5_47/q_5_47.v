module q_5_47 (
    input rstn, clk, x_in,
    output reg [3:0] state
);
    parameter   S0 = 4'b0000,
                S1 = 4'b0010,
                S2 = 4'b0100,
                S3 = 4'b0110,
                S4 = 4'b1000,
                S5 = 4'b1010,
                S6 = 4'b1100,
                S7 = 4'b1110;

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
                S3 : state <= x_in ? S4 : S3;
                S4 : state <= x_in ? S5 : S4;
                S5 : state <= x_in ? S6 : S5;
                S6 : state <= x_in ? S7 : S6;
                S7 : state <= x_in ? S0 : S7;
                default : state <= S0;
            endcase
        end
    end
endmodule
