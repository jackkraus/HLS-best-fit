set ModuleHierarchy {[{
"Name" : "fit","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_add_nums_1_fu_92","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_28_1","ID" : "2","Type" : "no"},]},
	{"Name" : "grp_calc_distance_1_fu_104","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_210_1","ID" : "4","Type" : "no"},]},
	{"Name" : "grp_calc_chi_squared_1_fu_115","ID" : "5","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_calc_ovr_sig_sqrd_1_fu_158","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_103_1","ID" : "7","Type" : "no"},]},
		{"Name" : "grp_calc_ovr_sig_sqrd_x_1_fu_167","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_55_1","ID" : "9","Type" : "no"},]},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_152_1","ID" : "10","Type" : "no"},]},]
}]}