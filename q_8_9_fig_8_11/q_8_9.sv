import q_8_9_pkg::*;

module q_8_9 (
    input rst_b, clk, start,
    input A3, A2,
    output logic clr_A_F, incr_A, clr_E, set_E, set_F
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
        clr_A_F = 1'b0;
        incr_A = 1'b0;
        clr_E = 1'b0;
        set_E = 1'b0;
        set_F = 1'b0;

        case (state)
            S_idle :
                if (start)
                begin
                    next_state = S_1;
                    clr_A_F = 1'b1;
                end
            S_1 :
                begin
                    incr_A = 1'b1;
                    if (!A2)
                    begin
                        next_state = S_1;
                        clr_E = 1'b1;
                    end
                    else
                    begin   
                        set_E = 1'b1;
                        if (A3) next_state = S_2;
                        else next_state = S_1;
                    end
                end
            S_2 :
                begin
                    next_state = S_idle;
                    set_F = 1'b1;
                end
            default : next_state = S_idle;
        endcase
    end
endmodule
