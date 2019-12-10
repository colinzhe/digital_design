import q_8_7_pkg::*;

module q_8_7 (
    input rst_b, clk, start,
    input [7:0] A, B,
    output logic [7:0] result,
    output logic rdy
);
    logic load_regs, sub_regs, borrow, convert;
    
    controller controller_0 (.*);
    datapath datapath_0 (.*);
endmodule

module controller (
    input rst_b, clk, start, borrow,
    output logic load_regs, sub_regs, convert
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
        load_regs = 1'b0;
        sub_regs = 1'b0;
        comp = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle : begin if (start) next_state = S_1; load_regs = 1'b1; rdy = 1'b1; end
            S_1 : begin next_state = S_2; sub_regs = 1'b1; end
            S_2 : begin if (borrow) next_state = S_idle; else comb = 1'b1; next_state = S_idle; end
            default : next_state = S_idle;
        endcase
    end
endmodule

module datapath (
    input [7:0] A, B,
    input load_regs, sub_regs, comb,
    output logic borrow,
    output logic [7:0] result
);
    logic [8:0] RA;
    logic [7:0] RB;

    always_ff @ (posedge clk)
    begin
        if (load_regs)
        begin
            RA <= {1'b0, A};
            RB <= B;
        end
        else if (sub_regs) RA <= RA - RB;
        else if (comb) RA <= ~RA + 1'b1;
    end

    assign borrow = RA[8];
    assign result = RA[7:0];
endmodule
