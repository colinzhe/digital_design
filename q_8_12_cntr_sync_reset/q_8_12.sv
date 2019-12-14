module q_8_12 (
    input rst_sync_b, clk, cnt_en,
    output logic [3:0] cnt,
    output carry
);
    logic [3:0] Q;
    logic [3:0] N;

    assign N[0] = rst_sync_b & cnt_en;
    assign N[1] = N[0] & Q[0];
    assign N[2] = N[1] & Q[1];
    assign N[3] = N[2] & Q[2];
    assign carry = N[3] & Q[3];
    assign cnt = Q;

    jk_ff jkff_0 (
        .J(N[0]),
        .K(N[0] | ~rst_sync_b),
        .Q(Q[0]),
        .*
    );

    jk_ff jkff_1 (
        .J(N[1]),
        .K(N[1] | ~rst_sync_b),
        .Q(Q[1]),
        .*
    );

    jk_ff jkff_2 (
        .J(N[2]),
        .K(N[2] | ~rst_sync_b),
        .Q(Q[2]),
        .*
    );

    jk_ff jkff_3 (
        .J(N[3]),
        .K(N[3] | ~rst_sync_b),
        .Q(Q[3]),
        .*
    );
endmodule

module jk_ff (
    input clk, J, K,
    output logic Q
);
    always_ff @ (posedge clk)
    begin
        Q <= (J & ~Q) | (~K & Q);
    end
endmodule
