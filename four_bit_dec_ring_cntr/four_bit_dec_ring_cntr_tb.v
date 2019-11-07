module four_bit_dec_ring_cntr_tb;
    reg rstn, clk, cnt_en;
    wire [3:0] count;

    four_bit_dec_ring_cntr dut (
        rstn, clk, cnt_en,
        count
    );

    initial
    begin
        {rstn, clk, cnt_en} = 3'b000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        #10 cnt_en =1'b1;
        #1000 $finish;
    join
endmodule
