module four_bit_rip_cntr_tb;
    reg rstn, cnt_en;
    wire [3:0] count;

    four_bit_rip_cntr dut (
        rstn, cnt_en,
        count
    );

    initial
    begin
        {rstn, cnt_en} = 2'b00;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #10 cnt_en = $random;
        #1000 $finish;
    join
endmodule
