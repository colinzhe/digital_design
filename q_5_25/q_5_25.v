module q_5_25 (
    input rstn, clk,
    input [1:0] sel,
    input [3:0] D,
    output reg Q
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
            Q <= 1'b0;
        else
            Q <= sel[1] ? (sel[0] ? D[3] : D[2]) : (sel[0] ? D[1] : D[0]);
            //case (sel)
            //    2'b00 : Q <= D[0];
            //    2'b01 : Q <= D[1];
            //    2'b10 : Q <= D[2];
            //    2'b11 : Q <= D[3];
            //endcase
    end
endmodule
