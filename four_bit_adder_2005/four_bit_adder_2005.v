module four_bit_adder_2005 (
    input [3:0]     A, B,
    input           Cin,
    output [3:0]    S,
    output          Cout
);
    assign {Cout, S} = A + B + Cin;
endmodule
