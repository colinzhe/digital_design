module four_bit_sync_counter_tb;
    reg rstn, clk, cnt_en;
    wire [3:0] count;
    wire carry;
    
    four_bit_sync_counter dut (
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
        #1000 $finish;
    join
endmodule