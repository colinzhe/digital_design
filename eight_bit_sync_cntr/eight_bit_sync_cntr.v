module eight_bit_sync_cntr (
    input rstn, clk, cnt_en,
    output [7:0] count,
    output carry
);
    wire carry_tmp;

    four_bit_sync_cntr cntr0 (
        .rstn (rstn),
        .clk (clk),
        .cnt_en (cnt_en),
        .count (count[3:0]),
        .carry (carry_tmp)
    );

    four_bit_sync_cntr cntr1 (
        .rstn (rstn),
        .clk (clk),
        .cnt_en (carry_tmp),
        .count (count[7:4]),
        .carry (carry)
    );
endmodule
