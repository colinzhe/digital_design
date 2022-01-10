// Code your design here
module adder(
  input [3:0] a, b,
  input mode,
  output logic [3:0] s,
  output logic overflow
);
  logic [3:0] s_tmp;
  
  always_comb begin
    if (mode) begin // add
      s_tmp = a + b;

      if (s_tmp[3] == 1'b1 && a[3] == 1'b0 && b[3] == 1'b0) begin // pos overflow
        s = {1'b0, {3{1'b1}}};
        overflow = 1'b1;
      end
      else if (s_tmp[3] == 1'b0 && a[3] == 1'b1 && b[3] == 1'b1) begin // neg overflow
        s = {1'b1, {3{1'b0}}};
        overflow = 1'b1;
      end
      else begin
        s = s_tmp;
        overflow = 1'b0;
      end
    end
    else begin // subtract
      s_tmp = a + (~b + 1'b1);
      
      if (s_tmp[3] == b[3] && s_tmp[3] == 1'b1) begin
        s = {1'b1, {3{1'b1}}};
        overflow = 1'b1;
      end
      else if (s_tmp[3] == b[3] && s_tmp[3] == 1'b0) begin
        s = {1'b0, {3{1'b0}}};
        overflow = 1'b0;
      end
      else begin
        s = s_tmp;
        overflow = 1'b0;
      end
    end
  end
endmodule