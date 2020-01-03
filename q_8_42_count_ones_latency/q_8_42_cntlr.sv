import q_8_42_pkg::*;

module q_8_42_cntlr (
    input rst_b, clk, start,
    input zero, msb,
    output logic load_regs, incr_and_shift, shift_only, rdy
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
        incr_and_shift = 1'b0;
        shift_only = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle :
            begin
                if (start)
                begin
                    load_regs = 1'b1;
                    next_state = S_count;
                end
                rdy = 1'b1;
            end
            S_count :
            begin
                if (zero) next_state = S_idle;
                else
                begin
                    if (msb)
                    begin
                        incr_and_shift = '1;
                        next_state = S_count;
                    end
                    else
                    begin
                        shift_only = '1;
                        next_state = S_count;
                    end
                end
            end
            default : next_state = S_idle;
        endcase
    end
endmodule
