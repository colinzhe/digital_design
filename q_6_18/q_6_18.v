module q_6_18 (
    input rstn, clk, up, down,
    output [3:0] count,
    output carry,
    output [3:0] T_in
);
    wire [3:0] countn;

    wire T01 = ~up && down;
    wire T02 = up && ~down;
    wire T10 = T01 && countn[0];
    wire T11 = T02 && count[0];
    wire T20 = T10 && countn[1];
    wire T21 = T11 && count[1];
    wire T30 = T20 && countn[2];
    wire T31 = T21 && count[2];
    wire T40 = T30 && countn[3];
    wire T41 = T31 && count[3];

    assign T_in[0] = T01 || T02;
    assign T_in[1] = T10 || T11;
    assign T_in[2] = T20 || T21;
    assign T_in[3] = T30 || T31;

    t_ff tff_A0 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[0]),
        .Q (count[0]),
        .Qn (countn[0])
    );

    t_ff tff_A1 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[1]),
        .Q (count[1]),
        .Qn (countn[1])
    );

    t_ff tff_A2 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[2]),
        .Q (count[2]),
        .Qn (countn[2])
    );

    t_ff tff_A3 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[3]),
        .Q (count[3]),
        .Qn (countn[3])
    );

    assign carry = T40 || T41;
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
