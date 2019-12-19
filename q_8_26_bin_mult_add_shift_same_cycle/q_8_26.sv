import q_8_26_pkg::*;

module q_8_26 (
    input rst_b, clk, start,
    input [dp_width-1:0] multiplicand, multiplier,
    output logic [dp_width*2-1:0] product,
    output logic rdy
);
    logic load_regs, decr_p, add_shift_regs, shift_regs, zero, C;
    state_t state, next_state;
    logic [dp_width-1:0] A, B, Q;
    logic [bc_size-1:0] P;

    // controller begins
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        load_regs = 1'b0;
        decr_p = 1'b0;
        add_shift_regs = 1'b0;
        shift_regs = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle :
            begin
                rdy = 1'b1;
                if (start) begin load_regs = 1'b1; next_state = S_add_shift; end
            end
            S_add_shift :
            begin
                if (zero) next_state = S_idle;
                else
                begin
                    if (Q[0]) add_shift_regs = 1'b1;
                    else shift_regs = 1'b1;
                    next_state = S_add_shift;
                end
                decr_p = 1'b1;
            end
            default : next_state = S_idle;
        endcase
    end
    // controller ends

    // datapath begins
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            P <= dp_width[2:0];
            A <= {dp_width{1'b0}};
            B <= {dp_width{1'b0}};
            Q <= {dp_width{1'b0}};
            C <= 1'b0;
        end
        else
        begin
            if (load_regs)
            begin
                P <= dp_width[2:0];
                A <= {dp_width{1'b0}};
                B <= multiplicand;
                Q <= multiplier;
                C <= 1'b0;
            end
            else if (add_shift_regs)
            begin
                {C, A} = A + B;
                {C, A, Q} = {C, A, Q} >> 1;
            end
            else if (shift_regs) {C, A, Q} <= {C, A, Q} >> 1;
            if (decr_p) P <= P - 1'b1;
        end
    end

    assign product = {A, Q};
    assign zero = (P == {bc_size{1'b0}});
    // datapath ends
endmodule
