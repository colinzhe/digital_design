module q_8_9_str_tb;
    reg rst_b, clk, start, A3, A2;
    wire clr_A_F, incr_A, clr_E, set_E, set_F;

    q_8_9_str dut (.*);

    wire [2:0] state = {<<{dut.Q_out}};

    initial #150 $finish;

    initial
    begin : reset_clock
        {rst_b, clk, start} = 3'b000;
        {A3, A2} = 2'b00;
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
        #10 start = 1'b1; A2 = 1'b0; A3 = 1'b0;
        #20 rst_b = 1'b0;
        #10 start = 1'b0;
        #10 rst_b = 1'b1;
    end : test_bench
endmodule
