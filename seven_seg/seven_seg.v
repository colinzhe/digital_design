module seven_seg (x3, x2, x1, x0, h0d0, h0d1, h0d2, h0d3, h0d4, h0d5, h0d6);
	input x3, x2, x1, x0;
	output h0d0, h0d1, h0d2, h0d3, h0d4, h0d5, h0d6;
	
	assign h0d0 = (~x3 & x2 & ~x1 & ~x0) | (~x3 & ~x2 & ~x1 & x0)
		| (x3 & x2 & ~x1 & x0) | (x3 & ~x2 & x1 & x0);
		
	assign h0d1 = (~x3 & x2 & ~x1 & x0) | (x2 & x1 & ~x0)
		| (x3 & x2 & ~x0) | (x3 & x2 & x1) | (x3 & x1 & x0);
		
	assign h0d2 = (~x3 & ~x2 & x1 & ~x0) | (x3 & x2 & ~x1 & ~x0)
		| (x3 & x2 & x1);
		
	assign h0d3 = (~x3 & ~x2 & ~x1 & x0) | (~x3 & x2 & ~x1 & ~x0)
		| (x2 & x1 & x0) | (x3 & ~x2 & x1 & ~x0);
		
	assign h0d4 = (~x2 & ~x1 & x0) | (~x3 & x0) | (~x3 & x2 & ~x1);
	
	assign h0d5 = (~x3 & ~x2 & x0) | (~x3 & ~x2 & x1) | (~x3 & x1 & x0)
		| (x3 & x2 & ~x1 & x0);
		
	assign h0d6 = (~x3 & ~x2 & ~x1) | (~x3 & x2 & x1 & x0)
		| (x3 & x2 & ~x1 & ~x0);
endmodule