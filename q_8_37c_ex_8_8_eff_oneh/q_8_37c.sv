import q_8_37c_pkg::*;

module q_8_37c (
    input rst_b, clk, start,
    input [data_size-1:0] data_in,
    output logic [r2_size-1:0] cnt,
    output logic rdy
);
    logic load_regs, add_shift, zero;

    q_8_37c_oneh_cntlr controller_0 (.*);
    datapath datapath_0 (.*);
endmodule

module datapath (
    input rst_b, clk,
    input load_regs, add_shift,
    input [data_size-1:0] data_in,
    output [r2_size-1:0] cnt,
    output zero
);
    logic [r2_size-1:0] r2;
    logic [data_size-1:0] r1;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            r1 <= '0;
            r2 <= '0;
        end
        else
        begin
            if (load_regs)
            begin
                r1 <= data_in;
                r2 <= '0;
            end
            else if (add_shift)
            begin
                r2 <= r2 + r1[0];
                r1 = r1 >> 1;
            end
        end
    end

    assign zero = (r1 == '0);
    assign cnt = r2;
endmodule
