module four_bit_rip_cntr (
    input rstn, cnt_en,
    output [3:0] count
);
    t_ff tff_A0 (
        .rstn (rstn),
        .clk (cnt_en),
        .T (1'b1),
        .Q (count[0]),
        .Qn ()
    );

    t_ff tff_A1 (
        .rstn (rstn),
        .clk (count[0]),
        .T (1'b1),
        .Q (count[1]),
        .Qn ()
    );

    t_ff tff_A2 (
        .rstn (rstn),
        .clk (count[1]),
        .T (1'b1),
        .Q (count[2]),
        .Qn ()
    );

    t_ff tff_A3 (
        .rstn (rstn),
        .clk (count[2]),
        .T (1'b1),
        .Q (count[3]),
        .Qn ()
    );
endmodule

module t_ff (
    input rstn, clk, T,
    output reg Q, Qn
);
    always @ (negedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
            Qn <= 1'b1;
        end
        else
        begin
            Q <= T ? ~Q : Q;
            Qn <= ~Qn;
        end
    end
endmodule
