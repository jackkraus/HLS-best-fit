set moduleName fit_Pipeline_VITIS_LOOP_204_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fit_Pipeline_VITIS_LOOP_204_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ arrx int 7 regular {array 1024 { 1 3 } 1 1 }  }
	{ arry int 12 regular {array 1024 { 1 3 } 1 1 }  }
	{ tmp double 64 regular  }
	{ tmp_1 double 64 regular  }
	{ f_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "arrx", "interface" : "memory", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "arry", "interface" : "memory", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "tmp", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "f_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ arrx_address0 sc_out sc_lv 10 signal 0 } 
	{ arrx_ce0 sc_out sc_logic 1 signal 0 } 
	{ arrx_q0 sc_in sc_lv 7 signal 0 } 
	{ arry_address0 sc_out sc_lv 10 signal 1 } 
	{ arry_ce0 sc_out sc_logic 1 signal 1 } 
	{ arry_q0 sc_in sc_lv 12 signal 1 } 
	{ tmp sc_in sc_lv 64 signal 2 } 
	{ tmp_1 sc_in sc_lv 64 signal 3 } 
	{ f_out sc_out sc_lv 64 signal 4 } 
	{ f_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ grp_fu_521_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_521_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_521_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_142_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_142_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_142_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_142_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_142_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_147_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_147_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_147_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_147_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "arrx_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "arrx", "role": "address0" }} , 
 	{ "name": "arrx_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arrx", "role": "ce0" }} , 
 	{ "name": "arrx_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "arrx", "role": "q0" }} , 
 	{ "name": "arry_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "arry", "role": "address0" }} , 
 	{ "name": "arry_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "arry", "role": "ce0" }} , 
 	{ "name": "arry_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "arry", "role": "q0" }} , 
 	{ "name": "tmp", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tmp", "role": "default" }} , 
 	{ "name": "tmp_1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tmp_1", "role": "default" }} , 
 	{ "name": "f_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "f_out", "role": "default" }} , 
 	{ "name": "f_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "f_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_521_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_521_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_521_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_521_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_521_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_521_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_142_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_142_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_142_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_142_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_147_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_147_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_147_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_147_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_147_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_147_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_147_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_147_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "fit_Pipeline_VITIS_LOOP_204_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4106", "EstimateLatencyMax" : "4106",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "arrx", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "arry", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_204_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fit_Pipeline_VITIS_LOOP_204_1 {
		arrx {Type I LastRead 0 FirstWrite -1}
		arry {Type I LastRead 0 FirstWrite -1}
		tmp {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		f_out {Type O LastRead -1 FirstWrite 18}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4106", "Max" : "4106"}
	, {"Name" : "Interval", "Min" : "4106", "Max" : "4106"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	arrx { ap_memory {  { arrx_address0 mem_address 1 10 }  { arrx_ce0 mem_ce 1 1 }  { arrx_q0 in_data 0 7 } } }
	arry { ap_memory {  { arry_address0 mem_address 1 10 }  { arry_ce0 mem_ce 1 1 }  { arry_q0 mem_dout 0 12 } } }
	tmp { ap_none {  { tmp in_data 0 64 } } }
	tmp_1 { ap_none {  { tmp_1 in_data 0 64 } } }
	f_out { ap_vld {  { f_out out_data 1 64 }  { f_out_ap_vld out_vld 1 1 } } }
}
