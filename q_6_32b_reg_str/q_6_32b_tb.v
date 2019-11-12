module q_6_32b_tb;
    reg rstb, clk, load;
    reg [3:0] I;
    wire [3:0] A;

    q_6_32b dut (
        rstb, clk, load, I,
        A
    );

    initial
    begin
        {rstb, clk, load} = 3'b000;
        I = 4'b0000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        forever #10 I = $random;
        #500 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
        #100 load = 1'b1;
        #50 load = 1'b0;
        #50 rstb = 1'b0;
        #30 rstb = 1'b1;
        #100 load = 1'b1;
        #50 rstb = 1'b0;
        #10 load = 1'b0;
        #30 load = 1'b1;
        #50 rstb = 1'b1;
    end
endmodule
