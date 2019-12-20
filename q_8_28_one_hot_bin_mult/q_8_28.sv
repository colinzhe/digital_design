import q_8_28_pkg::*;

module q_8_28 (
    input rst_b, clk, start,
    input [dp_width-1:0] multiplicand, multiplier,
    output logic [dp_width*2-1:0] product,
    output logic rdy
);
    logic load_regs, decr_p, add_regs, shift_regs, zero, Q0;

    controller controller_0 (.*);
    datapath datapath_0 (.*);
endmodule

module controller (
    input rst_b, clk, start,
    input Q0, zero,
    output logic rdy, load_regs, add_regs, decr_p, shift_regs
);
    logic [st_width-1:0] D_in, G_out;

    assign D_in[0] = (G_out[0] & ~start) || (zero & G_out[2]);
    assign D_in[1] = (start & G_out[0]) || (~zero & G_out[2]);
    assign D_in[2] = G_out[1];

    d_ff #(.RESET_VALUE(1'b1)) dff_0 (
        .D(D_in[0]),
        .Q(G_out[0]),
        .*
    );

    d_ff dff_1 (
        .D(D_in[1]),
        .Q(G_out[1]),
        .*
    );

    d_ff dff_2 (
        .D(D_in[2]),
        .Q(G_out[2]),
        .*
    );

    assign load_regs = G_out[0] & start;
    assign rdy = G_out[0];
    assign add_regs = Q0 & G_out[1];
    assign decr_p = G_out[1];
    assign shift_regs = G_out[2];
endmodule

module d_ff #(parameter RESET_VALUE = 1'b0) (
    input rst_b, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) Q <= RESET_VALUE;
        else Q <= D;
    end
endmodule

module datapath (
    input rst_b, clk,
    input load_regs, add_regs, shift_regs, decr_p,
    input [dp_width-1:0] multiplicand, multiplier,
    output logic Q0, zero,
    output logic [dp_width*2-1:0] product
);
    logic [dp_width-1:0] A, B, Q;
    logic [bc_size-1:0] P;
    logic C;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            P <= dp_width[2:0];
            A <= {dp_width{1'b0}};
            B <= {dp_width{1'b0}};
            Q <= {dp_width{1'b0}};
            C <= 1'b0;
        end
        else
        begin
            if (load_regs)
            begin
                P <= dp_width[2:0];
                A <= {dp_width{1'b0}};
                B <= multiplicand;
                Q <= multiplier;
                C <= 1'b0;
            end
            else if (add_regs) {C, A} <= A + B;
            else if (shift_regs) {C, A, Q} <= {C, A, Q} >> 1;
            if (decr_p) P <= P - 1'b1;
        end
    end

    assign product = {A, Q};
    assign zero = (P == {bc_size{1'b0}});
    assign Q0 = Q[0];
endmodule
