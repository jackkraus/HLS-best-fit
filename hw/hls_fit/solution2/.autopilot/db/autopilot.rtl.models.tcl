set SynModuleInfo {
  {SRCNAME add_nums.1 MODELNAME add_nums_1 RTLNAME fit_add_nums_1
    SUBMODULES {
      {MODELNAME fit_mul_64s_64s_64_1_1 RTLNAME fit_mul_64s_64s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME calc_distance.1 MODELNAME calc_distance_1 RTLNAME fit_calc_distance_1}
  {SRCNAME calc_ovr_sig_sqrd.1 MODELNAME calc_ovr_sig_sqrd_1 RTLNAME fit_calc_ovr_sig_sqrd_1}
  {SRCNAME calc_ovr_sig_sqrd_x.1 MODELNAME calc_ovr_sig_sqrd_x_1 RTLNAME fit_calc_ovr_sig_sqrd_x_1}
  {SRCNAME calc_chi_squared.1 MODELNAME calc_chi_squared_1 RTLNAME fit_calc_chi_squared_1
    SUBMODULES {
      {MODELNAME fit_dadd_64ns_64ns_64_4_full_dsp_1 RTLNAME fit_dadd_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fit_ddiv_64ns_64ns_64_13_no_dsp_1 RTLNAME fit_ddiv_64ns_64ns_64_13_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 12 ALLOW_PRAGMA 1}
      {MODELNAME fit_printdouble RTLNAME fit_printdouble BINDTYPE op TYPE {} IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fit MODELNAME fit RTLNAME fit IS_TOP 1
    SUBMODULES {
      {MODELNAME fit_sitodp_64ns_64_2_no_dsp_1 RTLNAME fit_sitodp_64ns_64_2_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fit_mul_64s_32s_64_1_1 RTLNAME fit_mul_64s_32s_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fit_dadddsub_64ns_64ns_64_4_full_dsp_1 RTLNAME fit_dadddsub_64ns_64ns_64_4_full_dsp_1 BINDTYPE op TYPE dsub IMPL fulldsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fit_dmul_64ns_64ns_64_4_max_dsp_1 RTLNAME fit_dmul_64ns_64ns_64_4_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME fit_gmem_m_axi RTLNAME fit_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME fit_control_s_axi RTLNAME fit_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
