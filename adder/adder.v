module adder (X, Y, Z, clk);
	parameter n = 3;
	input [n-1:0] X, Y;
	input clk;
	output [n-1:0] Z;
	reg [n-1:0] Xreg, Yreg, Sreg;
	reg [n-1:0] S /* synthesis keep */;
	
	assign Z = Sreg;
	always @(X, Y)
		S = Xreg + Yreg;
	
	always @(posedge clk)
	begin
		Sreg <= S;
		Xreg <= X;
		Yreg <= Y;
	end
endmodule