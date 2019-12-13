import q_8_9_pkg::*;

module q_8_9_tb;
    reg rst_b, clk, start, A3, A2;
    wire clr_A_F, incr_A, clr_E, set_E, set_F;

    q_8_9 dut (.*);

    wire [st_width-1:0] state = dut.state;

    initial #100 $finish;

    initial
    begin : reset_clock
        {rst_b, clk, start} = 3'b000;
        forever #5 clk = ~clk;
    end : reset_clock

    initial
    begin : test_bench
        #10 rst_b = 1'b1;
        start = 1'b1; A2 = 1'b0; A3 = 1'b0; // go to S_1
        #10 start = 1'b0;
        #10 A2 = 1'b1; A3 = 1'b0; // stay in S_1
        #20 A2 = 1'b1; A3 = 1'b1; // go to S_2
        #20 A2 = 1'b0; A3 = 1'b0;
    end : test_bench
endmodule
