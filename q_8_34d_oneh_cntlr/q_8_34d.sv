module q_8_34d (
    input rst_b, clk, start,
    input zero, E,
    output logic load_regs, incr_r2, shift, rdy
);
    logic [3:0] D_in;
    logic [3:0] Q_out;

    assign D_in[0] = (~start & Q_out[0]) || (Q_out[1] & zero);
    assign D_in[1] = (Q_out[0] & start) || (E & Q_out[3]);
    assign D_in[2] = (Q_out[1] & ~zero) || (~E & Q_out[3]);
    assign D_in[3] = Q_out[2];

    assign load_regs = Q_out[0] & start;
    assign rdy = Q_out[0];
    assign incr_r2 = Q_out[1];
    assign shift = Q_out[2];

    d_ff #(.RESET_VAL(1'b1)) dff_0 (
        .D (D_in[0]),
        .Q (Q_out[0]),
        .*
    );

    d_ff dff_1 (
        .D (D_in[1]),
        .Q (Q_out[1]),
        .*
    );

    d_ff dff_2 (
        .D (D_in[2]),
        .Q (Q_out[2]),
        .*
    );
    d_ff dff_3 (
        .D (D_in[3]),
        .Q (Q_out[3]),
        .*
    );
endmodule

module d_ff #(parameter RESET_VAL = 1'b0) (
    input rst_b, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) Q <= RESET_VAL;
        else Q <= D;
    end
endmodule
