module q_6_2 (
    input rst, clk, load,
    input [3:0] I,
    output reg [3:0] A
);
    always @ (posedge clk)
    begin
        if (rst)
        begin
            A <= 4'b0000;
        end
        else
        begin
            if (load)
            begin
                A <= I;
            end
            else
            begin
                A <= A;
            end
        end
    end
endmodule
