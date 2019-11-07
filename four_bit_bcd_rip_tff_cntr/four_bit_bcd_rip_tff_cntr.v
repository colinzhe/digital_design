module four_bit_bcd_rip_tff_cntr (
    input rstn, cnt_en,
    output [3:0] count
);
    wire rstn_int;

    assign rstn_int = ~(count[3] && count[1]);

    t_ff tff_A0 (
        .rstn (rstn && rstn_int),
        .clk (cnt_en),
        .T (1'b1),
        .Q (count[0]),
        .Qn ()
    );

    t_ff tff_A1 (
        .rstn (rstn && rstn_int),
        .clk (count[0]),
        .T (1'b1),
        .Q (count[1]),
        .Qn ()
    );

    t_ff tff_A2 (
        .rstn (rstn && rstn_int),
        .clk (count[1]),
        .T (1'b1),
        .Q (count[2]),
        .Qn ()
    );

    t_ff tff_A3 (
        .rstn (rstn && rstn_int),
        .clk (count[2]),
        .T (1'b1),
        .Q (count[3]),
        .Qn ()
    );
endmodule

module t_ff (
    input rstn, clk, T,
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
            Q <= T ? ~Q : Q;
        end
    end

    assign Qn = ~Q;
endmodule
