module q_6_2_tb;
    reg rst, clk, load;
    reg [3:0] I;
    wire [3:0] A;

    q_6_2 dut (
        rst, clk, load,
        I,
        A
    );

    initial
    begin
        {rst, clk, load} = 3'b100;
        I = 4'b0000;
    end

    initial
    fork
        #10 rst = 1'b0;
        forever #5 clk = ~clk;
        #30 I = 4'b1010;
        #50 I = 4'b1111;
        #70 load = 1'b1;
        #80 load = 1'b0;
        #100 rst = 1'b1;
        #110 I = 4'b0011;
        #120 load = 1'b1;
        #140 rst = 1'b0;
        #150 load = 1'b0;
        #200 $finish;
    join
endmodule
