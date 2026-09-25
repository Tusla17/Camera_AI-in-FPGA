# Test co lap header. Chay tu hls\:
#   & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_hdr.tcl
open_project hdr_hls
set_top hdr_top
add_files test_hdr.cpp -cflags "-I."
open_solution sol1 -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10
csynth_design
exit
