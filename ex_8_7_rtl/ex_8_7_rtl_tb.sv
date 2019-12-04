module ex_8_7_rtl_tb;
    parameter dp_width = 5;
    reg [dp_width-1:0] multiplicand, multiplier;
    wire [2*dp_width-1:0] product;
    logic [2*dp_width-1:0] expected_val;
    logic error;

    ex_8_7_rtl #(.dp_width(dp_width)) dut (
        multiplicand, multiplier,
        product
    );

    initial #10500 $finish;

    always_comb
    begin
        expected_val = multiplicand * multiplier;
        error = expected_val ^ product;
    end

    initial
    begin
        {multiplicand, multiplier} = 0;
        repeat (32)
        begin
            repeat (32) #10 multiplier++;
            multiplicand++;
        end
    end
endmodule
