package q_8_40_pkg;
    typedef enum logic [2:0] {
        S_idle,
        S_wait_init,
        S_wait_load,
        S_run,
        S_output
    } state_t;
endpackage
