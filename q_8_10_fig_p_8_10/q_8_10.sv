import q_8_10_pkg::*;

module q_8_10 (
    input rst_b, clk, x, y,
    output state_t state
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
            S_0 : if (x) next_state = S_1;
            S_1 : if (y) next_state = S_3; else next_state = S_2;
            S_2 : if (x && y) next_state = S_3; else if (x && !y) next_state = S_2; else next_state = S_0;
            S_3 : if (!x && y) next_state = S_3; else if (!x && !y) next_state = S_2; else next_state = S_0;
            default : next_state = S_0;
        endcase
    end
endmodule
