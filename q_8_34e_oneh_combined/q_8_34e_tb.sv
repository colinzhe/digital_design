import q_8_34a_pkg::*;

module q_8_34e_tb;
    reg rst_b, clk, start;
    reg [data_size-1:0] data_in;
    wire [r2_size-1:0] cnt;
    wire rdy;
    integer cnt_ref;
    integer error;

    q_8_34e dut (.*);

    wire [1:0] state = dut.controller.Q_out;
    wire load_regs = dut.controller.load_regs;
    wire incr_r2 = dut.controller.incr_r2;
    wire shift = dut.controller.shift;
    wire E = dut.controller.E;
    wire zero = dut.controller.zero;

    initial #1700 $finish; // tb duration

    initial
    begin : clk_and_rsts
        {rst_b, clk} = '0;
        start = 1'b0;
        data_in = '0;
        cnt_ref = 0;
        error = 0;
        forever #5 clk = ~clk;
    end : clk_and_rsts

    initial
    begin : start_machine
        #10 rst_b = 1;
        #30; // stay in S_idle
        start = 1'b1; // start counting
    end : start_machine

    initial
    begin : incr_and_compare
        #10 forever @ (posedge rdy)
        begin
            cnt_ref = $countones(data_in);
            error = cnt_ref ^ cnt;
            data_in++;
        end
    end : incr_and_compare

    always_ff @ (posedge rdy)
    begin : assrt
        if (rdy)
        begin
            assert (error == 0)
            else $error ("Mismatch found");
        end
    end : assrt
endmodule
