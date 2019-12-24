module q_8_33 (
    input rst_b, clk,
    input [2:0] state,
    input R0, R1, R2, R3,
    output logic R4
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) R4 <= 1'b0;
        else
        begin
            case (state)
                2'b00 : R4 <= R0;
                2'b01 : R4 <= R1;
                2'b10 : R4 <= R2;
                2'b11 : R4 <= R3;
                default : R4 <= 1'b0;
            endcase
        end
    end
endmodule
