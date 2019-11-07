module blink (
	input wire clk, // 50MHz input clock
	output wire LED // LED output
);

	// create binary counter
	reg [31:0] cnt; // 32b
	
	initial begin
		cnt <= 32'h00000000; // init to zero
	end
	
	always @(posedge clk) begin
		cnt <= cnt + 1; // add one per clock
	end
	
	assign LED = cnt[25]; // blink on order of Hz
endmodule