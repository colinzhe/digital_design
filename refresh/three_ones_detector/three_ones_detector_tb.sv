import three_ones_detector_pkg::*;

class packet;
    rand bit b;
endclass

module three_ones_detector_tb;
    reg rst_b, clk, stream;
    wire bingo;
    
    three_ones_detector dut (
        rst_b, clk, stream,
        bingo
    );
    
    wire [st_width-1:0] state = dut.state;
    
    initial #1000 $finish;
    
    initial
    begin
        {rst_b, clk, stream} = 3'b000;
        forever #5 clk = ~clk;
    end
    
    initial
    begin
        #10 packet pkt;
        pkt = new();
        repeat(10)
        begin
            #100 pkt.randomize();
            // stream = pkt.b;
        end
    end
    
    initial
    begin
        #10 rst_b = 1'b1; stream = 1'b0;
        // #10 stream = 1'b0;
        // #10 stream = 1'b1;
        // #10 stream = 1'b0;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b0;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b0;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
    end
endmodule