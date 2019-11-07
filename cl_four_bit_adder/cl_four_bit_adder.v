module cl_four_bit_adder (
	A,
	B,
	S,
	Cout
);
	input [3:0] A, B;
	output [3:0] S;
	output Cout;
	
	wire [3:0] P, G;
	wire [3:1] C;
	
	half_adder half_adder_0 (
		A[0],
		B[0],
		P[0],
		G[0]
	);
	
	half_adder half_adder_1 (
		A[1],
		B[1],
		P[1],
		G[1]
	);
	
	half_adder half_adder_2 (
		A[2],
		B[2],
		P[2],
		G[2]
	);
	
	half_adder half_adder_3 (
		A[3],
		B[3],
		P[3],
		G[3]
	);
	
	// carry lookahead circuit
	assign C[1] = G[0];
	assign C[2] = G[1] || (P[1] && G[0]);
	assign C[3] = G[2] || (P[2] && G[1]) || (P[2] && P[1] && G[0]);
	assign Cout = G[3] || (P[3] && C[3]);
	
	assign S[0] = P[0];
	assign S[1] = P[1] ^ C[1];
	assign S[2] = P[2] ^ C[2];
	assign S[3] = P[3] ^ C[3];
endmodule