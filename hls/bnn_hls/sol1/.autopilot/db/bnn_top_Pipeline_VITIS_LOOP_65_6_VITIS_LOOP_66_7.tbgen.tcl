set moduleName bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7
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
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ TAU1_load int 32 regular  }
	{ empty int 5 regular  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co int 32 regular {array 205 { 1 1 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 int 1 regular {array 1024 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "TAU1_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ TAU1_load sc_in sc_lv 32 signal 0 } 
	{ empty sc_in sc_lv 5 signal 1 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0 sc_out sc_lv 10 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0 sc_out sc_logic 1 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_we0 sc_out sc_logic 1 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_d0 sc_out sc_lv 1 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 sc_out sc_lv 8 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0 sc_in sc_lv 32 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1 sc_out sc_lv 8 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1 sc_in sc_lv 32 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 sc_out sc_lv 8 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0 sc_in sc_lv 32 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1 sc_out sc_lv 8 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1 sc_out sc_logic 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1 sc_in sc_lv 32 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 sc_out sc_lv 8 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0 sc_in sc_lv 32 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1 sc_out sc_lv 8 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1 sc_out sc_logic 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1 sc_in sc_lv 32 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 sc_out sc_lv 8 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0 sc_in sc_lv 32 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1 sc_out sc_lv 8 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1 sc_out sc_logic 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1 sc_in sc_lv 32 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 sc_out sc_lv 8 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 sc_out sc_logic 1 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0 sc_in sc_lv 32 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1 sc_out sc_lv 8 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1 sc_out sc_logic 1 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1 sc_in sc_lv 32 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0 sc_out sc_lv 10 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0 sc_out sc_logic 1 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_we0 sc_out sc_logic 1 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_d0 sc_out sc_lv 1 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0 sc_out sc_lv 10 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0 sc_out sc_logic 1 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_we0 sc_out sc_logic 1 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_d0 sc_out sc_lv 1 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0 sc_out sc_lv 10 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0 sc_out sc_logic 1 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_we0 sc_out sc_logic 1 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_d0 sc_out sc_lv 1 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0 sc_out sc_lv 10 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0 sc_out sc_logic 1 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_we0 sc_out sc_logic 1 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_d0 sc_out sc_lv 1 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0 sc_out sc_lv 10 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0 sc_out sc_logic 1 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_we0 sc_out sc_logic 1 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_d0 sc_out sc_lv 1 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0 sc_out sc_lv 10 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0 sc_out sc_logic 1 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_we0 sc_out sc_logic 1 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_d0 sc_out sc_lv 1 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0 sc_out sc_lv 10 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0 sc_out sc_logic 1 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_we0 sc_out sc_logic 1 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_d0 sc_out sc_lv 1 signal 14 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "TAU1_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAU1_load", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "d0" }} , 
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
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_VITIS_LOOP_65_6_VITIS_LOOP_66_7 {
		TAU1_load {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type I LastRead 13 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type I LastRead 13 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type I LastRead 13 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type I LastRead 13 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type I LastRead 13 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 {Type O LastRead -1 FirstWrite 13}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 {Type O LastRead -1 FirstWrite 13}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "270", "Max" : "270"}
	, {"Name" : "Interval", "Min" : "257", "Max" : "257"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	TAU1_load { ap_none {  { TAU1_load in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 5 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q0 mem_dout 0 32 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address1 MemPortADDR2 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce1 MemPortCE2 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_d0 mem_din 1 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_d0 mem_din 1 1 } } }
}
