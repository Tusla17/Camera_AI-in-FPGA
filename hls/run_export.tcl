# Export IP: csynth roi export_design (cho nhanh 2 - boc AXI). Chay tu hls\:
#   & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_export.tcl
open_project bnn_hls
set_top bnn_top
add_files bnn.cpp -cflags "-I."
open_solution sol1 -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10
csynth_design
export_design -format ip_catalog
exit
