module q_6_51_tb;
    reg rstb, clk, x_in;
    wire [2:0] shift_reg;
    wire y_out;

    q_6_51 dut (
        rstb, clk, x_in,
        shift_reg, y_out
    );

    initial
    begin
        {rstb, clk, x_in} = 3'b000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        forever #10 x_in = $random;
        #1000 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
    end
endmodule
