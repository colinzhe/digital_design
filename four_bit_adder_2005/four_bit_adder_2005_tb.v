module adder_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    four_bit_adder_2005 dut (
        A,
        B,
        Cin,
        S,
        Cout
    );

    initial
        begin
            {A, B} = 8'b00000000;
            Cin = 1'b0;
            repeat (255) #10 {A, B} = {A, B} + 1'b1;
            Cin = 1'b1;
            repeat (255) #10 {A, B} = {A, B} + 1'b1;
            $finish;
        end

    initial $monitor ("A = %b, B = %b, Cin = %b, S = %b, Cout = %b",
        A, B, Cin, S, Cout);
endmodule
