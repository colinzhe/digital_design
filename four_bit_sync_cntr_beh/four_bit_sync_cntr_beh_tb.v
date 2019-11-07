module four_bit_sync_cntr_beh_tb;
    reg rstn, clk, cnt_en;
    wire [3:0] count;
    wire carry;
    
    four_bit_sync_cntr_beh dut (
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
        forever #10 cnt_en = $random;
        forever #5 clk = ~clk;
        #1000 $finish;
    join
endmodule
