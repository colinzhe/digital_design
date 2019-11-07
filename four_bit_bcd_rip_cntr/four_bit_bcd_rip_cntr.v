module four_bit_bcd_rip_cntr (
    input rstn, cnt_en,
    output [3:0] count
);
    wire A3n;

    jk_ff jkff_A0 (
        .rstn (rstn),
        .clk (cnt_en),
        .J (1'b1),
        .K (1'b1),
        .Q (count[0]),
        .Qn ()
    );

    jk_ff jkff_A1 (
        .rstn (rstn),
        .clk (count[0]),
        .J (A3n),
        .K (1'b1),
        .Q (count[1]),
        .Qn ()
    );

    jk_ff jkff_A2 (
        .rstn (rstn),
        .clk (count[1]),
        .J (1'b1),
        .K (1'b1),
        .Q (count[2]),
        .Qn ()
    );

    jk_ff jkff_A3 (
        .rstn (rstn),
        .clk (count[0]),
        .J (count[1] && count[2]),
        .K (1'b1),
        .Q (count[3]),
        .Qn (A3n)
    );
endmodule

module jk_ff (
    input rstn, clk, J, K,
    output reg Q,
    output Qn
);
    always @ (negedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
        end
        else
        begin
            Q <= J && Qn || ~K && Q;
        end
    end

    assign Qn = ~Q;
endmodule
