package q_8_25_pkg;
    parameter dp_width = 5;
    parameter st_width = 4;
    parameter bc_size = 3;
    typedef enum logic [st_width-1:0] {
        S_idle = 4'b0001,
        S_check = 4'b0010,
        S_add = 4'b0100,
        S_shift = 4'b1000
    } state_t;
endpackage
