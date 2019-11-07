module q_5_45_tb;
    reg rstn, clk, x_in;
    wire y_out;
    wire [1:0] state;

    q_5_45 dut (
        rstn, clk, x_in,
        y_out, state
    );

    initial
    begin
        {rstn, clk, x_in} = 3'b000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        #200 $finish;
    join

    initial
    fork
        forever #5 clk = ~clk;
        forever #10 x_in = $random;
    join
endmodule
