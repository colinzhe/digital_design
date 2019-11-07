module full_adder (x, y, Cin, S, Cout);
	input x, y, Cin;
	output S, Cout;
	
	wire Cp1, Sp1, Cp2;
	
	xor (Sp1, x, y);
	and (Cp1, x, y);
	xor (S, Sp1, Cin);
	and (Cp2, Sp1, Cin);
	or (Cout, Cp1, Cp2);
endmodule