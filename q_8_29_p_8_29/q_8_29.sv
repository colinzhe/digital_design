module q_8_29 (
    input rst_b, clk,
    input x, y, F, E,
    output logic [2:0] state,
    output logic [7:0] dec_out
);
    logic [2:0] D_in;

    mymux mux_0 (
        .sel (state),
        .data_in ({1'b0, 1'b1, 1'b0, E, 1'b0, F, 1'b0, x}),
        .data_out (D_in[0])
    );

    mymux mux_1 (
        .sel (state),
        .data_in ({1'b0, 1'b1, 1'b0, ~E, 1'b0, F, 1'b1, ~x & y}),
        .data_out (D_in[1])
    );

    mymux mux_2 (
        .sel (state),
        .data_in ({1'b0, 1'b1, 1'b0, 1'b1, 1'b0, ~F, 1'b0, 1'b0}),
        .data_out (D_in[2])
    );

    d_ff dff_0 (
        .D (D_in[0]),
        .Q (state[0]),
        .*
    );

    d_ff dff_1 (
        .D (D_in[1]),
        .Q (state[1]),
        .*
    );

    d_ff dff_2 (
        .D (D_in[2]),
        .Q (state[2]),
        .*
    );

    decoder dec_0 (
        .dec_in (state),
        .*
    );
endmodule

module mymux (
    input [2:0] sel,
    input [7:0] data_in,
    output logic data_out
);
    always_comb
    begin
        case (sel)
            3'b000 : data_out = data_in[0];
            3'b001 : data_out = data_in[1];
            3'b010 : data_out = data_in[2];
            3'b011 : data_out = data_in[3];
            3'b100 : data_out = data_in[4];
            3'b101 : data_out = data_in[5];
            3'b110 : data_out = data_in[6];
            3'b111 : data_out = data_in[7];
            default : data_out = 1'bZ;
        endcase
    end
endmodule

module decoder (
    input [3:0] dec_in,
    output logic [7:0] dec_out
);
    always_comb
    begin
        dec_out = 8'h00;
        case (dec_in)
            3'b000 : dec_out[7] = 1'b1;
            3'b001 : dec_out[6] = 1'b1;
            3'b010 : dec_out[5] = 1'b1;
            3'b011 : dec_out[4] = 1'b1;
            3'b100 : dec_out[3] = 1'b1;
            3'b101 : dec_out[2] = 1'b1;
            3'b110 : dec_out[1] = 1'b1;
            3'b111 : dec_out[0] = 1'b1;
            default : dec_out = 8'h00;
        endcase
    end
endmodule

module d_ff (
    input rst_b, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) Q <= 1'b0;
        else Q <= D;
    end
endmodule
