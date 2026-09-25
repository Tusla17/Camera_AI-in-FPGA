set moduleName bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3
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
set C_modelName {bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict img_0 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_1 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_2 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_3 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { MEM_WIDTH 32 MEM_SIZE 820 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ img_0 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_1 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_2 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_3 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ W1_load_1 int 32 regular  }
	{ empty_34 int 5 regular  }
	{ W1_load_2 int 32 regular  }
	{ empty_35 int 5 regular  }
	{ W1_load_3 int 32 regular  }
	{ empty_36 int 5 regular  }
	{ W1_load_4 int 32 regular  }
	{ empty_37 int 5 regular  }
	{ cmp38_1_1 int 1 regular  }
	{ W1_load_5 int 32 regular  }
	{ empty_38 int 5 regular  }
	{ W1_load_6 int 32 regular  }
	{ empty_39 int 5 regular  }
	{ W1_load_7 int 32 regular  }
	{ empty_40 int 5 regular  }
	{ W1_load_8 int 32 regular  }
	{ empty int 5 regular  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co int 32 regular {array 205 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "img_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_34", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_35", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_36", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_37", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "cmp38_1_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_38", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_39", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_40", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "W1_load_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 67
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_0_address0 sc_out sc_lv 8 signal 0 } 
	{ img_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ img_0_q0 sc_in sc_lv 32 signal 0 } 
	{ img_0_address1 sc_out sc_lv 8 signal 0 } 
	{ img_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ img_0_q1 sc_in sc_lv 32 signal 0 } 
	{ img_1_address0 sc_out sc_lv 8 signal 1 } 
	{ img_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ img_1_q0 sc_in sc_lv 32 signal 1 } 
	{ img_1_address1 sc_out sc_lv 8 signal 1 } 
	{ img_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ img_1_q1 sc_in sc_lv 32 signal 1 } 
	{ img_2_address0 sc_out sc_lv 8 signal 2 } 
	{ img_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ img_2_q0 sc_in sc_lv 32 signal 2 } 
	{ img_2_address1 sc_out sc_lv 8 signal 2 } 
	{ img_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ img_2_q1 sc_in sc_lv 32 signal 2 } 
	{ img_3_address0 sc_out sc_lv 8 signal 3 } 
	{ img_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ img_3_q0 sc_in sc_lv 32 signal 3 } 
	{ img_3_address1 sc_out sc_lv 8 signal 3 } 
	{ img_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ img_3_q1 sc_in sc_lv 32 signal 3 } 
	{ W1_load_1 sc_in sc_lv 32 signal 4 } 
	{ empty_34 sc_in sc_lv 5 signal 5 } 
	{ W1_load_2 sc_in sc_lv 32 signal 6 } 
	{ empty_35 sc_in sc_lv 5 signal 7 } 
	{ W1_load_3 sc_in sc_lv 32 signal 8 } 
	{ empty_36 sc_in sc_lv 5 signal 9 } 
	{ W1_load_4 sc_in sc_lv 32 signal 10 } 
	{ empty_37 sc_in sc_lv 5 signal 11 } 
	{ cmp38_1_1 sc_in sc_lv 1 signal 12 } 
	{ W1_load_5 sc_in sc_lv 32 signal 13 } 
	{ empty_38 sc_in sc_lv 5 signal 14 } 
	{ W1_load_6 sc_in sc_lv 32 signal 15 } 
	{ empty_39 sc_in sc_lv 5 signal 16 } 
	{ W1_load_7 sc_in sc_lv 32 signal 17 } 
	{ empty_40 sc_in sc_lv 5 signal 18 } 
	{ W1_load_8 sc_in sc_lv 32 signal 19 } 
	{ empty sc_in sc_lv 5 signal 20 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 sc_out sc_lv 8 signal 21 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 sc_out sc_logic 1 signal 21 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0 sc_out sc_logic 1 signal 21 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0 sc_out sc_lv 32 signal 21 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 sc_out sc_lv 8 signal 22 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 sc_out sc_logic 1 signal 22 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0 sc_out sc_logic 1 signal 22 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0 sc_out sc_lv 32 signal 22 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 sc_out sc_lv 8 signal 23 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 sc_out sc_logic 1 signal 23 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0 sc_out sc_logic 1 signal 23 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0 sc_out sc_lv 32 signal 23 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 sc_out sc_lv 8 signal 24 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 sc_out sc_logic 1 signal 24 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0 sc_out sc_logic 1 signal 24 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0 sc_out sc_lv 32 signal 24 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 sc_out sc_lv 8 signal 25 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 sc_out sc_logic 1 signal 25 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0 sc_out sc_logic 1 signal 25 } 
	{ bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0 sc_out sc_lv 32 signal 25 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "img_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_0", "role": "address0" }} , 
 	{ "name": "img_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "ce0" }} , 
 	{ "name": "img_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_0", "role": "q0" }} , 
 	{ "name": "img_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_0", "role": "address1" }} , 
 	{ "name": "img_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "ce1" }} , 
 	{ "name": "img_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_0", "role": "q1" }} , 
 	{ "name": "img_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_1", "role": "address0" }} , 
 	{ "name": "img_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "ce0" }} , 
 	{ "name": "img_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_1", "role": "q0" }} , 
 	{ "name": "img_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_1", "role": "address1" }} , 
 	{ "name": "img_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "ce1" }} , 
 	{ "name": "img_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_1", "role": "q1" }} , 
 	{ "name": "img_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_2", "role": "address0" }} , 
 	{ "name": "img_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_2", "role": "ce0" }} , 
 	{ "name": "img_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_2", "role": "q0" }} , 
 	{ "name": "img_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_2", "role": "address1" }} , 
 	{ "name": "img_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_2", "role": "ce1" }} , 
 	{ "name": "img_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_2", "role": "q1" }} , 
 	{ "name": "img_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_3", "role": "address0" }} , 
 	{ "name": "img_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_3", "role": "ce0" }} , 
 	{ "name": "img_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_3", "role": "q0" }} , 
 	{ "name": "img_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_3", "role": "address1" }} , 
 	{ "name": "img_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_3", "role": "ce1" }} , 
 	{ "name": "img_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "img_3", "role": "q1" }} , 
 	{ "name": "W1_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_1", "role": "default" }} , 
 	{ "name": "empty_34", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_34", "role": "default" }} , 
 	{ "name": "W1_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_2", "role": "default" }} , 
 	{ "name": "empty_35", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_35", "role": "default" }} , 
 	{ "name": "W1_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_3", "role": "default" }} , 
 	{ "name": "empty_36", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_36", "role": "default" }} , 
 	{ "name": "W1_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_4", "role": "default" }} , 
 	{ "name": "empty_37", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_37", "role": "default" }} , 
 	{ "name": "cmp38_1_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp38_1_1", "role": "default" }} , 
 	{ "name": "W1_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_5", "role": "default" }} , 
 	{ "name": "empty_38", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_38", "role": "default" }} , 
 	{ "name": "W1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_6", "role": "default" }} , 
 	{ "name": "empty_39", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_39", "role": "default" }} , 
 	{ "name": "W1_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_7", "role": "default" }} , 
 	{ "name": "empty_40", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty_40", "role": "default" }} , 
 	{ "name": "W1_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1_load_8", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "address0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "ce0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "we0" }} , 
 	{ "name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4", "role": "d0" }} , 
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
	bnn_top_Pipeline_VITIS_LOOP_50_2_VITIS_LOOP_51_3 {
		img_0 {Type I LastRead 9 FirstWrite -1}
		img_1 {Type I LastRead 9 FirstWrite -1}
		img_2 {Type I LastRead 9 FirstWrite -1}
		img_3 {Type I LastRead 9 FirstWrite -1}
		W1_load_1 {Type I LastRead 0 FirstWrite -1}
		empty_34 {Type I LastRead 0 FirstWrite -1}
		W1_load_2 {Type I LastRead 0 FirstWrite -1}
		empty_35 {Type I LastRead 0 FirstWrite -1}
		W1_load_3 {Type I LastRead 0 FirstWrite -1}
		empty_36 {Type I LastRead 0 FirstWrite -1}
		W1_load_4 {Type I LastRead 0 FirstWrite -1}
		empty_37 {Type I LastRead 0 FirstWrite -1}
		cmp38_1_1 {Type I LastRead 0 FirstWrite -1}
		W1_load_5 {Type I LastRead 0 FirstWrite -1}
		empty_38 {Type I LastRead 0 FirstWrite -1}
		W1_load_6 {Type I LastRead 0 FirstWrite -1}
		empty_39 {Type I LastRead 0 FirstWrite -1}
		W1_load_7 {Type I LastRead 0 FirstWrite -1}
		empty_40 {Type I LastRead 0 FirstWrite -1}
		W1_load_8 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type O LastRead -1 FirstWrite 10}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type O LastRead -1 FirstWrite 10}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type O LastRead -1 FirstWrite 10}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type O LastRead -1 FirstWrite 10}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2058", "Max" : "2058"}
	, {"Name" : "Interval", "Min" : "2050", "Max" : "2050"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	img_0 { ap_memory {  { img_0_address0 mem_address 1 8 }  { img_0_ce0 mem_ce 1 1 }  { img_0_q0 mem_dout 0 32 }  { img_0_address1 MemPortADDR2 1 8 }  { img_0_ce1 MemPortCE2 1 1 }  { img_0_q1 MemPortDOUT2 0 32 } } }
	img_1 { ap_memory {  { img_1_address0 mem_address 1 8 }  { img_1_ce0 mem_ce 1 1 }  { img_1_q0 mem_dout 0 32 }  { img_1_address1 MemPortADDR2 1 8 }  { img_1_ce1 MemPortCE2 1 1 }  { img_1_q1 MemPortDOUT2 0 32 } } }
	img_2 { ap_memory {  { img_2_address0 mem_address 1 8 }  { img_2_ce0 mem_ce 1 1 }  { img_2_q0 mem_dout 0 32 }  { img_2_address1 MemPortADDR2 1 8 }  { img_2_ce1 MemPortCE2 1 1 }  { img_2_q1 MemPortDOUT2 0 32 } } }
	img_3 { ap_memory {  { img_3_address0 mem_address 1 8 }  { img_3_ce0 mem_ce 1 1 }  { img_3_q0 mem_dout 0 32 }  { img_3_address1 MemPortADDR2 1 8 }  { img_3_ce1 MemPortCE2 1 1 }  { img_3_q1 MemPortDOUT2 0 32 } } }
	W1_load_1 { ap_none {  { W1_load_1 in_data 0 32 } } }
	empty_34 { ap_none {  { empty_34 in_data 0 5 } } }
	W1_load_2 { ap_none {  { W1_load_2 in_data 0 32 } } }
	empty_35 { ap_none {  { empty_35 in_data 0 5 } } }
	W1_load_3 { ap_none {  { W1_load_3 in_data 0 32 } } }
	empty_36 { ap_none {  { empty_36 in_data 0 5 } } }
	W1_load_4 { ap_none {  { W1_load_4 in_data 0 32 } } }
	empty_37 { ap_none {  { empty_37 in_data 0 5 } } }
	cmp38_1_1 { ap_none {  { cmp38_1_1 in_data 0 1 } } }
	W1_load_5 { ap_none {  { W1_load_5 in_data 0 32 } } }
	empty_38 { ap_none {  { empty_38 in_data 0 5 } } }
	W1_load_6 { ap_none {  { W1_load_6 in_data 0 32 } } }
	empty_39 { ap_none {  { empty_39 in_data 0 5 } } }
	W1_load_7 { ap_none {  { W1_load_7 in_data 0 32 } } }
	empty_40 { ap_none {  { empty_40 in_data 0 5 } } }
	W1_load_8 { ap_none {  { W1_load_8 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 5 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1_d0 mem_din 1 32 } } }
	bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co { ap_memory {  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_address0 mem_address 1 8 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_ce0 mem_ce 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_we0 mem_we 1 1 }  { bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_d0 mem_din 1 32 } } }
}
