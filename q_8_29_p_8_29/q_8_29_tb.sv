module q_8_29_tb;
    reg rst_b, clk;
    reg x, y, F, E;
    wire [2:0] state;
    wire [7:0] dec_out;

    q_8_29 dut (.*);

    initial #300 $finish;

    initial
    begin : rst_val_and_clock
        {rst_b, clk} = 2'b00;
        {x, y, F, E} = 4'h0;
        forever #5 clk = ~clk;
    end

    initial
    begin : tb
        #10 rst_b = 1'b1;
        #30; // stay in S0
        x = 1'b1; #40; // S1 -> S2 -> S4 -> S6 -> S7 -> S0
        x = 1'b0; y = 1'b1; #50; // S2 -> S4 -> S6 -> S7 -> S0
        F = 1'b1; #40; // S2 -> S3 -> S0
        E = 1'b1; F = 1'b0; #50; // S2 -> S4 -> S5 -> S0
    end
endmodule
