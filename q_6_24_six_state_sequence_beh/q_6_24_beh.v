module q_6_24_beh (
    input rstb, clk,
    output [2:0] count
);
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b011, S3 = 3'b111, S4 = 3'b110,
        S5 = 3'b100;
    reg [2:0] state, next_state;

    assign count = state;

    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            state <= 3'b101;
        end
        else
        begin
            state <= next_state;
        end
    end

    always @ (state)
    begin
        case (state)
            S0 : next_state = S1;
            S1 : next_state = S2;
            S2 : next_state = S3;
            S3 : next_state = S4;
            S4 : next_state = S5;
            S5 : next_state = S0;
            default : next_state = S0;
        endcase
    end
endmodule
