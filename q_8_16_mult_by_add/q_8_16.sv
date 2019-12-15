import q_8_16_pkg::*;

module q_8_16 (
    input rst_b, clk, start,
    input [data_width-1:0] A, B,
    output logic rdy,
    output logic [data_width*2-1:0] P
);
    state_t state, next_state;
    logic load, add, decr_cntr;
    logic cntr_eq_zero;
    logic [cntr_width-1:0] cntr;
    logic [data_width-1:0] RA, RB;
    logic [data_width*2-1:0] RP;

    // controller begins
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        load = 1'b0;
        add = 1'b0;
        decr_cntr = 1'b0;
        rdy = 1'b0;
        case (state)
            S_idle :
            begin
                if (start) begin next_state = S_1; load = 1'b1; end
                rdy = 1'b1;
            end
            S_1 :
            begin
                if (cntr_eq_zero) next_state = S_idle;
                else begin add = 1'b1; next_state = S_1; decr_cntr = 1'b1; end
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
            RA <= {data_width{1'b0}};
            RB <= {data_width{1'b0}};
            RP <= {data_width*2{1'b0}};
        end
        else
        begin
            if (load)
            begin
                RA <= A;
                RB <= B;
                RP <= {data_width*2{1'b0}};
            end
            else if (add) RP <= RP + RB;
            else RA <= RA;
            if (decr_cntr) RA <= RA - 1'b1;
        end
    end

    assign cntr_eq_zero = (RA == {data_width{1'b0}});
    assign P = RP;
    // datapath ends
endmodule
