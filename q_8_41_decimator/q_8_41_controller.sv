import q_8_41_pkg::*;

module q_8_41_controller (
    input rst, clk, en, load,
    output logic clr_P1_P0, load_P1_P0, load_R0
);
    state_t state, next_state;

    always_ff @ (posedge clk)
    begin
        state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        clr_P1_P0 = '0;
        load_P1_P0 = '0;
        load_R0 = '0;

        case (state)
            S_idle : // 00
                if (rst || !en)
                begin
                    next_state = S_idle;
                    clr_P1_P0 = '1;
                end
                else
                begin
                    next_state = S_1;
                    load_P1_P0 = '1;
                end
            S_1 : // 01
            begin
                if (rst)
                begin
                    next_state = S_idle;
                    clr_P1_P0 = '1;
                end
                else
                begin
                    next_state = S_full;
                    load_P1_P0 = '1;
                end
            end
            S_full : // 10
                if (rst)
                begin
                    next_state = S_idle;
                    clr_P1_P0 = '1;
                end
                else if (load)
                begin
                    load_R0 = '1;
                    if (en)
                    begin
                        next_state = S_1;
                        load_P1_P0 = '1;
                    end
                    else
                    begin
                        next_state = S_idle;
                        clr_P1_P0 = '1;
                    end
                end
                else next_state = S_wait;
            S_wait : // 11
                if (rst)
                begin
                    next_state = S_idle;
                    clr_P1_P0 = '1;
                end
                else if (load)
                begin
                    load_R0 = '1;
                    if (en)
                    begin
                        next_state = S_1;
                        load_P1_P0 = '1;
                    end
                    else
                    begin
                        next_state = S_idle;
                        clr_P1_P0 = '1;
                    end
                end
                else next_state = S_wait;
            default : next_state = S_idle;
        endcase
    end
endmodule
