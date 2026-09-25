#==============================================================================
# create_camera_bd.tcl
# Builds full Camera AI System with Leopard Imaging LI-IMX274 on ZCU106 (Vivado 2025.2)
# Usage: vivado -mode batch -source create_camera_bd.tcl
#==============================================================================
set_param general.maxThreads 1
set_param synth.maxThreads 1

set PART xczu7ev-ffvc1156-2-e
create_project bnn_camera_bd ./bnn_camera_bd -part $PART -force
catch { set_property board_part [lindex [get_board_parts *zcu106*] end] [current_project] }

set script_dir [file dirname [info script]]

# Add RTL sources, memory initialization files, and constraints
add_files -norecurse [glob $script_dir/rtl/*.v]
add_files -norecurse [glob $script_dir/mem/*.mem]
add_files -norecurse [glob $script_dir/xdc/*.xdc]
set_property file_type {Memory Initialization Files} [get_files *.mem]
update_compile_order -fileset sources_1

# Create Block Design
create_bd_design "bd_camera"

# 1. Zynq MPSoC PS
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:* zynq_ps
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config { apply_board_preset 1 } [get_bd_cells zynq_ps]
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 1 \
    CONFIG.PSU__USE__M_AXI_GP1 0 \
    CONFIG.PSU__USE__M_AXI_GP2 0 \
    CONFIG.PSU__FPGA_PL0_ENABLE 1 \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ 100 \
    CONFIG.PSU__FPGA_PL1_ENABLE 1 \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ 200 \
    CONFIG.PSU__I2C1__PERIPHERAL__ENABLE 1 \
    CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 16 .. 17} \
] [get_bd_cells zynq_ps]

# 2. BNN Accelerator with ASCON-128 Decryption Loader
create_bd_cell -type module -reference bnn_axi_lite bnn_0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Master {/zynq_ps/M_AXI_HPM0_FPD} Clk {Auto} } [get_bd_intf_pins bnn_0/S_AXI]

# 3. Camera Preprocessor Module
create_bd_cell -type module -reference camera_preproc camera_preproc_0
connect_bd_net [get_bd_pins zynq_ps/pl_clk0] [get_bd_pins camera_preproc_0/clk]
connect_bd_net [get_bd_pins zynq_ps/pl_resetn0] [get_bd_pins camera_preproc_0/rstn]

# 4. Connect Camera Preprocessor outputs to BNN Image BRAM / triggers
# When enabled in camera mode, camera_preproc automatically feeds the 32x32 Q15 stream

assign_bd_address
validate_bd_design
save_bd_design

make_wrapper -files [get_files bd_camera.bd] -top
add_files -norecurse [glob ./bnn_camera_bd/bnn_camera_bd.gen/sources_1/bd/bd_camera/hdl/bd_camera_wrapper.v]
set_property top bd_camera_wrapper [current_fileset]

puts "================================================================="
puts "=== BLOCK DESIGN bd_camera DA TAO THANH CONG VOI IMX274 + BNN ==="
puts "================================================================="
