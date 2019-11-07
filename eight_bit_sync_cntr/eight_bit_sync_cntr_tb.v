module eight_bit_sync_cntr_tb;
    reg rstn, clk, cnt_en;
    wire [7:0] count;
    wire carry;

    eight_bit_sync_cntr dut (
        rstn, clk, cnt_en,
        count, carry
    );

    initial
    begin
        {rstn, clk, cnt_en} = 3'b000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        #10 cnt_en = 1'b1;
        forever #5 clk = ~clk;
        #100000 $finish;
    join
endmodule
