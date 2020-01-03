module q_8_41_datapath_tb;
    reg clk, clr_P1_P0, load_P1_P0, load_R0;
    reg [7:0] data_in;
    wire [15:0] R0;

    q_8_41_datapath dut (.*);

    wire [7:0] P1 = dut.P1;
    wire [7:0] P0 = dut.P0;

    initial #100 $finish; // tb duration

    initial
    begin : init_and_clk
        {clk, clr_P1_P0, load_P1_P0, load_R0} = '0;
        data_in = '0;
        forever #5 clk = ~clk;
    end : init_and_clk

    initial
    begin : tb
        #10 clr_P1_P0 = '1;
        #10 load_P1_P0 = '1; clr_P1_P0 = '0;
        data_in = 8'hAA;
        #10 data_in = 8'h55;
        #10 load_P1_P0 = '0; load_R0 = '1;
        #10 load_P1_P0 = '1; load_R0 = '0;
        #10 data_in = 8'hFF;
        #10 data_in = 8'h11;
        #10 load_P1_P0 = '0; load_R0 = '1;
    end : tb
endmodule
