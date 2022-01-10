interface myIntf (input clk);
    logic rst_b, lsb_in, msb_in,
    logic [1:0] sel,
    logic [3:0] i_par,
    logic [3:0] a_par
    
    modport DUT (
        input clk, rst_b, lsb_in, msb_in, sel, i_par,
        output a_par);
endinterface