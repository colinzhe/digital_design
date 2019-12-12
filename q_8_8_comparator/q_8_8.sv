import q_8_8_pkg::*;

module q_8_8 (
    input rst_b, clk, start,
    input [15:0] A, B,
    output logic [15:0] C,
    output logic rdy
);
    logic load_regs, div, mul, clr;
    logic RA_lt_0, RA_gt_0, RA_eq_0;
    logic [15:0] RA, RB, RC;
    state_t state, next_state;

    //controller
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        load_regs = 0;
        div = 0;
        mul = 0;
        clr = 0;
        rdy = 0;
        case (state)
            S_idle :
                if (start)
                begin
                    load_regs = 1'b1;
                    next_state = S_1;
                    rdy = 1'b1;
                end
            S_1 :
                begin
                    if (RA_lt_0) div = 1'b1;
                    else if (RA_gt_0) mul = 1'b1;
                    else if (RA_eq_0) clr = 1'b0;
                    next_state = S_idle;
                end
            default : next_state = S_idle;
        endcase
    end

    //datapath
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            RA <= 16'h00;
            RB <= 16'h00;
            RC <= 16'h00;
        end
        else
        begin
            if (load_regs) begin RA <= A; RB <= B; end
            else if (div) RC <= RA / 16'd2;
            else if (mul) RC <= RB * 16'd2;
            else if (clr) RC <= 16'h00;
        end
    end

    always_comb
    begin
        RA_lt_0 = 1'b0;
        RA_gt_0 = 1'b0;
        RA_eq_0 = 1'b0;
        if (RA[15] == 1) RA_lt_0 = 1'b1;
        else if (RA == 16'h00) RA_eq_0 = 1'b1;
        else RA_gt_0 = 1'b1;
    end

    assign C = RC;
endmodule
