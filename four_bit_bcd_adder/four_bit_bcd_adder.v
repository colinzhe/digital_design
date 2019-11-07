module four_bit_bcd_adder (
    A,
    B,
    Cin,
    //Zout,
    //Sout,
    Cout,
    HexD
);
    input [3:0] A, B;
    input Cin;
    //output [3:0] Zout, Sout;
    output [6:0] HexD;
    output Cout;
    
    wire K;
    wire [3:0] Z;
    wire [3:0] S;
    
    cl_four_bit_adder cl_four_bit_adder_0 (
        .A (A),
        .B (B),
        .Cin (Cin),
        .Cout (K),
        .S (Z)
    );
    
    //assign Zout = Z;

    assign Cout = K || (Z[3] && Z[2]) || (Z[3] && Z[1]);
    
    cl_four_bit_adder cl_four_bit_adder_1 (
        .A (Z),
        .B ({1'b0, Cout, Cout, 1'b0}),
        .Cin (0),
        .Cout (),
        .S (S)
    );

    //assign Sout = S;

    seven_seg seven_seg_0 (
        .x (S),
        .hexd (HexD)
    );
endmodule
