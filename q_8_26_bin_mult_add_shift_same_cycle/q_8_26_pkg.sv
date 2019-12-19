package q_8_26_pkg;
    parameter dp_width = 5;
    parameter st_width = 2;
    parameter bc_size = 3;
    typedef enum logic [st_width-1:0] {
        S_idle = 2'b01,
        S_add_shift = 2'b10
    } state_t;
endpackage
