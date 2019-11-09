module q_6_20 (
    input rstb, clk, cnt_en,
    output [7:0] count,
    output carry
);
    wire load, msb_cnt_en;
    assign carry = &count[6:0];
    //assign load = carry;
    wire clrb;
    assign clrb = ~(count[7]);

    four_bit_sync_par_cntr cntr_lsb (
        .rstn (rstb && clrb),
        .clk (clk),
        .cnt_en (cnt_en),
        //.load (load),
        .load (1'b0),
        .I (4'b0000),
        .count (count[3:0]),
        .carry (msb_cnt_en)
    );

    four_bit_sync_par_cntr cntr_msb (
        .rstn (rstb && clrb),
        .clk (clk),
        .cnt_en (msb_cnt_en),
        //.load (load),
        .load (1'b0),
        .I (4'b0000),
        .count (count[7:4]),
        .carry ()
    );
endmodule
