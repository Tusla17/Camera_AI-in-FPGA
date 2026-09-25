set moduleName bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11
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
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict W2_0 { MEM_WIDTH 32 MEM_SIZE 1152 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W2_1 { MEM_WIDTH 32 MEM_SIZE 1152 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 { MEM_WIDTH 1 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ mul_ln79 int 15 regular  }
	{ W2_0 int 32 regular {array 288 { 1 1 } 1 1 }  }
	{ W2_1 int 32 regular {array 288 { 1 1 } 1 1 }  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 int 1 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln79", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "W2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 63
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln79 sc_in sc_lv 15 signal 0 } 
	{ W2_0_address0 sc_out sc_lv 9 signal 1 } 
	{ W2_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ W2_0_q0 sc_in sc_lv 32 signal 1 } 
	{ W2_0_address1 sc_out sc_lv 9 signal 1 } 
	{ W2_0_ce1 sc_out sc_logic 1 signal 1 } 
	{ W2_0_q1 sc_in sc_lv 32 signal 1 } 
	{ W2_1_address0 sc_out sc_lv 9 signal 2 } 
	{ W2_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ W2_1_q0 sc_in sc_lv 32 signal 2 } 
	{ W2_1_address1 sc_out sc_lv 9 signal 2 } 
	{ W2_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ W2_1_q1 sc_in sc_lv 32 signal 2 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 sc_out sc_lv 8 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0 sc_out sc_logic 1 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0 sc_out sc_lv 32 signal 3 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0 sc_out sc_lv 10 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0 sc_out sc_logic 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_q0 sc_in sc_lv 1 signal 4 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0 sc_out sc_lv 10 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0 sc_out sc_logic 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_q0 sc_in sc_lv 1 signal 5 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0 sc_out sc_lv 10 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0 sc_out sc_logic 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_q0 sc_in sc_lv 1 signal 6 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0 sc_out sc_lv 10 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0 sc_out sc_logic 1 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_q0 sc_in sc_lv 1 signal 7 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0 sc_out sc_lv 10 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0 sc_out sc_logic 1 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_q0 sc_in sc_lv 1 signal 8 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0 sc_out sc_lv 10 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0 sc_out sc_logic 1 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_q0 sc_in sc_lv 1 signal 9 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0 sc_out sc_lv 10 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0 sc_out sc_logic 1 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_q0 sc_in sc_lv 1 signal 10 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0 sc_out sc_lv 10 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0 sc_out sc_logic 1 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_q0 sc_in sc_lv 1 signal 11 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 sc_out sc_lv 8 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 sc_out sc_logic 1 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0 sc_out sc_logic 1 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0 sc_out sc_lv 32 signal 12 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 sc_out sc_lv 8 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 sc_out sc_logic 1 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0 sc_out sc_logic 1 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0 sc_out sc_lv 32 signal 13 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 sc_out sc_lv 8 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 sc_out sc_logic 1 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0 sc_out sc_logic 1 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0 sc_out sc_lv 32 signal 14 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 sc_out sc_lv 8 signal 15 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 sc_out sc_logic 1 signal 15 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0 sc_out sc_logic 1 signal 15 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0 sc_out sc_lv 32 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln79", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln79", "role": "default" }} , 
 	{ "name": "W2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "W2_0", "role": "address0" }} , 
 	{ "name": "W2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W2_0", "role": "ce0" }} , 
 	{ "name": "W2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W2_0", "role": "q0" }} , 
 	{ "name": "W2_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "W2_0", "role": "address1" }} , 
 	{ "name": "W2_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W2_0", "role": "ce1" }} , 
 	{ "name": "W2_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W2_0", "role": "q1" }} , 
 	{ "name": "W2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "W2_1", "role": "address0" }} , 
 	{ "name": "W2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W2_1", "role": "ce0" }} , 
 	{ "name": "W2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W2_1", "role": "q0" }} , 
 	{ "name": "W2_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "W2_1", "role": "address1" }} , 
 	{ "name": "W2_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W2_1", "role": "ce1" }} , 
 	{ "name": "W2_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W2_1", "role": "q1" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13", "role": "q0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "role": "d0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_VITIS_LOOP_79_9_VITIS_LOOP_80_10_VITIS_LOOP_82_11 {
		mul_ln79 {Type I LastRead 0 FirstWrite -1}
		W2_0 {Type I LastRead 6 FirstWrite -1}
		W2_1 {Type I LastRead 6 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "40965", "Max" : "40965"}
	, {"Name" : "Interval", "Min" : "40964", "Max" : "40964"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln79 { ap_none {  { mul_ln79 in_data 0 15 } } }
	W2_0 { ap_memory {  { W2_0_address0 mem_address 1 9 }  { W2_0_ce0 mem_ce 1 1 }  { W2_0_q0 mem_dout 0 32 }  { W2_0_address1 MemPortADDR2 1 9 }  { W2_0_ce1 MemPortCE2 1 1 }  { W2_0_q1 MemPortDOUT2 0 32 } } }
	W2_1 { ap_memory {  { W2_1_address0 mem_address 1 9 }  { W2_1_ce0 mem_ce 1 1 }  { W2_1_q0 mem_dout 0 32 }  { W2_1_address1 MemPortADDR2 1 9 }  { W2_1_ce1 MemPortCE2 1 1 }  { W2_1_q1 MemPortDOUT2 0 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_address0 mem_address 1 10 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13_q0 mem_dout 0 1 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0 mem_din 1 32 } } }
}
