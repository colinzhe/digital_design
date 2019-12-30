module q_8_38_tb;
    reg [7:0] A, B;
    wire [7:0] sum;
    wire carry;

    q_8_38 dut (.*);

    initial #(256*256*10) $finish;

    initial
    begin : init
        A = '0;
        B = '0;
    end : init

    initial
    begin : tb
        repeat (256)
        begin
            repeat (256) #10 B++;
            A++;
        end
    end : tb

    logic ref_carry;
    logic [7:0] ref_sum;

    always_comb
    begin : ref_calc
        ref_carry = 0;
        if (A[7] == B[7])
        begin
            {ref_carry, ref_sum[6:0]} = A[6:0] + B[6:0];
            ref_sum[7] = A[7];
        end
        else
            if (A[6:0] > B[6:0])
                ref_sum = {A[7], A[6:0] - B[6:0]};
            else if (B[6:0] > A[6:0])
                ref_sum = {B[7], B[6:0] - A[6:0]};
            else
                ref_sum = '0;
    end : ref_calc

    wire error = ref_sum ^ sum;

    always_comb
    begin
        assert (error == 0)
        else $error ("Mismatch found");
    end
endmodule
