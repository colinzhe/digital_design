module four_bit_sync_par_cntr_tb;
    reg rstn, clk, cnt_en, load;
    reg [3:0] I;
    wire [3:0] count;
    wire carry;

    four_bit_sync_par_cntr dut (
        rstn, clk, cnt_en, load, I,
        count, carry
    );

    initial
    begin
        rstn = 1'b0;
        clk = 1'b0;
        cnt_en = 1'b0;
        load = 1'b0;
        I = 4'b0000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        #1000 rstn = 1'b0;
        #1010 rstn = 1'b1;
        forever #5 clk = ~clk;
        #10 I = 4'b1111;
        #20 load = 1'b1;
        #30 {load, cnt_en} = 2'b01;
        #200 {load, cnt_en} = 2'b00;
        #100 I = 4'b0101;
        #250 {load, cnt_en} = 2'b11;
        #500 load = 1'b0;
        //forever #10 {cnt_en, load} = $random;
        #2000 $finish;
    join
endmodule
