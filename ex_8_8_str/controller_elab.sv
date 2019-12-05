import ex_8_8_pkg::*;

module controller_elab (
    input rstb, clk, start, zero, msb,
    output rdy, load_regs, shift_left, incr_r2
);
    controller cntlr_0 (
        .rstb(rstb),
        .clk(clk),
        .start(start),
        .zero(zero),
        .msb(msb),
        .rdy(rdy),
        .load_regs(load_regs),
        .shift_left(shift_left),
        .incr_r2(incr_r2)
    );
endmodule
