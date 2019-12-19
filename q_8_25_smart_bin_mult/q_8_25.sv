import q_8_25_pkg::*;

module q_8_25 (
    input rst_b, clk, start,
    input [dp_width-1:0] multiplicand, multiplier,
    output logic [dp_width*2-1:0] product,
    output logic rdy
);
    logic load_regs, decr_p, add_regs, shift_regs, cntr_eq_zero, s_multiplier_eq_zero, C;
    state_t state, next_state;
    logic [dp_width-1:0] A, B, Q, M;
    logic [bc_size-1:0] P;
    integer unsigned shift_count;

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
        add_regs = 1'b0;
        shift_regs = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle :
            begin
                rdy = 1'b1;
                if (start)
                begin
                    load_regs = 1'b1; next_state = S_add;
                end
            end
            //S_check :
            //begin
            //    if (M == {dp_width{1'b0}} || B == {dp_width{1'b0}})
            //        next_state = S_idle;
            //    else next_state = S_add;
            //end
            S_add :
            begin
                if (M == {dp_width{1'b0}} || B == {dp_width{1'b0}}) next_state = S_idle;
                else if (Q[0]) begin add_regs = 1'b1; next_state = S_shift; end
                else next_state = S_shift;
                decr_p = 1'b1;
            end
            S_shift :
            begin
                shift_regs = 1'b1;
                if (cntr_eq_zero || s_multiplier_eq_zero) next_state = S_idle;
                //else if (s_multiplier_eq_zero)
                //begin
                //    next_state = S_idle;
                //end
                else next_state = S_add;
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
            M <= {dp_width{1'b0}};
            C <= 1'b0;
            shift_count <= 0;
        end
        else
        begin
            if (load_regs)
            begin
                P <= dp_width[2:0];
                A <= {dp_width{1'b0}};
                B <= multiplicand;
                Q <= multiplier;
                M <= multiplier;
                C <= 1'b0;
            end
            else if (add_regs) {C, A} <= A + B;
            else if (shift_regs) begin {C, A, Q} <= {C, A, Q} >> 1; M <= M >> 1; shift_count <= shift_count + 1; end
            if (decr_p) P <= P - 1'b1;
        end
    end

    assign product = s_multiplier_eq_zero ? {A, Q} << shift_count : {A, Q};
    assign cntr_eq_zero = (P == {bc_size{1'b0}});
    assign s_multiplier_eq_zero = (M == {dp_width{1'b0}});
    // datapath ends
endmodule
