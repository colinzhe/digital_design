module q_8_41_tb;
    reg rst, clk, en, load;
    reg [7:0] data_in;
    wire [15:0] R0;

    q_8_41 dut (.*);

    wire [7:0] P1 = dut.datapath_0.P1;
    wire [7:0] P0 = dut.datapath_0.P0;
    wire [1:0] state = dut.controller_0.state;
    wire clr_P1_P0 = dut.clr_P1_P0;
    wire load_P1_P0 = dut.load_P1_P0;
    wire load_R0 = dut.load_R0;

    initial #300 $finish; // tb duration

    initial
    begin : init_and_clk
        {rst, clk, en, load} = '0;
        forever #5 clk = ~clk;
    end : init_and_clk

    //initial
    //begin : tb
    //    #10 rst = '1;
    //    #10 rst = '0;
    //    #20 en = '1; data_in = 8'h55;
    //    #10 data_in = 8'hAA;
    //    #50 load = '1;
    //    #10 en = '0;
    //    #30 en = '1;
    //    #50 rst = '1;
    //end

    initial
    begin
        #10 rst = '1;
        #20 rst = '0;
    end

    initial
    fork
        #20 data_in = 8'ha5;
        #50 data_in = 8'hff;

        #30 en = '1;
        #70 load = '1;
        #80 load = '0;
        #100 load = '1;
        #100 en = '0;
        #120 load = '0;
    join
endmodule
