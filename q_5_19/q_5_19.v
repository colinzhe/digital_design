module q_5_19 (
    input rstn, clk, x_in,
    output reg y_out,
    output [2:0] state_out
);
    reg [2:0] state;
    parameter   S0 = 3'b000,
                S1 = 3'b001,
                S2 = 3'b010,
	            S3 = 3'b011,
                S4 = 3'b100;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            state <= S0;
        else
            case (state)
                S0 : if (!x_in) state <= S3; else state <= S4;
                S1 : if (!x_in) state <= S1; else state <= S4;
                S2 : if (!x_in) state <= S2; else state <= S0;
                S3 : if (!x_in) state <= S1; else state <= S2;
                S4 : if (!x_in) state <= S2; else state <= S3;
                default : state <= S0;
            endcase
    end

    always @ (state, x_in)
    begin
        y_out = ~state[2] && x_in;
    end

    assign state_out = state;
endmodule
