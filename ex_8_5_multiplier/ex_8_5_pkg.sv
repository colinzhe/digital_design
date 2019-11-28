package ex_8_5_pkg;
    parameter st_width = 3;
    typedef enum logic [st_width-1:0] {
        S_idle = 3'b001,
        S_add = 3'b010,
        S_shift = 3'b100
    } state_t;
    parameter dp_width = 5;
    parameter bc_size = 3;
endpackage
