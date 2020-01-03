import q_8_42_pkg::*;

module q_8_42 (
    input rst_b, clk, start,
    input [data_size-1:0] data_in,
    output logic [r2_size-1:0] cnt,
    output logic rdy
);
    logic load_regs, shift_only, incr_and_shift, zero, msb;

    q_8_42_datapath datapath (.*);
    q_8_42_cntlr controller (.*);
endmodule
