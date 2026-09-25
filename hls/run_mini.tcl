# Test toolchain toi thieu (khong lien quan BNN).
#   & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_mini.tcl
open_project mini_hls
set_top mini_top
add_files mini.cpp
open_solution sol1 -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10
csynth_design
exit
