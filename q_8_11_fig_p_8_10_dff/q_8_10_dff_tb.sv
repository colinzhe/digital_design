module q_8_10_dff_tb;
    reg rst_b, clk, x, y;
    wire [1:0] state;

    q_8_10_dff dut (.*);

    initial #200 $finish; // duration of tb

    initial
    begin : clk_and_rst
        {rst_b, clk, x, y} = 4'h0;
        forever #5 clk = ~clk;
    end : clk_and_rst

    initial
    begin : tb
        #10 rst_b = 1'b1;
        #10 x = 1'b1; // go to S_1
        #10 x = 1'b0; // y = 0, so go to S_2
        #10; // x = 0; y = 0, so go back to S_0
        #10 x = 1'b1; // go to S_1
        #10; // x = 1; y = 0, so go to S_2
        #10; // x = 1; y = 0, so stay in S_2
        #10 y = 1'b1; // x = 1, so go to S_3
        #10; // x = 1, y = 1, so go back to S_0
        #10; // x = 1, y = 1, so go to S_1
        #10; // x = 1, y = 1, so go to S_3
        #10 x = 1'b0; // y = 1, so stay in S_3
        #10 y = 1'b0; // x = 0, so go to S_2
        #10 rst_b = 1'b0; // async reset
        #10 rst_b = 1'b1; // release reset
        #10; // x = 0, y = 0, so stay in S_0
    end
endmodule
