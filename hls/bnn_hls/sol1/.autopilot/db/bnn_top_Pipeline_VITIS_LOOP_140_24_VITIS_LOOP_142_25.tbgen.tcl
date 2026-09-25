set moduleName bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25
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
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict WF1 { MEM_WIDTH 32 MEM_SIZE 16384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict TAUF1 { MEM_WIDTH 32 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict f1 { MEM_WIDTH 1 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict l3 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ WF1 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ TAUF1 int 32 regular {array 128 { 1 3 } 1 1 }  }
	{ f1 int 1 regular {array 128 { 0 3 } 0 1 } {global 1}  }
	{ l3 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "WF1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "TAUF1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "f1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "l3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ WF1_address0 sc_out sc_lv 12 signal 0 } 
	{ WF1_ce0 sc_out sc_logic 1 signal 0 } 
	{ WF1_q0 sc_in sc_lv 32 signal 0 } 
	{ TAUF1_address0 sc_out sc_lv 7 signal 1 } 
	{ TAUF1_ce0 sc_out sc_logic 1 signal 1 } 
	{ TAUF1_q0 sc_in sc_lv 32 signal 1 } 
	{ f1_address0 sc_out sc_lv 7 signal 2 } 
	{ f1_ce0 sc_out sc_logic 1 signal 2 } 
	{ f1_we0 sc_out sc_logic 1 signal 2 } 
	{ f1_d0 sc_out sc_lv 1 signal 2 } 
	{ l3_address0 sc_out sc_lv 10 signal 3 } 
	{ l3_ce0 sc_out sc_logic 1 signal 3 } 
	{ l3_q0 sc_in sc_lv 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "WF1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "WF1", "role": "address0" }} , 
 	{ "name": "WF1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF1", "role": "ce0" }} , 
 	{ "name": "WF1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF1", "role": "q0" }} , 
 	{ "name": "TAUF1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "TAUF1", "role": "address0" }} , 
 	{ "name": "TAUF1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "TAUF1", "role": "ce0" }} , 
 	{ "name": "TAUF1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAUF1", "role": "q0" }} , 
 	{ "name": "f1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "f1", "role": "address0" }} , 
 	{ "name": "f1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "f1", "role": "ce0" }} , 
 	{ "name": "f1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "f1", "role": "we0" }} , 
 	{ "name": "f1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "f1", "role": "d0" }} , 
 	{ "name": "l3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "l3", "role": "address0" }} , 
 	{ "name": "l3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "l3", "role": "ce0" }} , 
 	{ "name": "l3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "l3", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25 {
		WF1 {Type I LastRead 1 FirstWrite -1}
		TAUF1 {Type I LastRead 1 FirstWrite -1}
		f1 {Type O LastRead -1 FirstWrite 2}
		l3 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "131074", "Max" : "131074"}
	, {"Name" : "Interval", "Min" : "131073", "Max" : "131073"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	WF1 { ap_memory {  { WF1_address0 mem_address 1 12 }  { WF1_ce0 mem_ce 1 1 }  { WF1_q0 mem_dout 0 32 } } }
	TAUF1 { ap_memory {  { TAUF1_address0 mem_address 1 7 }  { TAUF1_ce0 mem_ce 1 1 }  { TAUF1_q0 mem_dout 0 32 } } }
	f1 { ap_memory {  { f1_address0 mem_address 1 7 }  { f1_ce0 mem_ce 1 1 }  { f1_we0 mem_we 1 1 }  { f1_d0 mem_din 1 1 } } }
	l3 { ap_memory {  { l3_address0 mem_address 1 10 }  { l3_ce0 mem_ce 1 1 }  { l3_q0 mem_dout 0 1 } } }
}
