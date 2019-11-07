module comparator_tb;
    reg [3:0] A, B;
    wire [5:0] Y;

    four_bit_comparator_beh dut (
        A,
        B,
        Y
    );

    initial
    begin
        {A, B} = 8'b0000_0000;
        repeat (256) #10 {A, B} = {A, B} + 1'b1;
        $finish;
    end

    initial
    $monitor ("A = %b, B = %b, Y = %b", A, B, Y);
endmodule
