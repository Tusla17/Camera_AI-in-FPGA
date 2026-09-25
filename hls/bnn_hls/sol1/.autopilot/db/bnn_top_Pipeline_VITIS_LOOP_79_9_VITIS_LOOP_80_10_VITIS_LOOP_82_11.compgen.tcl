# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_17_3_1_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_17_3_1_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_17_3_1_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


set name bnn_top_urem_5ns_4ns_3_9_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 8 ALLOW_PRAGMA 1
}


set name bnn_top_mul_8ns_10ns_17_1_1
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
    id 90 \
    name W2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename W2_0 \
    op interface \
    ports { W2_0_address0 { O 9 vector } W2_0_ce0 { O 1 bit } W2_0_q0 { I 32 vector } W2_0_address1 { O 9 vector } W2_0_ce1 { O 1 bit } W2_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'W2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 91 \
    name W2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename W2_1 \
    op interface \
    ports { W2_1_address0 { O 9 vector } W2_1_ce0 { O 1 bit } W2_1_q0 { I 32 vector } W2_1_address1 { O 9 vector } W2_1_ce1 { O 1 bit } W2_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'W2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 92 \
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
    id 93 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 94 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 95 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 96 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 97 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 98 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 99 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 100 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0 { O 10 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 101 \
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
    id 102 \
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
    id 103 \
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
    id 104 \
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
    id 89 \
    name mul_ln79 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln79 \
    op interface \
    ports { mul_ln79 { I 15 vector } } \
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


