set moduleName bnn_top_Pipeline_VITIS_LOOP_153_26
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 11
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_153_26}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict WF2 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict f1 { MEM_WIDTH 1 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ sext_ln152_1 int 32 regular  }
	{ sext_ln152 int 32 regular  }
	{ WF2 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ a1_1_out int 40 regular {pointer 1}  }
	{ a0_1_out int 40 regular {pointer 1}  }
	{ f1 int 1 regular {array 128 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln152_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln152", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "WF2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "a1_1_out", "interface" : "wire", "bitwidth" : 40, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a0_1_out", "interface" : "wire", "bitwidth" : 40, "direction" : "WRITEONLY"} , 
 	{ "Name" : "f1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln152_1 sc_in sc_lv 32 signal 0 } 
	{ sext_ln152 sc_in sc_lv 32 signal 1 } 
	{ WF2_address0 sc_out sc_lv 8 signal 2 } 
	{ WF2_ce0 sc_out sc_logic 1 signal 2 } 
	{ WF2_q0 sc_in sc_lv 32 signal 2 } 
	{ WF2_address1 sc_out sc_lv 8 signal 2 } 
	{ WF2_ce1 sc_out sc_logic 1 signal 2 } 
	{ WF2_q1 sc_in sc_lv 32 signal 2 } 
	{ a1_1_out sc_out sc_lv 40 signal 3 } 
	{ a1_1_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ a0_1_out sc_out sc_lv 40 signal 4 } 
	{ a0_1_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ f1_address0 sc_out sc_lv 7 signal 5 } 
	{ f1_ce0 sc_out sc_logic 1 signal 5 } 
	{ f1_q0 sc_in sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln152_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln152_1", "role": "default" }} , 
 	{ "name": "sext_ln152", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln152", "role": "default" }} , 
 	{ "name": "WF2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "WF2", "role": "address0" }} , 
 	{ "name": "WF2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF2", "role": "ce0" }} , 
 	{ "name": "WF2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF2", "role": "q0" }} , 
 	{ "name": "WF2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "WF2", "role": "address1" }} , 
 	{ "name": "WF2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF2", "role": "ce1" }} , 
 	{ "name": "WF2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF2", "role": "q1" }} , 
 	{ "name": "a1_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "a1_1_out", "role": "default" }} , 
 	{ "name": "a1_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "a1_1_out", "role": "ap_vld" }} , 
 	{ "name": "a0_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "a0_1_out", "role": "default" }} , 
 	{ "name": "a0_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "a0_1_out", "role": "ap_vld" }} , 
 	{ "name": "f1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "f1", "role": "address0" }} , 
 	{ "name": "f1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "f1", "role": "ce0" }} , 
 	{ "name": "f1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "f1", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_VITIS_LOOP_153_26 {
		sext_ln152_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln152 {Type I LastRead 0 FirstWrite -1}
		WF2 {Type I LastRead 1 FirstWrite -1}
		a1_1_out {Type O LastRead -1 FirstWrite 0}
		a0_1_out {Type O LastRead -1 FirstWrite 0}
		f1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "130", "Max" : "130"}
	, {"Name" : "Interval", "Min" : "129", "Max" : "129"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln152_1 { ap_none {  { sext_ln152_1 in_data 0 32 } } }
	sext_ln152 { ap_none {  { sext_ln152 in_data 0 32 } } }
	WF2 { ap_memory {  { WF2_address0 mem_address 1 8 }  { WF2_ce0 mem_ce 1 1 }  { WF2_q0 mem_dout 0 32 }  { WF2_address1 MemPortADDR2 1 8 }  { WF2_ce1 MemPortCE2 1 1 }  { WF2_q1 MemPortDOUT2 0 32 } } }
	a1_1_out { ap_vld {  { a1_1_out out_data 1 40 }  { a1_1_out_ap_vld out_vld 1 1 } } }
	a0_1_out { ap_vld {  { a0_1_out out_data 1 40 }  { a0_1_out_ap_vld out_vld 1 1 } } }
	f1 { ap_memory {  { f1_address0 mem_address 1 7 }  { f1_ce0 mem_ce 1 1 }  { f1_q0 mem_dout 0 1 } } }
}
