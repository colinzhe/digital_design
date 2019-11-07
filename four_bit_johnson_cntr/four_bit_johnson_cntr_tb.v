module four_bit_johnson_cntr_tb;
    reg rstn, clk;
    wire [7:0] count;

    four_bit_johnson_cntr dut (
        rstn, clk,
        count
    );

    initial
    begin
        {rstn, clk} = 2'b00;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        #200 $finish;
    join
endmodule
