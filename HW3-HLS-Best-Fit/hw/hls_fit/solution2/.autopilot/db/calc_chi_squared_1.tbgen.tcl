set moduleName calc_chi_squared_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {calc_chi_squared.1}
set C_modelType { double 64 }
set C_modelArgList {
	{ a double 64 regular  }
	{ b double 64 regular  }
	{ gmem int 64 regular {axi_master 0}  }
	{ arrx int 64 regular  }
	{ arry int 64 regular  }
	{ arrsig int 64 regular  }
	{ size int 32 regular  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "a", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "b", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "arrx","offset": { "type": "dynamic","port_name": "arrx","bundle": "control"},"direction": "READONLY"},{"cName": "arry","offset": { "type": "dynamic","port_name": "arry","bundle": "control"},"direction": "READONLY"},{"cName": "arrsigs","offset": { "type": "dynamic","port_name": "arrsigs","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "arrx", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "arry", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "arrsig", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 64} ]}
# RTL Port declarations: 
set portNum 79
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ a sc_in sc_lv 64 signal 0 } 
	{ b sc_in sc_lv 64 signal 1 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 8 signal 2 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 64 signal 2 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_RFIFONUM sc_in sc_lv 9 signal 2 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 2 } 
	{ arrx sc_in sc_lv 64 signal 3 } 
	{ arry sc_in sc_lv 64 signal 4 } 
	{ arrsig sc_in sc_lv 64 signal 5 } 
	{ size sc_in sc_lv 32 signal 6 } 
	{ ap_return sc_out sc_lv 64 signal -1 } 
	{ grp_fu_356_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_356_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_356_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_356_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_356_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_360_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_360_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_360_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_360_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_127_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_127_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_127_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_127_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_132_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_132_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_132_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_132_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_137_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_137_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_137_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "a", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a", "role": "default" }} , 
 	{ "name": "b", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }} , 
 	{ "name": "arrx", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "arrx", "role": "default" }} , 
 	{ "name": "arry", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "arry", "role": "default" }} , 
 	{ "name": "arrsig", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "arrsig", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_356_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_356_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_356_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_356_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_356_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_356_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_356_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_356_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_356_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_356_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_360_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_360_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_360_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_360_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_360_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_360_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_360_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_360_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_127_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_127_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_127_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_127_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_127_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_127_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_127_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_127_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_132_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_132_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_132_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_132_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_132_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_132_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_132_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_132_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_137_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_137_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_137_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_137_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_137_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_137_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "5", "6", "7", "8"],
		"CDFG" : "calc_chi_squared_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_calc_ovr_sig_sqrd_1_fu_158", "Port" : "gmem", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "2", "SubInstance" : "grp_calc_ovr_sig_sqrd_x_1_fu_167", "Port" : "gmem", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "arrx", "Type" : "None", "Direction" : "I"},
			{"Name" : "arry", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrsig", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_152_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "145", "FirstState" : "ap_ST_fsm_state20", "LastState" : ["ap_ST_fsm_state121"], "QuitState" : ["ap_ST_fsm_state20"], "PreState" : ["ap_ST_fsm_state19"], "PostState" : ["ap_ST_fsm_state122"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_calc_ovr_sig_sqrd_1_fu_158", "Parent" : "0",
		"CDFG" : "calc_ovr_sig_sqrd_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "arrsig", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_103_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "97", "FirstState" : "ap_ST_fsm_state73", "LastState" : ["ap_ST_fsm_state97"], "QuitState" : ["ap_ST_fsm_state73"], "PreState" : ["ap_ST_fsm_state72"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_calc_ovr_sig_sqrd_x_1_fu_167", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "calc_ovr_sig_sqrd_x_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "arrsig", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"},
			{"Name" : "arrx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_55_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "101", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state101"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_calc_ovr_sig_sqrd_x_1_fu_167.ddiv_64ns_64ns_64_13_no_dsp_1_U25", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_4_full_dsp_1_U32", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_max_dsp_1_U34", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_13_no_dsp_1_U37", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printdouble_U39", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.printdouble_U40", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	calc_chi_squared_1 {
		a {Type I LastRead 18 FirstWrite -1}
		b {Type I LastRead 18 FirstWrite -1}
		gmem {Type I LastRead 93 FirstWrite -1}
		arrx {Type I LastRead 5 FirstWrite -1}
		arry {Type I LastRead 18 FirstWrite -1}
		arrsig {Type I LastRead 3 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}}
	calc_ovr_sig_sqrd_1 {
		gmem {Type I LastRead 73 FirstWrite -1}
		arrsig {Type I LastRead 1 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}}
	calc_ovr_sig_sqrd_x_1 {
		gmem {Type I LastRead 86 FirstWrite -1}
		arrsig {Type I LastRead 0 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}
		arrx {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	a { ap_none {  { a in_data 0 64 } } }
	b { ap_none {  { b in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 32 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 64 }  { m_axi_gmem_WSTRB STRB 1 8 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 32 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 64 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RFIFONUM LEN 0 9 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
	arrx { ap_none {  { arrx in_data 0 64 } } }
	arry { ap_none {  { arry in_data 0 64 } } }
	arrsig { ap_none {  { arrsig in_data 0 64 } } }
	size { ap_none {  { size in_data 0 32 } } }
}
