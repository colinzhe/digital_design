import q_8_29_rtl_pkg::*;

module q_8_29_rtl (
    input rst_b, clk,
    input x, y, F, E,
    output state_t state,
    output logic [7:0] dec_out
);
    state_t next_state;
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_0;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_0;
        case (state)
            S_0 :
                if (({x, y}) == 2'b00) next_state = S_0;
                else if (({x, y}) == 2'b01) next_state = S_2;
                else next_state = S_1;
            S_1 : next_state = S_2;
            S_2 :
                if (F) next_state = S_3;
                else next_state = S_4;
            S_3 : next_state = S_0;
            S_4 :
                if (E) next_state = S_5;
                else next_state = S_6;
            S_5 : next_state = S_0;
            S_6 : next_state = S_7;
            S_7 : next_state = S_0;
        endcase
    end

    always_comb
    begin
        dec_out = 8'h00;
        case (state)
            3'b000 : dec_out[7] = 1'b1;
            3'b001 : dec_out[6] = 1'b1;
            3'b010 : dec_out[5] = 1'b1;
            3'b011 : dec_out[4] = 1'b1;
            3'b100 : dec_out[3] = 1'b1;
            3'b101 : dec_out[2] = 1'b1;
            3'b110 : dec_out[1] = 1'b1;
            3'b111 : dec_out[0] = 1'b1;
            default : dec_out = 8'h00;
        endcase
    end
endmodule
