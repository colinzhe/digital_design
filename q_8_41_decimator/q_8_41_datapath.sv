module q_8_41_datapath (
    input clk,
    input clr_P1_P0, load_P1_P0, load_R0,
    input [7:0] data_in,
    output logic [15:0] R0
);
    logic [7:0] P1, P0;

    always_ff @ (posedge clk)
    begin
        if (clr_P1_P0)
            {P1, P0} <= '0;
        if (load_P1_P0)
        begin
            P1 <= data_in;
            P0 <= P1;
        end
        if (load_R0)
            R0 <= {P1, P0};
    end
endmodule
