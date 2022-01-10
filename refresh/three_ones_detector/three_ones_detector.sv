import three_ones_detector_pkg::*;

module three_ones_detector (
    input logic rst_b, clk, stream,
    output logic bingo
);
    state_t state, next_state;
    
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
            state <= S_idle;
        else
            state <= next_state;
    end
    
    always_comb
    begin
        next_state = S_idle;
        
        case (state)
            S_idle :
                begin
                    if (stream == 1'b1)
                        next_state = S_1;
                    else
                        next_state = S_idle;
                end
            S_1 :
                begin
                    if (stream == 1'b1)
                        next_state = S_2;
                    else
                        next_state = S_idle;
                end
            S_2 :
                begin
                    if (stream == 1'b1)
                        next_state = S_3;
                    else
                        next_state = S_idle;
                end
            S_3 :
                begin
                    if (stream == 1'b1)
                        next_state = S_3;
                    else
                        next_state = S_idle;
                end
            default : next_state = S_idle;
        endcase
    end
    
    always_comb
    begin
        bingo = 1'b0;
        
        case (state)
            S_idle : bingo = 1'b0;
            S_1 : bingo = 1'b0;
            S_2 : bingo = 1'b0;
            S_3 : bingo = 1'b1;
            default : bingo = 1'b0;
        endcase
    end
endmodule