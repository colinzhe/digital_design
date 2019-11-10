module q_6_23_beh (
    input rstb, clk, cnt_en,
    output [3:0] count,
    output reg y
);
    parameter S0 = 4'b0000,
                S1 = 4'b0001,
                S2 = 4'b0010,
                S3 = 4'b0011,
                S4 = 4'b0100,
                S5 = 4'b0101,
                S6 = 4'b0110,
                S7 = 4'b0111,
                S8 = 4'b1000,
                S9 = 4'b1001,
                S10 = 4'b1010,
                S11 = 4'b1011,
                S12 = 4'b1100;
    reg [3:0] state;
    reg [3:0] next_state;

    assign count = state;

    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            state <= 4'b1111;
        end
        else
        begin
            state <= next_state;
        end
    end

    always @ (cnt_en, state)
    begin
        case (state)
            S0 : if (cnt_en) next_state = S1; else next_state = S0;
            S1 : next_state = S2;
            S2 : next_state = S3;
            S3 : next_state = S4;
            S4 : next_state = S5;
            S5 : next_state = S6;
            S6 : next_state = S7;
            S7 : next_state = S8;
            S8 : next_state = S9;
            S9 : next_state = S10;
            S10 : next_state = S11;
            S11 : next_state = S12;
            S12 : next_state = S0;
            default : next_state = S0;
        endcase
    end

    always @ (state)
    begin
        if (state != S0) y = 1'b1; else y = 1'b0;
    end
endmodule
