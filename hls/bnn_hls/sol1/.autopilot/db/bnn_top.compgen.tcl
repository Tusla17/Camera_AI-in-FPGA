# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_RAbkb BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_Rg8j BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_Rocq BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler bnn_top_f1_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 187 \
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
    id 188 \
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
    id 189 \
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
    id 190 \
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
    id 191 \
    name W1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename W1 \
    op interface \
    ports { W1_address0 { O 4 vector } W1_ce0 { O 1 bit } W1_q0 { I 32 vector } W1_address1 { O 4 vector } W1_ce1 { O 1 bit } W1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'W1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 192 \
    name TAU1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename TAU1 \
    op interface \
    ports { TAU1_address0 { O 5 vector } TAU1_ce0 { O 1 bit } TAU1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'TAU1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 193 \
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
    id 194 \
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
    id 195 \
    name TAU2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename TAU2 \
    op interface \
    ports { TAU2_address0 { O 6 vector } TAU2_ce0 { O 1 bit } TAU2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'TAU2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 196 \
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
    id 197 \
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
    id 198 \
    name TAU3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename TAU3 \
    op interface \
    ports { TAU3_address0 { O 6 vector } TAU3_ce0 { O 1 bit } TAU3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'TAU3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 199 \
    name WF1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename WF1 \
    op interface \
    ports { WF1_address0 { O 12 vector } WF1_ce0 { O 1 bit } WF1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'WF1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 200 \
    name TAUF1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename TAUF1 \
    op interface \
    ports { TAUF1_address0 { O 7 vector } TAUF1_ce0 { O 1 bit } TAUF1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'TAUF1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 201 \
    name WF2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename WF2 \
    op interface \
    ports { WF2_address0 { O 8 vector } WF2_ce0 { O 1 bit } WF2_q0 { I 32 vector } WF2_address1 { O 8 vector } WF2_ce1 { O 1 bit } WF2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'WF2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 202 \
    name BF2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BF2 \
    op interface \
    ports { BF2_address0 { O 1 vector } BF2_ce0 { O 1 bit } BF2_q0 { I 32 vector } BF2_address1 { O 1 vector } BF2_ce1 { O 1 bit } BF2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BF2'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name logit0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logit0 \
    op interface \
    ports { logit0 { O 32 vector } logit0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name logit1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_logit1 \
    op interface \
    ports { logit1 { O 32 vector } logit1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name pred_r \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pred_r \
    op interface \
    ports { pred_r { O 32 vector } pred_r_ap_vld { O 1 bit } } \
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


