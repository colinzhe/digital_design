module four_bit_bcd_sync_par_cntr (
    input rstn, clk, cnt_en,
    output [3:0] count,
    output carry, clrnout
);
    assign clrnout = ~(count[3] && count[1]);

    four_bit_sync_par_cntr cntr0 (
        .rstn (rstn),
        .clrn (clrnout),
        .clk (clk),
        .cnt_en (cnt_en),
        .load (1'b0),
        .I (4'b0000),
        .count (count),
        .carry (carry)
    );
endmodule

//module four_bit_bcd_sync_par_cntr (
//    input rstn, clk, cnt_en,
//    output [3:0] count,
//    output carry
//);
//    four_bit_sync_par_cntr cntr0 (
//        .rstn (rstn),
//        .clk (clk),
//        .cnt_en (cnt_en),
//        .load (count[0] && count[3]),
//        .I (4'b0000),
//        .count (count),
//        .carry (carry)
//    );
//endmodule
