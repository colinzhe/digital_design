module q_5_46_tb;
    reg rstn, clk, x_in;
    wire [3:0] state;

    q_5_47 dut (
        rstn, clk, x_in,
        state
    );

    initial
    begin
        {rstn, clk, x_in} = 3'b000;
        #10 rstn = 1'b1;
    end

    initial
    begin
        #300 $finish;
    end

    always
    begin
        #5 clk = ~clk;
    end

    initial
    begin
        forever #10 x_in = $random;
    end
endmodule
