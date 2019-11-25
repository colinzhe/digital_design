module ex_8_2_asmd_tb;
    reg rstb, clk, start;
    wire [3:0] A;
    wire E, F;
    wire [1:0] state, next_state;
    wire set_E, clr_E, set_F, clr_A_F, incr_A, A2, A3;

    ex_8_2_asmd dut (
        rstb, clk, start,
        A, E, F,
        state, next_state,
        set_E, clr_E, set_F, clr_A_F, incr_A, A2, A3
    );

    initial #500 $finish;

    initial
    begin
        {rstb, clk, start} = 3'b000;
        #5 rstb = 1'b1; start = 1'b1;
        repeat (32) #5 clk = ~clk;
    end
endmodule
