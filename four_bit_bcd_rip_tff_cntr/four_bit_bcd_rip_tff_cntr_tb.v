module four_bit_bcd_rip_tff_cntr_tb;
    reg rstn, cnt_en;
    wire [3:0] count;
    wire rstn_int;

    four_bit_bcd_rip_tff_cntr_beh dut (
        rstn, cnt_en,
        count, rstn_int
    );

    initial
    begin
        {rstn, cnt_en} = 2'b00;
    end

    initial
    fork
        #50 rstn = 1'b1;
        forever #5 cnt_en = ~cnt_en;
        //forever #10 cnt_en = $random;
        #1000 $finish;
    join
endmodule
