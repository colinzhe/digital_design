module four_bit_bcd_rip_tff_cntr_beh (
    input rstn, cnt_en,
    output [3:0] count,
    output rstn_int
);

    assign rstn_int = !(count[3] && count[1]);

    four_bit_rip_cntr rip_cntr (
        .rstn (rstn),
        .cnt_en (cnt_en),
        .clrn (rstn_int),
        .A (count)
    );
endmodule

module four_bit_rip_cntr (
    input rstn, cnt_en, clrn,
    output [3:0] A
);
    reg A0, A1, A2, A3;
    assign A = {A3, A2, A1, A0};

    always @ (negedge cnt_en, negedge rstn, negedge clrn)
    begin
        if (!rstn || !clrn) A0 <= 1'b0; else A0 <= ~A0;
    end

    always @ (negedge A0, negedge rstn, negedge clrn)
    begin
        if (!rstn || !clrn) A1 <= 1'b0; else A1 <= ~A1;
    end

    always @ (negedge A1, negedge rstn, negedge clrn)
    begin
        if (!rstn || !clrn) A2 <= 1'b0; else A2 <= ~A2;
    end

    always @ (negedge A2, negedge rstn, negedge clrn)
    begin
        if (!rstn || !clrn) A3 <= 1'b0; else A3 <= ~A3;
    end
endmodule
