package q_8_16_pkg;
    parameter st_width = 1;
    typedef enum logic [st_width-1:0] {
        S_idle,
        S_1
    } state_t;
    parameter data_width = 4;
    parameter cntr_width = 3;
    parameter cntr_default = data_width;
endpackage
