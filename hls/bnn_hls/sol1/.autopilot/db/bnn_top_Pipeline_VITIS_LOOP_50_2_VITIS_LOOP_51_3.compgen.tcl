# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_9_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_9_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_sparsemux_9_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_bitselect_1ns_32ns_5ns_1_1_1 BINDTYPE {op} TYPE {bitselect} IMPL {auto}
}


set name bnn_top_urem_7ns_4ns_3_11_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 10 ALLOW_PRAGMA 1
}


set name bnn_top_mul_10ns_12ns_21_1_1
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
    id 23 \
    name img_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename img_0 \
    op interface \
    ports { img_0_address0 { O 8 vector } img_0_ce0 { O 1 bit } img_0_q0 { I 32 vector } img_0_address1 { O 8 vector } img_0_ce1 { O 1 bit } img_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'img_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name img_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename img_1 \
    op interface \
    ports { img_1_address0 { O 8 vector } img_1_ce0 { O 1 bit } img_1_q0 { I 32 vector } img_1_address1 { O 8 vector } img_1_ce1 { O 1 bit } img_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'img_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name img_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename img_2 \
    op interface \
    ports { img_2_address0 { O 8 vector } img_2_ce0 { O 1 bit } img_2_q0 { I 32 vector } img_2_address1 { O 8 vector } img_2_ce1 { O 1 bit } img_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'img_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name img_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename img_3 \
    op interface \
    ports { img_3_address0 { O 8 vector } img_3_ce0 { O 1 bit } img_3_q0 { I 32 vector } img_3_address1 { O 8 vector } img_3_ce1 { O 1 bit } img_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'img_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
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
    id 45 \
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
    id 46 \
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
    id 47 \
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
    id 48 \
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
    id 27 \
    name W1_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_1 \
    op interface \
    ports { W1_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name empty_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_34 \
    op interface \
    ports { empty_34 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name W1_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_2 \
    op interface \
    ports { W1_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name empty_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_35 \
    op interface \
    ports { empty_35 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name W1_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_3 \
    op interface \
    ports { W1_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name empty_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_36 \
    op interface \
    ports { empty_36 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name W1_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_4 \
    op interface \
    ports { W1_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name empty_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_37 \
    op interface \
    ports { empty_37 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name cmp38_1_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp38_1_1 \
    op interface \
    ports { cmp38_1_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name W1_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_5 \
    op interface \
    ports { W1_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name empty_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_38 \
    op interface \
    ports { empty_38 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name W1_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_6 \
    op interface \
    ports { W1_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name empty_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_39 \
    op interface \
    ports { empty_39 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name W1_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_7 \
    op interface \
    ports { W1_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name empty_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_40 \
    op interface \
    ports { empty_40 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name W1_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_W1_load_8 \
    op interface \
    ports { W1_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 5 vector } } \
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


