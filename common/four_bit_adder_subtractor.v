module four_bit_adder_subtractor (
	A,
	B,
	M,
	S,
	C,
	V
);
	input [3:0] A;
	input [3:0] B;
	input M;
	output [3:0] S;
	output C;
	output V;
	
	wire C1, C2, C3;
	
	wire [3:0] BxorM;
	
	assign BxorM = B ^ {4{M}};
	
	full_adder full_adder_0 (
		.x (A[0]),
		.y (BxorM[0]),
		.Cin (M),
		.S (S[0]),
		.Cout (C1)
	);
	
	full_adder full_adder_1 (
		.x (A[1]),
		.y (BxorM[1]),
		.Cin (C1),
		.S (S[1]),
		.Cout (C2)
	);
	
	full_adder full_adder_2 (
		.x (A[2]),
		.y (BxorM[2]),
		.Cin (C2),
		.S (S[2]),
		.Cout (C3)
	);
	
	full_adder full_adder_3 (
		.x (A[3]),
		.y (BxorM[3]),
		.Cin (C3),
		.S (S[3]),
		.Cout (C)
	);
	
	assign V = C3 ^ C;
endmodule