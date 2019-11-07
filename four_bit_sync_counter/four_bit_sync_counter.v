module four_bit_sync_counter (
    input rstn, clk, cnt_en,
    output [3:0] count,
    output carry
);
    wire [3:0] T_in;
    
    assign T_in[0] = cnt_en && count[0];
    assign T_in[1] = T_in[0] && count[1];
    assign T_in[2] = T_in[1] && count[2];
    assign T_in[3] = T_in[2] && count[3];
    
    assign carry = T_in[3];
    
    t_ff tff_A0 (
        .rstn (rstn),
        .clk (clk),
        .T (cnt_en),
        .Q (count[0]),
        .Qn ()
    );
    
    t_ff tff_A1 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[0]),
        .Q (count[1]),
        .Qn ()
    );
    
    t_ff tff_A2 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[1]),
        .Q (count[2]),
        .Qn ()
    );
    
    t_ff tff_A3 (
        .rstn (rstn),
        .clk (clk),
        .T (T_in[2]),
        .Q (count[3]),
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