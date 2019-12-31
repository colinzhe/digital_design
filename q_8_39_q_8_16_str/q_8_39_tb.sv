import q_8_39_pkg::*;

module q_8_39_tb;
    reg rst_b, clk, start;
    reg [data_width-1:0] A, B;
    wire rdy;
    wire [data_width*2-1:0] P;

    q_8_39 dut (.*);

    wire load_regs = dut.load_regs;
    wire add_decr = dut.add_decr;
    wire zero = dut.zero;
    //wire [1:0] state = dut.controller_0.dec_out;
    wire [1:0] state = dut.controller_0.Q_out;

    initial #24400 $finish; // tb duration

    initial
    begin : clk_and_init
        {rst_b, clk} = '0;
        start = 1'b0;
        {A, B} = '0;
        forever #5 clk = ~clk;
    end : clk_and_init

    initial
    begin : tb
        #10 rst_b = 1'b1; start = 1'b1;
        repeat (16)
        begin
            repeat (16) @ (posedge rdy) #10 B++;
            A++;
        end
        #10 A = 4'h8; B = 4'h3;
        #40 rst_b = 1'b0;
        #10 rst_b = 1'b1;
    end : tb

    logic [data_width*2-1:0] error = '0;
    wire [data_width*2-1:0] p_ref = A * B;

    always_ff @ (posedge rdy)
    begin
        error <= p_ref ^ P;
    end

    always_ff @ (posedge rdy)
    begin
        assert (error == 0)
        else $error ("Mismatch found");
    end
endmodule
