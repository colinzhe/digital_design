module q_5_16b_tb;
    reg rstn, clk, x_in;
    wire [1:0] y_out;

    q_5_16b dut (
        rstn, clk, x_in,
        y_out
    );

    always
    begin
        #5 clk = ~clk;
        #10 x_in = $random;
    end

    initial
    fork
        {rstn, clk, x_in} = 3'b000;
        #10 rstn = 1'b1;
        #1000 $finish;
    join
endmodule
