module ex_7_1 (
    input enable, rd_wr,
    input [3:0] data_in,
    input [5:0] addr,
    output reg [3:0] data_out,
    output [3:0] mem_000000,
    output [3:0] mem_000111,
    output [3:0] mem_110000
);
    reg [3:0] mem [0:63];

    assign mem_000000 = mem[0];
    assign mem_000111 = mem[7];
    assign mem_110000 = mem[48];

    always @ (enable, rd_wr, mem, data_in, addr)
    begin
        if (enable)
            if (rd_wr) data_out = mem[addr];
            else mem[addr] = data_in;
        else
            data_out = 4'bZ;
    end
endmodule
