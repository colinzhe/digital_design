module q_6_47_tb;
    reg rstb, clk, x_in;
    wire odd_out;

    q_6_47 dut (
        rstb, clk, x_in,
        odd_out
    );

    initial
    begin
        {rstb, clk, x_in} = 3'b000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        forever #10 x_in = $random;
        #200 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
        #100 rstb = 1'b0;
        #10 rstb = 1'b1;
    end
endmodule
