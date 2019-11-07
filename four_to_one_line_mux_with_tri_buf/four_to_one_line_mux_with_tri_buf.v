module four_to_one_line_mux_with_tri_buf (
    I,
    S,
    E,
    tri_buf_en,
    Y
);
    input [3:0] I;
    input [1:0] S;
    input E;
    output Y;
    output [3:0] tri_buf_en;

    wire [3:0] tri_buf_en;

    three_to_eight_line_decoder_with_en three_to_eight_line_decoder_with_en_0 (
        .x (1'b0),
        .y (S[1]),
        .z (S[0]),
        .E (E),
        .D (tri_buf_en)
    );

    tri_buf tri_buf_0 (
        .A (I[0]),
        .E (tri_buf_en[0]),
        .B (Y)
    );

    tri_buf tri_buf_1 (
        .A (I[1]),
        .E (tri_buf_en[1]),
        .B (Y)
    );

    tri_buf tri_buf_2 (
        .A (I[2]),
        .E (tri_buf_en[2]),
        .B (Y)
    );

    tri_buf tri_buf_3 (
        .A (I[3]),
        .E (tri_buf_en[3]),
        .B (Y)
    );
endmodule
