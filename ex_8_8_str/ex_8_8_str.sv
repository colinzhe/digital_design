import ex_8_8_pkg::*;

module ex_8_8_str (
    input rstb, clk, start,
    input [r1_size-1:0] data,
    output logic [r2_size-1:0] count,
    output logic rdy
);
    logic load_regs, shift_left, incr_r2, zero, msb;

    controller controller_0 (.*);
    data_path data_path_0 (.*);
endmodule

module controller (
    input rstb, clk, start, zero, msb,
    output logic rdy, load_regs, shift_left, incr_r2
);
    logic G0, G0_b, D0_in, D1_in, G1, G1_b;
    logic zero_b = ~zero, msb_b = ~msb;
    logic [1:0] sel = {G1, G0};
    logic [0:3] dec_out;
    
    assign rdy = ~dec_out[0];
    assign incr_r2 = ~dec_out[1];
    assign shift_left = ~dec_out[2];
    assign load_regs = rdy & start;

    mux_4x1_beh mux_1 (sel, GND, zero_b, PWR, msb_b, D1_in);
    mux_4x1_beh mux_0 (sel, start, GND, PWR, msb, D0_in);
    d_ff dff_1 (rstb, clk, D1_in, G1, G1_b);
    d_ff dff_0 (rstb, clk, D0_in, G0, G0_b);
    dec_2x4 dec_0 (G1, G0, GND, dec_out);
endmodule

module data_path (
    input clk, load_regs, shift_left, incr_r2,
    input [r1_size-1:0] data,
    output logic [r2_size-1:0] count,
    output logic zero, msb
);
    logic [r1_size-1:0] r1;
    assign zero = (r1 == 0);
    assign w1 = r1[R1_size-1] & shift_left;

    shift_reg shift_reg_0 (PWR, clk, data, GND, shift_left, load_regs);
    counter counter_0 (PWR, clk, count, load_regs, incr_r2);
    d_ff dff_2 (PWR, clk, msb, w1);
endmodule
