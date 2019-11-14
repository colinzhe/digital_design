module four_bit_usr_tb;
    reg rstn, clk, SI;
    reg [1:0] mode;
    reg [3:0] par_in;
    wire [3:0] par_out;
    wire [3:0] shift_reg;
    wire SO;

    four_bit_usr_str dut (
        rstn, clk, mode, par_in, SI,
        par_out, shift_reg, SO
    );

    initial
    begin
        {rstn, clk} = 2'b00;
        mode = 2'b00;
        par_in = 4'b0000;
        SI = 1'b0;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        forever #10 mode = $random;
        forever #10 par_in = $random;
        forever #10 SI = $random;
        #500 rstn = 1'b0;
        #550 rstn = 1'b1;
        #1000 $finish;
    join
endmodule
