module q_8_37c_oneh_cntlr (
    input rst_b, clk, start, zero,
    output logic load_regs, add_shift, rdy
);
    logic [1:0] D_in;
    logic [1:0] Q_out;

    assign D_in[0] = (~start & Q_out[0]) || (zero & Q_out[1]);
    assign D_in[1] = (start & Q_out[0]) || (~zero & Q_out[1]);

    d_ff #(.RESET_VAL(1'b1)) dff_0 (
        .D (D_in[0]),
        .Q (Q_out[0]),
        .*
    );

    d_ff #(.RESET_VAL(1'b0)) dff_1 (
        .D (D_in[1]),
        .Q (Q_out[1]),
        .*
    );

    assign load_regs = Q_out[0] & start;
    assign add_shift = Q_out[1] & ~zero;
    assign rdy = Q_out[0];
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
