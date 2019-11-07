module four_bit_sync_bcd_cntr (
    input rstn, clk,
    output [3:0] count,
    output carry
);
    wire T_in[3:0];
    wire countn3;

    assign T_in[3] = (count[3] && count[0]) || (count[2] && count[1] && count[0]);
    assign T_in[2] = count[1] && count[0];
    assign T_in[1] = countn3 && count[0];
    assign T_in[0] = 1'b1;

    assign carry = count[3] && count[0];

    t_ff tff_A3 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[3]),
        .Q (count[3]),
        .Qn (countn3)
    );

    t_ff tff_A2 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[2]),
        .Q (count[2]),
        .Qn ()
    );

    t_ff tff_A1 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[1]),
        .Q (count[1]),
        .Qn ()
    );

    t_ff tff_A0 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[0]),
        .Q (count[0]),
        .Qn ()
    );
endmodule

module t_ff (
    input rstn, clk, T,
    output reg Q,
    output Qn
);
    always @ (posedge clk, negedge rstn)
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
