module fig_7_7_tb;
    reg mem_en, rd_wr;
    reg [1:0] addr;
    reg [3:0] wr_data;
    wire [3:0] rd_data;

    fig_7_7 dut (
        mem_en, rd_wr, addr, wr_data,
        rd_data
    );

    initial
    begin
        {mem_en, rd_wr} = 2'b00;
        addr = 2'b00;
        wr_data = 4'b0000;
    end

    initial
    begin
        #10 wr_data = 4'b0001; // prepare write data for addr 2'b00
        mem_en = 1'b1; // enable dec
        #20 rd_wr = 1'b1; // read latched data
        #20 mem_en = 1'b0; // disable mem
        #20 rd_wr = 1'b0; // revert to write mode
        wr_data = 4'b0110; // prepare write data
        addr = 2'b01; // update to new addr
        mem_en = 1'b1; // enable dec
        #20 rd_wr = 1'b1; // read latched data
        #20 addr = 2'b00; // check data at 2'b00 again
        #20 mem_en = 1'b0; // disable mem
        #20 rd_wr = 1'b0; // revert to write mode
        wr_data = 4'b1110; // prepare write data
        addr = 2'b10; // update to new addr
        mem_en = 1'b1; // enable dec
        #20 rd_wr = 1'b1; // read latched data
        #20 mem_en = 1'b0; // disable mem
        #20 rd_wr = 1'b0; // revert to write mode
        wr_data = 4'b1111; // prepare write data
        addr = 2'b11; // update to new addr
        mem_en = 1'b1; // enable dec
        #20 rd_wr = 1'b1; // read latched data
        #20 addr = 2'b00;
        repeat (3) #20 addr = addr + 1;
        #20 $finish;
    end
endmodule
