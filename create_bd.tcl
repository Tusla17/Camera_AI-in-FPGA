# create_bd.tcl - block design PS + bnn_axi_lite cho ZCU106 (Vivado 2025.2)
# Chay tu thu muc chua dự án:  vivado -mode batch -source create_bd.tcl
set PART xczu7ev-ffvc1156-2-e
create_project bnn_bd ./bnn_bd -part $PART -force
catch { set_property board_part [lindex [get_board_parts *zcu106*] end] [current_project] }

# Lay thu muc chua file script nay de add file cho chinh xac
set script_dir [file dirname [info script]]
add_files -norecurse [glob $script_dir/rtl/*.v]
add_files -norecurse [glob $script_dir/mem/*.mem]
set_property file_type {Memory Initialization Files} [get_files *.mem]
update_compile_order -fileset sources_1

create_bd_design "bd"
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:* zynq_ps
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config { apply_board_preset 1 } [get_bd_cells zynq_ps]
set_property -dict [list CONFIG.PSU__USE__M_AXI_GP0 1 CONFIG.PSU__USE__M_AXI_GP1 0 CONFIG.PSU__USE__M_AXI_GP2 0 CONFIG.PSU__FPGA_PL0_ENABLE 1] [get_bd_cells zynq_ps]

create_bd_cell -type module -reference bnn_axi_lite bnn_0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Master {/zynq_ps/M_AXI_HPM0_FPD} Clk {Auto} } [get_bd_intf_pins bnn_0/S_AXI]

assign_bd_address
validate_bd_design
save_bd_design

make_wrapper -files [get_files bd.bd] -top
# duong dan wrapper: Vivado moi dung .gen, ban cu dung .srcs
add_files -norecurse [glob ./bnn_bd/bnn_bd.gen/sources_1/bd/bd/hdl/bd_wrapper.v]
set_property top bd_wrapper [current_fileset]
launch_runs impl_1 -to_step write_bitstream -jobs 1
wait_on_run impl_1
write_hw_platform -fixed -include_bit -force ./bnn_zcu106.xsa
puts "XONG: bnn_zcu106.xsa da tao."
