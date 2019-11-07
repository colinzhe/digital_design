module q_6_7_beh (
    input clk,
    input [1:0] sel,
    input [3:0] I,
    output reg [3:0] A
);
    always @ (posedge clk)
    begin
        case (sel)
            2'b00 : A <= A;
            2'b01 : A <= 4'b0000;
            2'b10 : A <= ~A;
            2'b11 : A <= I;
        endcase
    end
endmodule
