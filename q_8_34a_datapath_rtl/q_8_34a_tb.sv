import q_8_34a_pkg::*;

module q_8_34a_tb;
    reg rst_b, clk;
    reg [data_size-1:0] data_in;
    reg load_regs, incr_r2, shift;
    wire zero, E;

    q_8_34a dut (.*);

    initial #300 $finish; // tb duration

    initial
    begin : clk_and_rsts
        {rst_b, clk} = '0;
        data_in = '0;
        {load_regs, incr_r2, shift} = '0;
    end : clk_and_rsts

    initial
    begin : tb
        #10 rst_b = 1'b1;
        #10 load_regs = 1'b1; data_in = 4'b1010;
        #10 load_regs = 1'b0; incr_r2 = 1'b1;
        #10 incr_r2 = 1'b0; shift = 1'b1;
        #10 incr_r2 = 1'b1; shift = 1'b0;
    end : tb
endmodule
