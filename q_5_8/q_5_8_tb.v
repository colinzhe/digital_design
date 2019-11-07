module q_5_8_tb;
    reg rstn, clk;
    wire [1:0] y_out;

    q_5_8 dut (
        rstn, clk,
        y_out
    );

    initial
    begin
        {rstn, clk} = 2'b00;
        #10 rstn = 1'b1;
        #190 $finish;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end
endmodule
