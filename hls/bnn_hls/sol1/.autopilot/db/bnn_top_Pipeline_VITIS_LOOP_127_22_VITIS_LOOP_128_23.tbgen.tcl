set moduleName bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23
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
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict l3 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ sext_ln135 int 32 regular  }
	{ oc_2 int 6 regular  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ l3 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln135", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "oc_2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "l3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln135 sc_in sc_lv 32 signal 0 } 
	{ oc_2 sc_in sc_lv 6 signal 1 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 sc_out sc_lv 8 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 sc_out sc_logic 1 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0 sc_in sc_lv 32 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1 sc_out sc_lv 8 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1 sc_out sc_logic 1 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1 sc_in sc_lv 32 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 sc_out sc_lv 8 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0 sc_in sc_lv 32 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1 sc_out sc_lv 8 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1 sc_in sc_lv 32 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 sc_out sc_lv 8 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0 sc_in sc_lv 32 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1 sc_out sc_lv 8 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1 sc_out sc_logic 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1 sc_in sc_lv 32 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 sc_out sc_lv 8 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0 sc_in sc_lv 32 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1 sc_out sc_lv 8 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1 sc_out sc_logic 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1 sc_in sc_lv 32 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 sc_out sc_lv 8 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 sc_out sc_logic 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0 sc_in sc_lv 32 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1 sc_out sc_lv 8 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1 sc_out sc_logic 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1 sc_in sc_lv 32 signal 6 } 
	{ l3_address0 sc_out sc_lv 10 signal 7 } 
	{ l3_ce0 sc_out sc_logic 1 signal 7 } 
	{ l3_we0 sc_out sc_logic 1 signal 7 } 
	{ l3_d0 sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln135", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln135", "role": "default" }} , 
 	{ "name": "oc_2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "oc_2", "role": "default" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "address1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "ce1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "q1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "address1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "ce1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "q1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "address1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "ce1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "q1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "address1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "ce1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "q1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "address1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "ce1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "q1" }} , 
 	{ "name": "l3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "l3", "role": "address0" }} , 
 	{ "name": "l3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "l3", "role": "ce0" }} , 
 	{ "name": "l3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "l3", "role": "we0" }} , 
 	{ "name": "l3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "l3", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23 {
		sext_ln135 {Type I LastRead 0 FirstWrite -1}
		oc_2 {Type I LastRead 0 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type I LastRead 11 FirstWrite -1}
		l3 {Type O LastRead -1 FirstWrite 11}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "28", "Max" : "28"}
	, {"Name" : "Interval", "Min" : "17", "Max" : "17"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln135 { ap_none {  { sext_ln135 in_data 0 32 } } }
	oc_2 { ap_none {  { oc_2 in_data 0 6 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1 MemPortDOUT2 0 32 } } }
	l3 { ap_memory {  { l3_address0 mem_address 1 10 }  { l3_ce0 mem_ce 1 1 }  { l3_we0 mem_we 1 1 }  { l3_d0 mem_din 1 1 } } }
}
