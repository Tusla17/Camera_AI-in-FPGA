# Inferred from performance & pipeline pragmas/directives
set_directive_loop_flatten bnn_top/VITIS_LOOP_50_2
set_directive_array_partition bnn_top/bnn_top(int const*, unsigned int const*, int const*, unsigned int const*, int const*, unsigned int const*, int const*, unsigned int const*, int const*, int const*, int const*, int&, int&, int&)::ps -dim=1 -type=cyclic -factor=5 bnn_top(int const*, unsigned int const*, int const*, unsigned int const*, int const*, unsigned int const*, int const*, unsigned int const*, int const*, int const*, int const*, int&, int&, int&)::ps
set_directive_loop_flatten bnn_top/VITIS_LOOP_65_6
set_directive_loop_flatten bnn_top/VITIS_LOOP_80_10
set_directive_loop_flatten bnn_top/VITIS_LOOP_79_9
set_directive_loop_flatten bnn_top/VITIS_LOOP_96_14
set_directive_loop_flatten bnn_top/VITIS_LOOP_111_18
set_directive_loop_flatten bnn_top/VITIS_LOOP_110_17
set_directive_loop_flatten bnn_top/VITIS_LOOP_127_22
set_directive_loop_flatten bnn_top/VITIS_LOOP_140_24
