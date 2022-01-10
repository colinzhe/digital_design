import q5_17_2s_comp_pkg::*;

module q5_17_2s_comp (
    input logic rst_b, clk, stream,
    output logic twos_comp
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
        
        case (state)
            S_idle :
                if (stream == 1) next_state = S_1;
                else next_state = S_idle;
            S_1 :
                if (stream == 1) next_state = S_2;
                else next_state = S_3;
            S_2 :
                if (stream == 1) next_state = S_2;
                else next_state = S_3;
            S_3 :
                if (stream == 1) next_state = S_2;
                else next_state = S_3;
            default :
                next_state = S_idle;
        endcase
    end
    
    always_comb
    begin
        twos_comp = 1'b0;
        
        case (state)
            S_idle : twos_comp = 1'b0;
            S_1 : twos_comp = 1'b1;
            S_2 : twos_comp = 1'b0;
            S_3 : twos_comp = 1'b1;
            default : twos_comp = 1'b0;
        endcase
    end
endmodule