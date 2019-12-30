import q_8_37_pkg::*;

module q_8_37 (
    input rst_b, clk, start,
    input [data_size-1:0] data_in,
    output logic [r2_size-1:0] cnt,
    output logic rdy
);
    logic load_regs, add_shift, zero;

    controller controller_0 (.*);
    datapath datapath_0 (.*);
endmodule

module controller (
    input rst_b, clk, start, zero,
    output logic rdy, load_regs, add_shift
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
        add_shift = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle : if (start) begin next_state = S_running; load_regs = 1'b1; rdy = 1; end
            S_running : if (zero) next_state = S_idle; else begin add_shift = 1'b1; next_state = S_running; end
            default : next_state = S_idle;
        endcase
    end
endmodule

module datapath (
    input rst_b, clk,
    input load_regs, add_shift,
    input [data_size-1:0] data_in,
    output [r2_size-1:0] cnt,
    output zero
);
    logic [r2_size-1:0] r2;
    logic [data_size-1:0] r1;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            r1 <= '0;
            r2 <= '0;
        end
        else
        begin
            if (load_regs)
            begin
                r1 <= data_in;
                r2 <= '0;
            end
            else if (add_shift)
            begin
                r2 <= r2 + r1[0];
                r1 = r1 >> 1;
            end
        end
    end

    assign zero = (r1 == '0);
    assign cnt = r2;
endmodule
