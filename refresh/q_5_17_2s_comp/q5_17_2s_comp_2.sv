import q5_17_2s_comp_pkg::*;

module q5_17_2s_comp_2 (myIntf intf);
// module q5_17_2s_comp_2 (interface intf);
    state_t state, next_state;
    
    always_ff @ (posedge intf.clk, negedge intf.rst_b)
    begin
        if (!intf.rst_b) state <= S_idle;
        else state <= next_state;
    end
    
    always_comb
    begin
        next_state = S_idle;
        
        case (state)
            S_idle :
                if (intf.stream == 1) next_state = S_1;
                else next_state = S_idle;
            S_1 :
                if (intf.stream == 1) next_state = S_2;
                else next_state = S_3;
            S_2 :
                if (intf.stream == 1) next_state = S_2;
                else next_state = S_3;
            S_3 :
                if (intf.stream == 1) next_state = S_2;
                else next_state = S_3;
            default :
                next_state = S_idle;
        endcase
    end
    
    always_comb
    begin
        intf.twos_comp = 1'b0;
        
        case (state)
            S_idle : intf.twos_comp = 1'b0;
            S_1 : intf.twos_comp = 1'b1;
            S_2 : intf.twos_comp = 1'b0;
            S_3 : intf.twos_comp = 1'b1;
            default : intf.twos_comp = 1'b0;
        endcase
    end
endmodule