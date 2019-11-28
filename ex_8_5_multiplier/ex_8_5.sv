import ex_8_5_pkg::*;

module ex_8_5 (
    rstb, clk, start,
    state, next_state, load_regs, decr_p,
    add_regs, shift_regs,
    P, zero,
    B, A, C, Q,
    multiplicand, multiplier, product,
    rdy
);
    output logic [2*dp_width-1:0] product;
    output logic rdy, load_regs, decr_p, add_regs, shift_regs, zero, C;
    output state_t state, next_state;
    output logic [bc_size-1:0] P;
    output logic [dp_width-1:0] A, B, Q;
    input [dp_width-1:0] multiplicand, multiplier;
    input start, rstb, clk;

    always_comb
    begin
        product = {A, Q};
        zero = (P == 1'b0);
        rdy = (state == S_idle);
    end

    //control unit
    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) state <= S_idle;
        else state <= next_state;
    end

    always_ff @ (state, start, Q[0], zero)
    begin
        next_state = S_idle;
        load_regs = 0;
        decr_p = 0;
        add_regs = 0;
        shift_regs = 0;
        case (state)
            S_idle  :   begin if (start) next_state = S_add; load_regs = 1'b1; end
            S_add   :   begin next_state = S_shift; decr_p = 1'b1; if (Q[0]) add_regs = 1'b1; end
            S_shift :   begin shift_regs = 1; if (!zero) next_state = S_add; end
            default :   next_state = S_idle;
        endcase
    end

    //datapath unit
    always_ff @ (posedge clk)
    begin
        if (load_regs)
        begin
            P <= dp_width[2:0];
            A <= 0;
            C <= 0;
            B <= multiplicand;
            Q <= multiplier;
        end
        if (add_regs) {C, A} <= A + B;
        if (shift_regs) {C, A, Q} <= {C, A, Q} >> 1;
        if (decr_p) P <= P - 1'b1;
    end
endmodule
