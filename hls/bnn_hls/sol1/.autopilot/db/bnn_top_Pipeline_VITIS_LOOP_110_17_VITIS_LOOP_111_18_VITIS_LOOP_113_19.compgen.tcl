# This script segment is generated automatically by AutoPilot

set name bnn_top_mul_6ns_8ns_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 138 \
    name W3_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename W3_0 \
    op interface \
    ports { W3_0_address0 { O 10 vector } W3_0_ce0 { O 1 bit } W3_0_q0 { I 32 vector } W3_0_address1 { O 10 vector } W3_0_ce1 { O 1 bit } W3_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'W3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 139 \
    name W3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename W3_1 \
    op interface \
    ports { W3_1_address0 { O 10 vector } W3_1_ce0 { O 1 bit } W3_1_q0 { I 32 vector } W3_1_address1 { O 10 vector } W3_1_ce1 { O 1 bit } W3_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'W3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 140 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 141 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 142 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 143 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 144 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 145 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 146 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 147 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 148 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7_address0 { O 9 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 149 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 150 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 151 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 152 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name mul_ln110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln110 \
    op interface \
    ports { mul_ln110 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName bnn_top_flow_control_loop_pipe_sequential_init_U
set CompName bnn_top_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix bnn_top_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


