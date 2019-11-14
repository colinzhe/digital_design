module ex_7_1_tb;
    reg enable, rd_wr;
    reg [3:0] data_in;
    reg [5:0] addr;
    wire [3:0] data_out;
    wire [3:0] mem_000000;
    wire [3:0] mem_000111;
    wire [3:0] mem_110000;

    ex_7_1 dut (
        enable, rd_wr, data_in, addr,
        data_out, mem_000000, mem_000111, mem_110000
    );

    initial
    begin
        {enable, rd_wr} = 2'b00;
        data_in = 4'b0000;
        addr = 6'b0000;
    end

    initial
    begin
        #10 addr = 6'b000111;
        #10 data_in = 4'b1011;
        #10 enable = 1'b1;
        #10 data_in = 4'b0001;
        #10 enable = 1'b0;
        #10 addr = 6'b110000;
        #10 data_in = 4'b1111;
        #10 enable = 1'b1;
        #10 enable = 1'b0;
        #10 addr = 6'b000000;
        #10 rd_wr = 1'b1;
        #10 enable = 1'b1;
        #10 addr = 6'b000111;
        #10 addr = 6'b110000;
        #50 $finish;
    end
endmodule
