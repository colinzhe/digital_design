module four_bit_bcd_sync_par_cntr_tb;
    reg rstn, clk, cnt_en;
    wire [3:0] count;
    wire carry, clrnout;

    four_bit_bcd_sync_par_cntr dut (
        rstn, clk, cnt_en,
        count, carry, clrnout
    );

    initial
    begin
        rstn = 1'b0;
        clk = 1'b0;
        cnt_en = 1'b0;
    end

    initial
    fork
        #10 rstn = 1'b1;
        #10 cnt_en = 1'b1;
        #1050 rstn = 1'b0;
        #1060 rstn = 1'b1;
        forever #5 clk = ~clk;
        #2000 $finish;
    join
endmodule
