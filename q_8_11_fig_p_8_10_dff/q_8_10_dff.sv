module q_8_10_dff (
    input rst_b, clk, x, y,
    output logic [1:0] state
);
    logic [1:0] D_in, G_out;

    assign D_in[1] = (~G_out[1] & G_out[0]) | (G_out[0] & ~x) | (G_out[1] & ~G_out[0] & x);
    assign D_in[0] = (~G_out[1] & ~G_out[0] & x) | (~G_out[0] & x & y) | (~G_out[1] & G_out[0] & y) | (G_out[0] & ~x & y);

    d_ff dff_1 (
        .D(D_in[1]),
        .Q(G_out[1]),
        .*
    );

    d_ff dff_0 (
        .D(D_in[0]),
        .Q(G_out[0]),
        .*
    );

    assign state = {G_out[1], G_out[0]};
endmodule

module d_ff (
    input rst_b, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) Q = 1'b0;
        else Q <= D;
    end
endmodule
