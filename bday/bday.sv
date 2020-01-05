import bday_pkg::*;
`define arry_cntr_method
module bday (
    input rst_b, clk,
`ifdef state_method
    input start,
`endif
    output logic [6:0] led [3:0]
);
    logic clk_d;
    logic [25:0] clk_cnt;
    state_t state;

    always_ff @ (posedge clk, negedge rst_b)
    begin : clk_divider
        if (!rst_b)
        begin
            clk_cnt <= '0;
            clk_d = '0;
        end
        else
        begin
            clk_cnt <= clk_cnt + 1'b1;
            if (clk_cnt == 10000000)
            //if (clk_cnt == 2)
            begin
                clk_cnt <= '0;
                clk_d <= !clk_d;
            end
        end
    end : clk_divider

`ifdef state_method
    always_ff @ (posedge clk_d, negedge rst_b)
    begin : sm
        if (!rst_b)
        begin
            state <= S_idle;
            for (int i = 0; i < 4; i++) led[i] <= '1;
        end
        else
            case (state)
                S_idle : if (start) state <= S_1; else state <= S_idle;
                S_1 : begin state <= S_2; led[0] = H; led[1] = A; led[2] = P; led[3] = P; end
                S_2 : begin state <= S_3; led[0] = A; led[1] = P; led[2] = P; led[3] = Y; end
                S_3 : begin state <= S_4; led[0] = P; led[1] = P; led[2] = Y; led[3] = BLANK; end 
                S_4 : begin state <= S_5; led[0] = P; led[1] = Y; led[2] = BLANK; led[3] = B; end
                S_5 : begin state <= S_6; led[0] = Y; led[1] = BLANK; led[2] = B; led[3] = D; end
                S_6 : begin state <= S_7; led[0] = BLANK; led[1] = B; led[2] = D; led[3] = A; end
                S_7 : begin state <= S_8; led[0] = B; led[1] = D; led[2] = A; led[3] = Y; end
                S_8 : begin state <= S_9; led[0] = D; led[1] = A; led[2] = Y; led[3] = BLANK; end
                S_9 : begin state <= S_10; led[0] = A; led[1] = Y; led[2] = BLANK; led[3] = S; end
                S_10 : begin state <= S_11; led[0] = Y; led[1] = BLANK; led[2] = S; led[3] = A; end
                S_11 : begin state <= S_12; led[0] = BLANK; led[1] = S; led[2] = A; led[3] = T; end
                S_12 : begin state <= S_13; led[0] = S; led[1] = A; led[2] = T; led[3] = O; end
                S_13 : begin state <= S_14; led[0] = A; led[1] = T; led[2] = O; led[3] = BLANK; end
                S_14 : begin state <= S_15; led[0] = T; led[1] = O; led[2] = BLANK; led[3] = C; end
                S_15 : begin state <= S_16; led[0] = O; led[1] = BLANK; led[2] = C; led[3] = H; end
                S_16 : begin state <= S_17; led[0] = BLANK; led[1] = C; led[2] = H; led[3] = A; end
                S_17 : begin state <= S_18; led[0] = C; led[1] = H; led[2] = A; led[3] = N; end
                S_18 : begin state <= S_19; led[0] = H; led[1] = A; led[2] = N; led[3] = BLANK; end
                S_19 : begin state <= S_20; led[0] = A; led[1] = N; led[2] = BLANK; led[3] = H; end
                S_20 : begin state <= S_21; led[0] = N; led[1] = BLANK; led[2] = H; led[3] = A; end
                S_21 : begin state <= S_1; led[0] = BLANK; led[1] = H; led[2] = A; led[3] = P; end
                default : state <= S_idle;
            endcase
    end : sm
`elsif arry_cntr_method
    always_ff @ (posedge clk_d, negedge rst_b)
    begin
        if (!rst_b)
        begin
            for (int i = 0; i < 3; i++) led[i] <= '1;
        end
        else
        begin
            for (int i = 0; i < 3; i++) led[i] <= led[i + 1];
        end
    end

    logic [cntr_size-1:0] cntr;

    always_ff @ (posedge clk_d, negedge rst_b)
    begin
        if (!rst_b)
        begin
            cntr <= '0;
            led[3] <= '1;
        end
        else
        begin
            led[3] <= msg[cntr];
            if (cntr < msg_size-1)
                cntr <= cntr + 1'b1;
            else
                cntr <= '0;
        end
    end
`else
`endif
endmodule

//module clk_divider #(parameter DIVISOR = 50_000_000) (
//    input clk_in,
//    output logic clk_out
//);
//    reg [27:0] cntr = '0;
//    always_ff @ (posedge clk_in)
//    begin
//        cntr <= cntr + 1'b1;
//        if (cntr >= (DIVISOR - 1))
//            cntr <= '0;
//    end
//
//    assign clk_out = (cntr < DIVISOR/2) ? '0 : '1;
//endmodule
