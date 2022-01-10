import mul_u64_pkg::*;

module mul_32(
  input [31:0] x, y,
  output [31:0] p
);
  assign p = x * y;
endmodule : mul_32

module add_32(
  input [31:0] x, y,
  output [31:0] s,
  output c
);
  assign {c, s} = x + y;
endmodule : add_32

module add_64(
  input [63:0] x, y,
  output [63:0] s,
  output c
);
  assign {c, s} = x + y;
endmodule : add_64

module mul_u64(
	input [63:0] x, y,
	output [63:0] p
);
    logic [31:0] pp_0, pp_1, pp_2;
    
    logic [31:0] mul_32_x, mul_32_y, mul_32_p;
    logic [31:0] add_32_x, add_32_y, add_32_s;
    logic [63:0] add_64_x, add_64_y, add_64_s;
    
    mult_pass_t mult_pass, next_mult_pass;
    
    always_ff @ (posedge clk or negedge rstb) begin
        if (!rstb) mult_pass <= s_mp_0;
        else mult_pass <= next_mult_pass;
    end
    
    always_comb begin
        next_mult_pass = s_mp_0;
        case (mult_pass) begin
            s_mp_0: begin
                next_mult_pass = s_mp_1;
                mul_32_x = x[31:0];
                mul_32_y = y[63:32];
            end
            s_mp_1: begin
                next_mult_pass = s_mp_2;
                mul_32_x = x[63:32];
                mul_32_y = y[31:0];
            end
            s_mp_2: begin
                next_mult_pass = s_mp_3;
                mul_32_x = x[31:0];
                mul_32_y = y[31:0];
            end
            s_mp_3: next_mult_pass = s_mp_4;
            s_mp_final: next_mult_pass = s_mp_0;
            default: next_mult_pass = s_mp_0;
        end
    end
    
	mul_32 umul_32(
        .x(mul_32_x),
        .y(mul_32_y),
        .p(mul_32_p)
    );
    
    
    
    always_ff begin
        case (mult_pass) begin
            s_mp_1: pp_0 <= mul_32_p;
            s_mp_2: pp_1 <= mul_32_p;
            s_mp_3: pp_2 <= mul_32_p;
            
    end
endmodule : mul_u64