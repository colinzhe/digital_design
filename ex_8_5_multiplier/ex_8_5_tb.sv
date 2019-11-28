import ex_8_5_pkg::*;

module ex_8_5_tb;
    reg rstb, clk, start;
    wire [st_width-1:0] state, next_state;
    wire load_regs, decr_p, add_regs, shift_regs;
    wire [bc_size-1:0] P;
    wire zero;
    wire [dp_width-1:0] B, A, Q;
    wire C, rdy;
    wire [2*dp_width-1:0] product;
    reg [dp_width-1:0] multiplicand, multiplier;

    ex_8_5 dut (
        rstb, clk, start,
        state, next_state,
        load_regs, decr_p, add_regs, shift_regs,
        P, zero,
        B, A, C, Q,
        multiplicand, multiplier, product,
        rdy
    );

    initial #200 $finish;

    initial
    begin
        {rstb, clk, start} = 3'b000;
        #2 start = 1; rstb = 1;
        multiplicand = 5'b10111; multiplier = 5'b10011;
        #10 start = 0;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    always_ff @ (posedge clk)
    begin
        $strobe ("C = %b, A = %b, Q = %b, P = %b, time = %d",
            dut.C, dut.A, dut.Q, dut.P, $time);
    end
endmodule
