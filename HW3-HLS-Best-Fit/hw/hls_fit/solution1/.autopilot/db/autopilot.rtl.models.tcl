set SynModuleInfo {
  {SRCNAME fit_Pipeline_VITIS_LOOP_28_1 MODELNAME fit_Pipeline_VITIS_LOOP_28_1 RTLNAME main_fit_Pipeline_VITIS_LOOP_28_1
    SUBMODULES {
      {MODELNAME main_mul_12s_7ns_19_1_1 RTLNAME main_mul_12s_7ns_19_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_mul_7ns_7ns_14_1_1 RTLNAME main_mul_7ns_7ns_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_flow_control_loop_pipe_sequential_init RTLNAME main_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME main_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME fit_Pipeline_VITIS_LOOP_204_1 MODELNAME fit_Pipeline_VITIS_LOOP_204_1 RTLNAME main_fit_Pipeline_VITIS_LOOP_204_1}
  {SRCNAME fit_Pipeline_VITIS_LOOP_100_1 MODELNAME fit_Pipeline_VITIS_LOOP_100_1 RTLNAME main_fit_Pipeline_VITIS_LOOP_100_1}
  {SRCNAME fit_Pipeline_VITIS_LOOP_53_1 MODELNAME fit_Pipeline_VITIS_LOOP_53_1 RTLNAME main_fit_Pipeline_VITIS_LOOP_53_1}
  {SRCNAME fit_Pipeline_VITIS_LOOP_148_1 MODELNAME fit_Pipeline_VITIS_LOOP_148_1 RTLNAME main_fit_Pipeline_VITIS_LOOP_148_1
    SUBMODULES {
      {MODELNAME main_dadd_64ns_64ns_64_4_full_dsp_1 RTLNAME main_dadd_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fit MODELNAME fit RTLNAME main_fit
    SUBMODULES {
      {MODELNAME main_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME main_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME main_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME main_ddiv_64ns_64ns_64_13_no_dsp_1 RTLNAME main_ddiv_64ns_64ns_64_13_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 12 ALLOW_PRAGMA 1}
      {MODELNAME main_mul_64s_9ns_64_1_1 RTLNAME main_mul_64s_9ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_mul_64s_64s_64_1_1 RTLNAME main_mul_64s_64s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_printdouble RTLNAME main_printdouble BINDTYPE op TYPE {} IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_printnone RTLNAME main_printnone BINDTYPE op TYPE {} IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_sitodp_64ns_64_2_no_dsp_1 RTLNAME main_sitodp_64ns_64_2_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME main MODELNAME main RTLNAME main IS_TOP 1
    SUBMODULES {
      {MODELNAME main_printint RTLNAME main_printint BINDTYPE op TYPE {} IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME main_vla3_RAM_AUTO_1R1W RTLNAME main_vla3_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_vla14_RAM_AUTO_1R1W RTLNAME main_vla14_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_vla25_RAM_AUTO_1R1W RTLNAME main_vla25_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME main_control_s_axi RTLNAME main_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
