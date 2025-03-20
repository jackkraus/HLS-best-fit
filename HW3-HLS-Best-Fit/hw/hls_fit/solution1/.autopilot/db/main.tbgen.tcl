set moduleName main
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {main}
set C_modelType { int 32 }
set C_modelArgList {
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "offset" : {"out":16}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"main","role":"start","value":"0","valid_bit":"0"},{"name":"main","role":"continue","value":"0","valid_bit":"4"},{"name":"main","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"main","role":"start","value":"0","valid_bit":"0"},{"name":"main","role":"done","value":"0","valid_bit":"1"},{"name":"main","role":"idle","value":"0","valid_bit":"2"},{"name":"main","role":"ready","value":"0","valid_bit":"3"},{"name":"main","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55"],
		"CDFG" : "main",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "31217", "EstimateLatencyMax" : "50009",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : []},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vla3_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vla14_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.vla25_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454", "Parent" : "0", "Child" : ["5", "9", "12", "14", "17", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"],
		"CDFG" : "fit",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5087", "EstimateLatencyMax" : "8219",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "arrx", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82", "Port" : "arrx", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "12", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_204_1_fu_105", "Port" : "arrx", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "14", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_53_1_fu_116", "Port" : "arrx", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "17", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126", "Port" : "arrx", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "arry", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82", "Port" : "arry", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "12", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_204_1_fu_105", "Port" : "arry", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "17", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126", "Port" : "arry", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "arrsigs", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_100_1_fu_96", "Port" : "arrsigs", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "14", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_53_1_fu_116", "Port" : "arrsigs", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "17", "SubInstance" : "grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126", "Port" : "arrsigs", "Inst_start_state" : "35", "Inst_end_state" : "36"}]},
			{"Name" : "size", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82", "Parent" : "4", "Child" : ["6", "7", "8"],
		"CDFG" : "fit_Pipeline_VITIS_LOOP_28_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "96", "EstimateLatencyMax" : "444",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrx", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "arry", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_28_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82.mul_12s_7ns_19_1_1_U1", "Parent" : "5"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82.mul_7ns_7ns_14_1_1_U2", "Parent" : "5"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_28_1_fu_82.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_100_1_fu_96", "Parent" : "4", "Child" : ["10", "11"],
		"CDFG" : "fit_Pipeline_VITIS_LOOP_100_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "304", "EstimateLatencyMax" : "1348",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrsigs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "S_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_100_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_100_1_fu_96.sitodp_64ns_64_2_no_dsp_1_U23", "Parent" : "9"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_100_1_fu_96.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_204_1_fu_105", "Parent" : "4", "Child" : ["13"],
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
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_204_1_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_53_1_fu_116", "Parent" : "4", "Child" : ["15", "16"],
		"CDFG" : "fit_Pipeline_VITIS_LOOP_53_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "308", "EstimateLatencyMax" : "1352",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrsigs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "arrx", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Sx_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_53_1_fu_116.sitodp_64ns_64_2_no_dsp_1_U30", "Parent" : "14"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_53_1_fu_116.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126", "Parent" : "4", "Child" : ["18", "19"],
		"CDFG" : "fit_Pipeline_VITIS_LOOP_148_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "309", "EstimateLatencyMax" : "1353",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrx", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "arry", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "arrsigs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SxoS", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "Stt_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "term2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_148_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126.dadd_64ns_64ns_64_4_full_dsp_1_U36", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.grp_fit_Pipeline_VITIS_LOOP_148_1_fu_126.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.dadddsub_64ns_64ns_64_4_full_dsp_1_U51", "Parent" : "4"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.dmul_64ns_64ns_64_4_max_dsp_1_U52", "Parent" : "4"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.dmul_64ns_64ns_64_4_max_dsp_1_U53", "Parent" : "4"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.dmul_64ns_64ns_64_4_max_dsp_1_U54", "Parent" : "4"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.ddiv_64ns_64ns_64_13_no_dsp_1_U55", "Parent" : "4"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.ddiv_64ns_64ns_64_13_no_dsp_1_U56", "Parent" : "4"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.sitodp_64ns_64_2_no_dsp_1_U57", "Parent" : "4"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.sitodp_64ns_64_2_no_dsp_1_U58", "Parent" : "4"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.sitodp_64ns_64_2_no_dsp_1_U59", "Parent" : "4"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_9ns_64_1_1_U60", "Parent" : "4"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_9ns_64_1_1_U61", "Parent" : "4"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_64s_64_1_1_U62", "Parent" : "4"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_64s_64_1_1_U63", "Parent" : "4"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_64s_64_1_1_U64", "Parent" : "4"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.mul_64s_64s_64_1_1_U65", "Parent" : "4"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U66", "Parent" : "4"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U67", "Parent" : "4"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U68", "Parent" : "4"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U69", "Parent" : "4"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printnone_U70", "Parent" : "4"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U71", "Parent" : "4"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.printdouble_U72", "Parent" : "4"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fit_fu_14454.sitodp_64ns_64_2_no_dsp_1_U73", "Parent" : "4"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U86", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U87", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U88", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U89", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U90", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U91", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U92", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U93", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U94", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U95", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U96", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printint_U97", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	main {}
	fit {
		arrx {Type I LastRead 12 FirstWrite -1}
		arry {Type I LastRead 0 FirstWrite -1}
		arrsigs {Type I LastRead 0 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}}
	fit_Pipeline_VITIS_LOOP_28_1 {
		size {Type I LastRead 0 FirstWrite -1}
		arrx {Type I LastRead 0 FirstWrite -1}
		arry {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}
		p_out1 {Type O LastRead -1 FirstWrite 0}
		p_out2 {Type O LastRead -1 FirstWrite 0}
		p_out3 {Type O LastRead -1 FirstWrite 0}}
	fit_Pipeline_VITIS_LOOP_100_1 {
		size {Type I LastRead 0 FirstWrite -1}
		arrsigs {Type I LastRead 0 FirstWrite -1}
		S_out {Type O LastRead -1 FirstWrite 20}}
	fit_Pipeline_VITIS_LOOP_204_1 {
		arrx {Type I LastRead 0 FirstWrite -1}
		arry {Type I LastRead 0 FirstWrite -1}
		tmp {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		f_out {Type O LastRead -1 FirstWrite 18}}
	fit_Pipeline_VITIS_LOOP_53_1 {
		size {Type I LastRead 0 FirstWrite -1}
		arrsigs {Type I LastRead 0 FirstWrite -1}
		arrx {Type I LastRead 12 FirstWrite -1}
		Sx_1_out {Type O LastRead -1 FirstWrite 24}}
	fit_Pipeline_VITIS_LOOP_148_1 {
		size {Type I LastRead 0 FirstWrite -1}
		arrx {Type I LastRead 0 FirstWrite -1}
		arry {Type I LastRead 0 FirstWrite -1}
		arrsigs {Type I LastRead 0 FirstWrite -1}
		SxoS {Type I LastRead 0 FirstWrite -1}
		tmp {Type I LastRead 0 FirstWrite -1}
		tmp_1 {Type I LastRead 0 FirstWrite -1}
		Stt_out {Type O LastRead -1 FirstWrite 25}
		term2_out {Type O LastRead -1 FirstWrite 25}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "31217", "Max" : "50009"}
	, {"Name" : "Interval", "Min" : "31218", "Max" : "50010"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
