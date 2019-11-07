module q_5_27_tb;
    reg rstn, clk, x_in;
    wire y_out;
    wire [1:0] state, next_state;

    q_5_27 dut (
        rstn, clk, x_in,
        y_out, state, next_state
    );

    initial
    begin
        #200 $finish;
    end

    initial
    begin
        {rstn, clk, x_in} = 3'b000;
        forever #5 clk = ~clk;
    end

    initial
    fork
        #2 rstn = 1;
        #87 rstn = 0;
        #89 rstn = 1;
        #10 x_in = 1;
        #30 x_in = 0;
        #40 x_in = 1;
        #50 x_in = 0;
        #52 x_in = 1;
        #54 x_in = 0;
        #70 x_in = 1;
        #80 x_in = 1;
        #70 x_in = 0;
        #90 x_in = 1;
        #100 x_in = 0;
        #120 x_in = 1;
        #160 x_in = 0;
        #170 x_in = 1;
    join
endmodule
