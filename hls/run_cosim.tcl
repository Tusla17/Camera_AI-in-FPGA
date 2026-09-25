# Cosim: csynth roi C/RTL co-simulation (can testbench + .mem). Chay tu hls\:
#   & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_cosim.tcl
open_project bnn_hls
set_top bnn_top
add_files bnn.cpp -cflags "-I."
add_files -tb bnn_tb.cpp -cflags "-I."
open_solution sol1 -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10
csynth_design
cosim_design
exit
