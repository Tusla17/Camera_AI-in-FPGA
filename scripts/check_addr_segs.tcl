
open_project D:/VIVADO_PROJECTS/bnn_bd/bnn_bd.xpr
open_bd_design [get_files bd.bd]
puts "=== ALL ADDRESS SEGS ==="
foreach seg [get_bd_addr_segs] {
    puts "SEG: $seg"
}
close_project
exit
