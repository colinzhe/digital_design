import q_8_40_pkg::*;

module q_8_40 (
    input rst_b, clk, start,
    input [7:0] M,
    output logic rdy,
    output logic send_output,
    output logic [7:0] P
);
    logic run, init_regs, calc_done, output_done, load_bus, load_done;

    // controller begins
    state_t state, next_state;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) state <= S_idle;
        else state <= next_state;
    end

    always_comb
    begin
        next_state = S_idle;
        {run, init_regs, load_bus, send_output, rdy} = '0;
        case (state)
            S_idle :
            begin
                if (start)
                begin
                    next_state = S_wait_load;
                    init_regs = '1;
                end
                rdy = '1;
            end
            S_wait_load :
            begin
                if (load_done) next_state = S_run;
                else next_state = S_wait_load;
                load_bus = '1;
            end
            S_run :
            begin
                if (calc_done) next_state = S_output;
                else next_state = S_run;
                run = '1;
            end
            S_output :
            begin
                if (output_done) next_state = S_idle;
                else next_state = S_output;
                send_output = '1;
            end
            default : next_state = S_idle;
        endcase
    end
    // controller ends

    // datapath begins
    logic [31:0] A, B, Q;
    logic [64:0] AQ;
    logic C;
    logic [4:0] calc_cntr;
    logic [2:0] load_cntr;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            {A, B, Q, C, P, load_cntr, calc_cntr} <= '0;
            {load_done, output_done} <= '0;
        end
        else
            if (init_regs)
            begin
                calc_cntr <= '1;
                load_cntr <= 3'd7;
                {A, B, Q, C} <= '0;
            end
            else if (load_bus)
            begin
                if (!load_done)
                    case (load_cntr)
                        3'h7 : B[7:0] <= M;
                        3'h6 : Q[7:0] <= M;
                        3'h5 : B[15:8] <= M;
                        3'h4 : Q[15:8] <= M;
                        3'h3 : B[23:16] <= M;
                        3'h2 : Q[23:16] <= M;
                        3'h1 : B[31:24] <= M;
                        3'h0 : Q[31:24] <= M;
                    endcase
                if (load_cntr == '0)
                begin
                    load_done <= '1;
                    load_cntr <= 3'd7;
                end
                else
                begin
                    if (!load_done)
                        load_cntr <= load_cntr - 1'b1;
                    else
                        load_done <= 1'b0;
                end
            end
            else if (run)
            begin
                if (Q[0] == '1)
                begin
                    {C, A} = A + B;
                    {C, A, Q} = {C, A, Q} >> 1;
                end
                else
                    {C, A, Q} = {C, A, Q} >> 1;
                calc_cntr <= calc_cntr - 1'b1;
            end
            else if (send_output)
            begin
                case (load_cntr)
                    3'h7 : P <= AQ[7:0];
                    3'h6 : P <= AQ[15:8];
                    3'h5 : P <= AQ[23:16];
                    3'h4 : P <= AQ[31:24];
                    3'h3 : P <= AQ[39:32];
                    3'h2 : P <= AQ[47:40];
                    3'h1 : P <= AQ[55:48];
                    3'h0 : P <= AQ[63:56];
                endcase
                if (load_cntr == '0) output_done = '1;
                else load_cntr--;
            end
    end

    assign calc_done = (calc_cntr == '0);
    assign AQ = {A, Q};
endmodule
