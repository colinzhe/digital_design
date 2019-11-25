module ex_8_2_asmd (
    input rstb, clk, start,
    output logic [3:0] A,
    output logic E, F,
    output logic [1:0] state, next_state,
    output logic set_E, clr_E, set_F, clr_A_F, incr_A, A2, A3
);
    //assign A2 = A[2];
    //assign A3 = A[3];

    always_comb
    begin
        A2 = A[2];
        A3 = A[3];
    end

    controller c0 (
        .rstb (rstb),
        .clk (clk),
        .start (start),
        .A2 (A2),
        .A3 (A3),
        .set_E (set_E),
        .clr_E (clr_E),
        .set_F (set_F),
        .clr_A_F (clr_A_F),
        .incr_A (incr_A),
        .state_out (state),
        .next_state_out (next_state)
    );
    
    datapath d0 (
        .clk (clk),
        .set_E (set_E),
        .clr_E (clr_E),
        .set_F (set_F),
        .clr_A_F (clr_A_F),
        .incr_A (incr_A),
        .A (A),
        .E (E),
        .F (F)
    );
endmodule

module controller (
    input rstb, clk, start, A2, A3,
    output logic set_E, clr_E, set_F, clr_A_F, incr_A,
    output logic [1:0] state_out, next_state_out
);
    //parameter S_idle = 2'b00, S_1 = 2'b01, S_2 = 2'b11;
    enum logic [1:0] {S_idle, S_1, S_2} state, next_state;

    always_comb
    begin
        state_out = state;
        next_state_out = next_state;
    end

    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        case (state)
            S_idle  :   if (start) next_state = S_1; else next_state = S_idle;
            S_1     :   if (A2 && A3) next_state = S_2; else next_state = S_1;
            S_2     :   next_state = S_idle;
            default :   next_state = S_idle;
        endcase
    end

    always_comb
    begin
        {set_E, clr_E, set_F, clr_A_F, incr_A} = 5'b00000;
        case (state)
            S_idle  :   if (start) clr_A_F = 1;
            S_1     :   begin incr_A = 1; if (A2) set_E = 1; else clr_E = 1; end
            S_2     :   set_F = 1;
            default :   {set_E, clr_E, set_F, clr_A_F, incr_A} = 5'b00000;
        endcase
    end
endmodule

module datapath (
    input clk, set_E, clr_E, set_F, clr_A_F, incr_A,
    output logic [3:0] A,
    output logic E, F
);
    always_ff @ (posedge clk)
    begin
        if (set_E)      E <= 1'b1;
        if (clr_E)      E <= 1'b0;
        if (set_F)      F <= 1'b1;
        if (clr_A_F)    begin A <= 1'b0; F <= 1'b0; end
        if (incr_A)     A <= A + 1'b1;
    end
endmodule