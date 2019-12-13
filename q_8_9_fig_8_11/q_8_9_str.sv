module q_8_9_str (
    input rst_b, clk, start,
    input A3, A2,
    output logic clr_A_F, incr_A, clr_E, set_E, set_F
);
    logic [2:0] D_in;
    logic [2:0] Q_out;
    logic start_b, A2_b, A3_b;
    logic D_in_0_and_0, D_in_1_and_0, D_in_1_and_1,
        D_in_1_and_2;

    and (clr_A_F, Q_out[0], start),
        (clr_E, Q_out[1], ~A2),
        (set_E, Q_out[1], A2);

    buf (set_F, Q_out[2]);
    buf (incr_A, Q_out[1]);
    
    not (start_b, start);
    not (A2_b, A2);
    not (A3_b, A3);

    and (D_in_0_and_0, Q_out[0], start_b);
    and (D_in_1_and_0, Q_out[0], start);
    and (D_in_1_and_1, A2_b, Q_out[1]);
    and (D_in_1_and_2, A2, Q_out[1], A3_b);

    or (D_in[0], D_in_0_and_0, Q_out[2]);
    or (D_in[1], D_in_1_and_0, D_in_1_and_1, D_in_1_and_2);

    and (D_in[2], Q_out[1], A3, A2);

    d_ff #(.RESET_VAL(1'b1)) G_0 (
        .D(D_in[0]),
        .Q(Q_out[0]),
        .*
    );

    d_ff #(.RESET_VAL(1'b0)) G_1 (
        .D(D_in[1]),
        .Q(Q_out[1]),
        .*
    );

    d_ff #(.RESET_VAL(1'b0)) G_2 (
        .D(D_in[2]),
        .Q(Q_out[2]),
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
