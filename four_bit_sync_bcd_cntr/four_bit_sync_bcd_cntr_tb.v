module four_bit_sync_bcd_cntr_tb;
    reg rstn, clk;
    wire [3:0] count;
    wire carry;

    four_bit_sync_bcd_cntr dut (
        rstn, clk,
        count, carry
    );

    initial
    begin
        {rstn, clk} = 2'b00;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        #1000 $finish;
    join
endmodule
