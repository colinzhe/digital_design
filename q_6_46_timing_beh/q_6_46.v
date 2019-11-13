module q_6_46 (
    input rstb, clk,
    output [5:0] count
);
    parameter S0 = 6'b100000, S1 = 6'b010000,
        S2 = 6'b001000, S3 = 6'b000100,
        S4 = 6'b000010, S5 = 6'b000001;

    reg [5:0] state;

    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb) state <= 6'b100000;
        else
            case (state)
                S0 : state <= S1;
                S1 : state <= S2;
                S2 : state <= S3;
                S3 : state <= S4;
                S4 : state <= S5;
                S5 : state <= S0;
                default : state <= S0;
            endcase
    end

    assign count = state;
endmodule
