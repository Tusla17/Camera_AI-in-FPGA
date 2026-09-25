open_project hdr_small_hls
set_top hdr_top
add_files test_hdr_small.cpp -cflags "-I."
open_solution sol1 -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10
csynth_design
exit
