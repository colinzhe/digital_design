module q_5_46 (
    input rstn, clk, x_in,
    output reg [2:0] state,
    output y_out
);
    parameter   S0 = 3'b000,
                S1 = 3'b001,
                S2 = 3'b010,
                S3 = 3'b011,
                S4 = 3'b100,
                S5 = 3'b101;

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
                S1 : state <= S2;
                S2 : state <= S3;
                S3 : state <= S4;
                S4 : state <= S5;
                S5 : state <= S0;
                default : state <= S0;
            endcase
        end
    end

    assign y_out = !state[2] && state[0] || !state[2] && state[1];
endmodule
