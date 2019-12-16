import q_8_22_pkg::*;

module q_8_22_tb;
    reg rst_b, clk, start;
    wire [st_width-1:0] state = dut.state;
    wire [st_width-1:0] next_state = dut.next_state;
    wire load_regs = dut.load_regs;
    wire decr_p = dut.decr_p;
    wire add_regs = dut.add_regs;
    wire shift_regs = dut.shift_regs;
    wire [bc_size-1:0] P = dut.P;
    wire zero = dut.zero;
    wire [dp_width-1:0] B = dut.B;
    wire [dp_width-1:0] A = dut.A;
    wire [dp_width-1:0] Q = dut.Q;
    wire C = dut.C;
    wire rdy;
    wire [2*dp_width-1:0] product;
    reg [dp_width-1:0] multiplicand, multiplier;

    q_8_22 dut (.*);

    initial #103000 $finish;

    wire [2*dp_width-1:0] expected_val = multiplicand * multiplier;
    logic [2*dp_width-1:0] error;

    always_ff @ (posedge rdy)
    begin
        error <= expected_val ^ product;
    end

    always_ff @ (negedge rdy)
    begin
        error <= 1'b0;
    end
    
    always_ff @ (posedge clk)
    begin
        if (rdy)
        begin
            CHECK_WHEN_RDY : assert (error == 0)
            else
            begin
                $error ("Error found");
            end
        end
    end

    initial
    begin
        {rst_b, clk, start} = 3'b000;
        #10 start = 1; rst_b = 1;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        multiplicand = 0; multiplier = 0;
        repeat (32) #10
        begin
            repeat (32) @ (posedge rdy) #5 multiplicand++;
            multiplier++;
        end
    end
endmodule
