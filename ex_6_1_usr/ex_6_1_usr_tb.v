module ex_6_1_usr_tb;
    reg rstn, clk, MSB_in, LSB_in;
    reg [3:0] I_par;
    reg [1:0] sel;
    wire [3:0] A_par;

    ex_6_1_usr dut (
        rstn, clk, MSB_in, LSB_in,
        I_par, sel,
        A_par
    );

    initial
    begin
        {rstn, clk, MSB_in, LSB_in} = 4'b0000;
        I_par = 4'b0000;
        sel = 2'b00;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        #30 I_par = 4'b1010; // initialize I_par
        #40 sel = 2'b11; // load in I_par
        #60 sel = 2'b01; // shift right zeroes
        #150 MSB_in = 1'b1; // shift right ones
        #250 LSB_in = 1'b1;
        #400 sel = 2'b10; // shift left ones
        #550 LSB_in = 1'b0;
        #650 I_par = 4'b1111;
        #700 sel = 2'b11; // load in new I_par
        #750 rstn = 1'b0; // hold reset
        #800 rstn = 1'b1; // release reset
        #900 sel = 2'b00; // hold value
        #1000 $finish;
    join
endmodule
