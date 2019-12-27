import q_8_34b_pkg::*;

module q_8_34b (
    input rst_b, clk, start,
    input zero, E,
    output logic load_regs, incr_r2, shift
);
    state_t state, next_state;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        load_regs = 1'b0;
        incr_r2 = 1'b0;
        shift = 1'b0;
        case (state)
            S_idle :
                if (start)
                begin
                    load_regs = 1'b1;
                    next_state = S_1;
                end
            S_1 :
            begin
                incr_r2 = 1'b1;
                if (zero) next_state = S_idle; else next_state = S_2;
            end
            S_2 :
            begin
                shift = 1'b1;
                next_state = S_3;
            end
            S_3 :
                if (E) next_state = S_1; else next_state = S_2;
            default : next_state = S_idle;
        endcase
    end
endmodule
