module half_adder (x, y, S, C);
	input x, y;
	output S, C;
	
	xor (S, x, y);
	and (C, x, y);
endmodule
