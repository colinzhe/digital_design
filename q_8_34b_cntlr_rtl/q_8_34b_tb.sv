import q_8_34b_pkg::*;

module q_8_34b_tb;
    reg rst_b, clk, start;
    reg zero, E;
    wire load_regs, incr_r2, shift;
    
    q_8_34b dut (.*);

    wire [1:0] state = dut.state;

    initial #400 $finish; // tb duration

    initial
    begin : rst_and_clk
        {rst_b, clk} = '0;
        {start, zero, E} = '0;
        forever #5 clk = ~clk;
    end : rst_and_clk

    initial
    begin : tb
        #10 rst_b = 1'b1; // stay in S_idle
        #30 start = 1'b1; // go to S_1
        #10 zero = 1'b1; // go back to S_idle
        #10 zero = 1'b0; // go to S_1 -> S_2 -> S3, then back to S2 then S3 and repeat
        #100 E = 1'b1; // go from S_3 to S_1, then S_2, S_3, then S_1
        #50 zero = 1'b1; start = 1'b0; // go back to S_idle from S_1, then stay in S_idle
        #50 start = 1'b1; // go to S_1
        #20 rst_b = 1'b0; // async reset
        #10 rst_b = 1'b1;
    end : tb
endmodule
