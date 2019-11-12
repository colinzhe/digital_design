module q_6_28b
#(
    parameter RESET_VALUE = 4'b0000
)
(
    input rstb, clk, cnt_en,
    output [3:0] count
);
    parameter S0 = 4'b0000, S1 = 4'b0010, S2 = 4'b0100, S3 = 4'b0110, S4 = 4'b1000;
    reg [3:0] state;

    assign count = state;

    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            state <= RESET_VALUE;
        end
        else
        begin
            if (cnt_en)
            begin
                case (state)
                    S0 : state <= S1;
                    S1 : state <= S2;
                    S2 : state <= S3;
                    S3 : state <= S4;
                    S4 : state <= S0;
                    default : state <= S0;
                endcase
            end
            else
            begin
                state <= state;
            end
        end
    end
endmodule
