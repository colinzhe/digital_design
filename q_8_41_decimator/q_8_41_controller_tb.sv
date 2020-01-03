module q_8_41_controller_tb;
    reg rst, clk, en, load;
    wire clr_P1_P0, load_P1_P0, load_R0;

    q_8_41_controller dut (.*);

    wire [1:0] state = dut.state;

    initial #300 $finish; // tb duration

    initial
    begin : init_and_clk
        {rst, clk, en, load} = '0;
        forever #5 clk = ~clk;
    end : init_and_clk

    initial
    begin : tb
        #10 rst = '1;
        #10 rst = '0;
        #20 en = '1;
        #50 load = '1;
        #10 en = '0;
        #30 en = '1;
        #50 rst = '1;
    end
endmodule
