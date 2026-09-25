# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_11_3_32_1_1_x BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_am_addmul_5ns_5ns_7ns_13_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
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
    id 166 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0 { I 32 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 167 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0 { I 32 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 168 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0 { I 32 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 169 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0 { I 32 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 170 \
    name bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co \
    op interface \
    ports { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0 { I 32 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1 { O 8 vector } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1 { O 1 bit } bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 171 \
    name l3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename l3 \
    op interface \
    ports { l3_address0 { O 10 vector } l3_ce0 { O 1 bit } l3_we0 { O 1 bit } l3_d0 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'l3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name sext_ln135 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln135 \
    op interface \
    ports { sext_ln135 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name oc_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_oc_2 \
    op interface \
    ports { oc_2 { I 6 vector } } \
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


