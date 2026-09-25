set SynModuleInfo {
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3 MODELNAME bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3
    SUBMODULES {
      {MODELNAME bnn_top_sparsemux_9_2_32_1_1 RTLNAME bnn_top_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME bnn_top_bitselect_1ns_32ns_5ns_1_1_1 RTLNAME bnn_top_bitselect_1ns_32ns_5ns_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME bnn_top_urem_7ns_4ns_3_11_1 RTLNAME bnn_top_urem_7ns_4ns_3_11_1 BINDTYPE op TYPE urem IMPL auto LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_mul_10ns_12ns_21_1_1 RTLNAME bnn_top_mul_10ns_12ns_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_flow_control_loop_pipe_sequential_init RTLNAME bnn_top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME bnn_top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7 MODELNAME bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7
    SUBMODULES {
      {MODELNAME bnn_top_sparsemux_11_3_32_1_1 RTLNAME bnn_top_sparsemux_11_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11 MODELNAME bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11
    SUBMODULES {
      {MODELNAME bnn_top_sparsemux_17_3_1_1_1 RTLNAME bnn_top_sparsemux_17_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME bnn_top_urem_5ns_4ns_3_9_1 RTLNAME bnn_top_urem_5ns_4ns_3_9_1 BINDTYPE op TYPE urem IMPL auto LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_mul_8ns_10ns_17_1_1 RTLNAME bnn_top_mul_8ns_10ns_17_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_96_14_VITIS_LOOP_97_15 MODELNAME bnn_top_Pipeline_VITIS_LOOP_96_14_VITIS_LOOP_97_15 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_96_14_VITIS_LOOP_97_15}
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_110_17_VITIS_LOOP_111_18_VITIS_LOOP_113_19 MODELNAME bnn_top_Pipeline_VITIS_LOOP_110_17_VITIS_LOOP_111_18_VITIS_LOOP_113_19 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_110_17_VITIS_LOOP_111_18_VITIS_LOOP_113_19
    SUBMODULES {
      {MODELNAME bnn_top_mul_6ns_8ns_13_1_1 RTLNAME bnn_top_mul_6ns_8ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23 MODELNAME bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23
    SUBMODULES {
      {MODELNAME bnn_top_sparsemux_11_3_32_1_1_x RTLNAME bnn_top_sparsemux_11_3_32_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME bnn_top_am_addmul_5ns_5ns_7ns_13_4_1 RTLNAME bnn_top_am_addmul_5ns_5ns_7ns_13_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25 MODELNAME bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25}
  {SRCNAME bnn_top_Pipeline_VITIS_LOOP_153_26 MODELNAME bnn_top_Pipeline_VITIS_LOOP_153_26 RTLNAME bnn_top_bnn_top_Pipeline_VITIS_LOOP_153_26}
  {SRCNAME bnn_top MODELNAME bnn_top RTLNAME bnn_top IS_TOP 1
    SUBMODULES {
      {MODELNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_RAbkb RTLNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_RAbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_Rg8j RTLNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_Rg8j BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_Rocq RTLNAME bnn_top_bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12_Rocq BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME bnn_top_f1_RAM_AUTO_1R1W RTLNAME bnn_top_f1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
