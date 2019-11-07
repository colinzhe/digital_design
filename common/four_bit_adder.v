module four_bit_adder (
	A, // augend
	B, // addend
	S, // sum
	C  // carry out
);
	input [3:0] A, B;
	output [3:0] S;
	output C;
	
	wire C1, C2, C3;
	
	full_adder full_adder_0 (
		A[0],
		B[0],
		0,
		S[0],
		C1
	);
	
	full_adder full_adder_1 (
		A[1],
		B[1],
		C1,
		S[1],
		C2
	);
	
	full_adder full_adder_2 (
		A[2],
		B[2],
		C2,
		S[2],
		C3
	);
	
	full_adder full_adder_3 (
		A[3],
		B[3],
		C3,
		S[3],
		C
	);
endmodule