package q5_17_2s_comp_pkg;
    parameter st_width = 2;
    typedef enum logic [st_width-1:0] {S_idle, S_1, S_2, S_3} state_t;
endpackage

interface myIntf (input clk);
    logic rst_b, stream;
    logic twos_comp;
    
    modport DUT (output twos_comp, input clk, rst_b, stream);
endinterface