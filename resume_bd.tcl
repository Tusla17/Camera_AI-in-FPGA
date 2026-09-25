set_param general.maxThreads 8
set_param synth.maxThreads 8
open_project ./bnn_bd/bnn_bd.xpr
set script_dir [file normalize [file dirname [info script]]]

# Them toan bo cac file rtl moi nhat (bao gom ca trng.v, camera_preproc.v)
add_files -norecurse [glob $script_dir/rtl/*.v]
update_compile_order -fileset sources_1

# Reset va chay lai toan bo qua trinh tong hop
reset_run bd_bnn_0_0_synth_1
reset_run synth_1
reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

write_hw_platform -fixed -include_bit -force ./bnn_zcu106.xsa
puts "=========================================================="
puts "=== XONG: Bitstream bd_wrapper.bit moi nhat da tao xong! ==="
puts "=========================================================="
