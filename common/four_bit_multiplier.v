module four_bit_multiplier (
    A,
    B,
    C
);
    input [3:0] B;
    input [2:0] A;
    output [6:0] C;

    wire [3:0] M[0:2];

    assign M[0] = {4{A[0]}} & B;

    assign C[0] = M[0][0];

    assign M[1] = {4{A[1]}} & B;

    assign M[2] = {4{A[2]}} & B;

    wire [3:0] Sint;
    wire Cint;

    cl_four_bit_adder cl_four_bit_adder_0 (
        .A ({1'b0, M[0][3:1]}),
        .B (M[1]),
        .Cin (0),
        .Cout (Cint),
        .S (Sint)
    );
    
    assign C[1] = Sint[0];

    cl_four_bit_adder cl_four_bit_adder_1 (
        .A ({Cint, Sint[3:1]}),
        .B (M[2]),
        .Cin (0),
        .Cout (C[6]),
        .S (C[5:2])
    );
endmodule
