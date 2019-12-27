import q_8_34a_pkg::*;

module q_8_34e (
    input rst_b, clk, start,
    input [data_size-1:0] data_in,
    output logic [r2_size-1:0] cnt,
    output logic rdy
);
    logic load_regs, shift, incr_r2, zero, E;

    q_8_34a datapath (.*);
    q_8_34d controller (.*);
endmodule
