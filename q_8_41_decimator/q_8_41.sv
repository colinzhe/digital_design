module q_8_41 (
    input rst, clk, en, load,
    input [7:0] data_in,
    output logic [15:0] R0
);
    logic clr_P1_P0, load_P1_P0, load_R0;

    q_8_41_controller controller_0 (.*);
    q_8_41_datapath datapath_0 (.*);
endmodule
