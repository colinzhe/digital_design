import q_8_22_pkg::*;

module q_8_22 (
    input rst_b, clk, start,
    input [dp_width-1:0] multiplicand, multiplier,
    output [dp_width*2-1:0] product,
    output rdy
);
    logic load_regs, decr_p, add_regs, shift_regs, zero, C;
    state_t state, next_state;
    logic [dp_width-1:0] A, B, Q;
    logic [bc_size-1:0] P;

    // controller begins
    always_ff @ (posedge clk, rst_b)
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
                if (start) begin load_regs = 1'b1; next_state = S_loaded; end
            end
            S_loaded :
            begin
                if (!zero) begin add_regs = 1'b1; next_state = S_sum; end
                else begin shift_regs = 1'b1; next_state = S_shifted; end
                decr_p = 1'b1;
            end
            S_sum :
            begin
                shift_regs = 1'b1; next_state = S_shifted;
            end
            S_shifted :
                if (!zero) next_state = S_loaded;
                else next_state = S_idle;
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
            if (load_regs)
            begin
                P <= dp_width[2:0];
                A <= {dp_width{1'b0}};
                B <= multiplicand;
                Q <= multiplier;
                C <= 1'b0;
            end
            else if (add_regs) {C, A} = A + B;
            else if (shift_regs) {C, A, Q} = {C, A, Q} >> 1;
            else if (decr_p) P <= P - 1'b1;
    end

    always_comb
    begin
        product = {A, Q};
        zero = (P == {bc_size{1'b0}});
    end
    // datapath ends
