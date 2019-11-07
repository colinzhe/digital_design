module q_6_6_beh (
    input rstn, clk, load, shift,
    input [3:0] I,
    input SI,
    output SO,
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
            if (shift)
            begin
                A <= {A[2:0], SI};
            end
            else if (load)
            begin
                A <= I;
            end
            else
            begin
                A <= A;
            end
        end
    end

    assign SO = A[3];
endmodule
