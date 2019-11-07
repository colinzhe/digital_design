module four_bit_register (
    input rstn, clk, load,
    input [3:0] I,
    output reg [3:0] A
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
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
