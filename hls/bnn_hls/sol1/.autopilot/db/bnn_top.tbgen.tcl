set moduleName bnn_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set C_modelName {bnn_top}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict img_0 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_1 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_2 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict img_3 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W1 { MEM_WIDTH 32 MEM_SIZE 36 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict TAU1 { MEM_WIDTH 32 MEM_SIZE 128 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W2_0 { MEM_WIDTH 32 MEM_SIZE 1152 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W2_1 { MEM_WIDTH 32 MEM_SIZE 1152 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict TAU2 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W3_0 { MEM_WIDTH 32 MEM_SIZE 2304 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict W3_1 { MEM_WIDTH 32 MEM_SIZE 2304 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict TAU3 { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict WF1 { MEM_WIDTH 32 MEM_SIZE 16384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict TAUF1 { MEM_WIDTH 32 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict WF2 { MEM_WIDTH 32 MEM_SIZE 1024 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BF2 { MEM_WIDTH 32 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ img_0 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_1 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_2 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ img_3 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ W1 int 32 regular {array 9 { 1 1 } 1 1 }  }
	{ TAU1 int 32 regular {array 32 { 1 3 } 1 1 }  }
	{ W2_0 int 32 regular {array 288 { 1 1 } 1 1 }  }
	{ W2_1 int 32 regular {array 288 { 1 1 } 1 1 }  }
	{ TAU2 int 32 regular {array 64 { 1 3 } 1 1 }  }
	{ W3_0 int 32 regular {array 576 { 1 1 } 1 1 }  }
	{ W3_1 int 32 regular {array 576 { 1 1 } 1 1 }  }
	{ TAU3 int 32 regular {array 64 { 1 3 } 1 1 }  }
	{ WF1 int 32 regular {array 4096 { 1 3 } 1 1 }  }
	{ TAUF1 int 32 regular {array 128 { 1 3 } 1 1 }  }
	{ WF2 int 32 regular {array 256 { 1 1 } 1 1 }  }
	{ BF2 int 32 regular {array 2 { 1 1 } 1 1 }  }
	{ logit0 int 32 regular {pointer 1}  }
	{ logit1 int 32 regular {pointer 1}  }
	{ pred_r int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "img_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "img_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "TAU1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "TAU2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W3_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "W3_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "TAU3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "WF1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "TAUF1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "WF2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "BF2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "logit0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logit1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pred_r", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 93
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
	{ W1_address0 sc_out sc_lv 4 signal 4 } 
	{ W1_ce0 sc_out sc_logic 1 signal 4 } 
	{ W1_q0 sc_in sc_lv 32 signal 4 } 
	{ W1_address1 sc_out sc_lv 4 signal 4 } 
	{ W1_ce1 sc_out sc_logic 1 signal 4 } 
	{ W1_q1 sc_in sc_lv 32 signal 4 } 
	{ TAU1_address0 sc_out sc_lv 5 signal 5 } 
	{ TAU1_ce0 sc_out sc_logic 1 signal 5 } 
	{ TAU1_q0 sc_in sc_lv 32 signal 5 } 
	{ W2_0_address0 sc_out sc_lv 9 signal 6 } 
	{ W2_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ W2_0_q0 sc_in sc_lv 32 signal 6 } 
	{ W2_0_address1 sc_out sc_lv 9 signal 6 } 
	{ W2_0_ce1 sc_out sc_logic 1 signal 6 } 
	{ W2_0_q1 sc_in sc_lv 32 signal 6 } 
	{ W2_1_address0 sc_out sc_lv 9 signal 7 } 
	{ W2_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ W2_1_q0 sc_in sc_lv 32 signal 7 } 
	{ W2_1_address1 sc_out sc_lv 9 signal 7 } 
	{ W2_1_ce1 sc_out sc_logic 1 signal 7 } 
	{ W2_1_q1 sc_in sc_lv 32 signal 7 } 
	{ TAU2_address0 sc_out sc_lv 6 signal 8 } 
	{ TAU2_ce0 sc_out sc_logic 1 signal 8 } 
	{ TAU2_q0 sc_in sc_lv 32 signal 8 } 
	{ W3_0_address0 sc_out sc_lv 10 signal 9 } 
	{ W3_0_ce0 sc_out sc_logic 1 signal 9 } 
	{ W3_0_q0 sc_in sc_lv 32 signal 9 } 
	{ W3_0_address1 sc_out sc_lv 10 signal 9 } 
	{ W3_0_ce1 sc_out sc_logic 1 signal 9 } 
	{ W3_0_q1 sc_in sc_lv 32 signal 9 } 
	{ W3_1_address0 sc_out sc_lv 10 signal 10 } 
	{ W3_1_ce0 sc_out sc_logic 1 signal 10 } 
	{ W3_1_q0 sc_in sc_lv 32 signal 10 } 
	{ W3_1_address1 sc_out sc_lv 10 signal 10 } 
	{ W3_1_ce1 sc_out sc_logic 1 signal 10 } 
	{ W3_1_q1 sc_in sc_lv 32 signal 10 } 
	{ TAU3_address0 sc_out sc_lv 6 signal 11 } 
	{ TAU3_ce0 sc_out sc_logic 1 signal 11 } 
	{ TAU3_q0 sc_in sc_lv 32 signal 11 } 
	{ WF1_address0 sc_out sc_lv 12 signal 12 } 
	{ WF1_ce0 sc_out sc_logic 1 signal 12 } 
	{ WF1_q0 sc_in sc_lv 32 signal 12 } 
	{ TAUF1_address0 sc_out sc_lv 7 signal 13 } 
	{ TAUF1_ce0 sc_out sc_logic 1 signal 13 } 
	{ TAUF1_q0 sc_in sc_lv 32 signal 13 } 
	{ WF2_address0 sc_out sc_lv 8 signal 14 } 
	{ WF2_ce0 sc_out sc_logic 1 signal 14 } 
	{ WF2_q0 sc_in sc_lv 32 signal 14 } 
	{ WF2_address1 sc_out sc_lv 8 signal 14 } 
	{ WF2_ce1 sc_out sc_logic 1 signal 14 } 
	{ WF2_q1 sc_in sc_lv 32 signal 14 } 
	{ BF2_address0 sc_out sc_lv 1 signal 15 } 
	{ BF2_ce0 sc_out sc_logic 1 signal 15 } 
	{ BF2_q0 sc_in sc_lv 32 signal 15 } 
	{ BF2_address1 sc_out sc_lv 1 signal 15 } 
	{ BF2_ce1 sc_out sc_logic 1 signal 15 } 
	{ BF2_q1 sc_in sc_lv 32 signal 15 } 
	{ logit0 sc_out sc_lv 32 signal 16 } 
	{ logit0_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ logit1 sc_out sc_lv 32 signal 17 } 
	{ logit1_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ pred_r sc_out sc_lv 32 signal 18 } 
	{ pred_r_ap_vld sc_out sc_logic 1 outvld 18 } 
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
 	{ "name": "W1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "W1", "role": "address0" }} , 
 	{ "name": "W1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W1", "role": "ce0" }} , 
 	{ "name": "W1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1", "role": "q0" }} , 
 	{ "name": "W1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "W1", "role": "address1" }} , 
 	{ "name": "W1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W1", "role": "ce1" }} , 
 	{ "name": "W1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W1", "role": "q1" }} , 
 	{ "name": "TAU1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "TAU1", "role": "address0" }} , 
 	{ "name": "TAU1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "TAU1", "role": "ce0" }} , 
 	{ "name": "TAU1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAU1", "role": "q0" }} , 
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
 	{ "name": "TAU2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "TAU2", "role": "address0" }} , 
 	{ "name": "TAU2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "TAU2", "role": "ce0" }} , 
 	{ "name": "TAU2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAU2", "role": "q0" }} , 
 	{ "name": "W3_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "W3_0", "role": "address0" }} , 
 	{ "name": "W3_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W3_0", "role": "ce0" }} , 
 	{ "name": "W3_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W3_0", "role": "q0" }} , 
 	{ "name": "W3_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "W3_0", "role": "address1" }} , 
 	{ "name": "W3_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W3_0", "role": "ce1" }} , 
 	{ "name": "W3_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W3_0", "role": "q1" }} , 
 	{ "name": "W3_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "W3_1", "role": "address0" }} , 
 	{ "name": "W3_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W3_1", "role": "ce0" }} , 
 	{ "name": "W3_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W3_1", "role": "q0" }} , 
 	{ "name": "W3_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "W3_1", "role": "address1" }} , 
 	{ "name": "W3_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "W3_1", "role": "ce1" }} , 
 	{ "name": "W3_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "W3_1", "role": "q1" }} , 
 	{ "name": "TAU3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "TAU3", "role": "address0" }} , 
 	{ "name": "TAU3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "TAU3", "role": "ce0" }} , 
 	{ "name": "TAU3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAU3", "role": "q0" }} , 
 	{ "name": "WF1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "WF1", "role": "address0" }} , 
 	{ "name": "WF1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF1", "role": "ce0" }} , 
 	{ "name": "WF1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF1", "role": "q0" }} , 
 	{ "name": "TAUF1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "TAUF1", "role": "address0" }} , 
 	{ "name": "TAUF1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "TAUF1", "role": "ce0" }} , 
 	{ "name": "TAUF1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "TAUF1", "role": "q0" }} , 
 	{ "name": "WF2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "WF2", "role": "address0" }} , 
 	{ "name": "WF2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF2", "role": "ce0" }} , 
 	{ "name": "WF2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF2", "role": "q0" }} , 
 	{ "name": "WF2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "WF2", "role": "address1" }} , 
 	{ "name": "WF2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "WF2", "role": "ce1" }} , 
 	{ "name": "WF2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "WF2", "role": "q1" }} , 
 	{ "name": "BF2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BF2", "role": "address0" }} , 
 	{ "name": "BF2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BF2", "role": "ce0" }} , 
 	{ "name": "BF2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BF2", "role": "q0" }} , 
 	{ "name": "BF2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BF2", "role": "address1" }} , 
 	{ "name": "BF2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BF2", "role": "ce1" }} , 
 	{ "name": "BF2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BF2", "role": "q1" }} , 
 	{ "name": "logit0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logit0", "role": "default" }} , 
 	{ "name": "logit0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logit0", "role": "ap_vld" }} , 
 	{ "name": "logit1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logit1", "role": "default" }} , 
 	{ "name": "logit1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logit1", "role": "ap_vld" }} , 
 	{ "name": "pred_r", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pred_r", "role": "default" }} , 
 	{ "name": "pred_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pred_r", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top {
		img_0 {Type I LastRead 9 FirstWrite -1}
		img_1 {Type I LastRead 9 FirstWrite -1}
		img_2 {Type I LastRead 9 FirstWrite -1}
		img_3 {Type I LastRead 9 FirstWrite -1}
		W1 {Type I LastRead 6 FirstWrite -1}
		TAU1 {Type I LastRead 7 FirstWrite -1}
		W2_0 {Type I LastRead 6 FirstWrite -1}
		W2_1 {Type I LastRead 6 FirstWrite -1}
		TAU2 {Type I LastRead 3 FirstWrite -1}
		W3_0 {Type I LastRead 6 FirstWrite -1}
		W3_1 {Type I LastRead 6 FirstWrite -1}
		TAU3 {Type I LastRead 4 FirstWrite -1}
		WF1 {Type I LastRead 1 FirstWrite -1}
		TAUF1 {Type I LastRead 1 FirstWrite -1}
		WF2 {Type I LastRead 1 FirstWrite -1}
		BF2 {Type I LastRead 5 FirstWrite -1}
		logit0 {Type O LastRead -1 FirstWrite 7}
		logit1 {Type O LastRead -1 FirstWrite 7}
		pred_r {Type O LastRead -1 FirstWrite 7}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_20 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_19 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_18 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_17 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_16 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_15 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_14 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8 {Type IO LastRead -1 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7 {Type IO LastRead -1 FirstWrite -1}
		f1 {Type IO LastRead -1 FirstWrite -1}
		l3 {Type IO LastRead -1 FirstWrite -1}}
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
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type O LastRead -1 FirstWrite 10}}
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
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_13 {Type O LastRead -1 FirstWrite 13}}
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
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type O LastRead -1 FirstWrite 9}}
	bnn_top_Pipeline_VITIS_LOOP_96_14_VITIS_LOOP_97_15 {
		shl_ln2 {Type I LastRead 0 FirstWrite -1}
		sext_ln104 {Type I LastRead 0 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8 {Type O LastRead -1 FirstWrite 11}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7 {Type O LastRead -1 FirstWrite 11}}
	bnn_top_Pipeline_VITIS_LOOP_110_17_VITIS_LOOP_111_18_VITIS_LOOP_113_19 {
		mul_ln110 {Type I LastRead 0 FirstWrite -1}
		W3_0 {Type I LastRead 6 FirstWrite -1}
		W3_1 {Type I LastRead 6 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_12 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_6 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_5 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_11 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_10 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_9 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_8 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_7 {Type I LastRead 8 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type O LastRead -1 FirstWrite 9}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type O LastRead -1 FirstWrite 9}}
	bnn_top_Pipeline_VITIS_LOOP_140_24_VITIS_LOOP_142_25 {
		WF1 {Type I LastRead 1 FirstWrite -1}
		TAUF1 {Type I LastRead 1 FirstWrite -1}
		f1 {Type O LastRead -1 FirstWrite 2}
		l3 {Type I LastRead 1 FirstWrite -1}}
	bnn_top_Pipeline_VITIS_LOOP_127_22_VITIS_LOOP_128_23 {
		sext_ln135 {Type I LastRead 0 FirstWrite -1}
		oc_2 {Type I LastRead 0 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_4 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_3 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_2 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co_1 {Type I LastRead 11 FirstWrite -1}
		bnn_top_int_const_unsigned_int_const_int_const_unsigned_int_const_int_co {Type I LastRead 11 FirstWrite -1}
		l3 {Type O LastRead -1 FirstWrite 11}}
	bnn_top_Pipeline_VITIS_LOOP_153_26 {
		sext_ln152_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln152 {Type I LastRead 0 FirstWrite -1}
		WF2 {Type I LastRead 1 FirstWrite -1}
		a1_1_out {Type O LastRead -1 FirstWrite 0}
		a0_1_out {Type O LastRead -1 FirstWrite 0}
		f1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4145963", "Max" : "4145963"}
	, {"Name" : "Interval", "Min" : "4145964", "Max" : "4145964"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	img_0 { ap_memory {  { img_0_address0 mem_address 1 8 }  { img_0_ce0 mem_ce 1 1 }  { img_0_q0 mem_dout 0 32 }  { img_0_address1 MemPortADDR2 1 8 }  { img_0_ce1 MemPortCE2 1 1 }  { img_0_q1 MemPortDOUT2 0 32 } } }
	img_1 { ap_memory {  { img_1_address0 mem_address 1 8 }  { img_1_ce0 mem_ce 1 1 }  { img_1_q0 mem_dout 0 32 }  { img_1_address1 MemPortADDR2 1 8 }  { img_1_ce1 MemPortCE2 1 1 }  { img_1_q1 MemPortDOUT2 0 32 } } }
	img_2 { ap_memory {  { img_2_address0 mem_address 1 8 }  { img_2_ce0 mem_ce 1 1 }  { img_2_q0 mem_dout 0 32 }  { img_2_address1 MemPortADDR2 1 8 }  { img_2_ce1 MemPortCE2 1 1 }  { img_2_q1 MemPortDOUT2 0 32 } } }
	img_3 { ap_memory {  { img_3_address0 mem_address 1 8 }  { img_3_ce0 mem_ce 1 1 }  { img_3_q0 mem_dout 0 32 }  { img_3_address1 MemPortADDR2 1 8 }  { img_3_ce1 MemPortCE2 1 1 }  { img_3_q1 MemPortDOUT2 0 32 } } }
	W1 { ap_memory {  { W1_address0 mem_address 1 4 }  { W1_ce0 mem_ce 1 1 }  { W1_q0 mem_dout 0 32 }  { W1_address1 MemPortADDR2 1 4 }  { W1_ce1 MemPortCE2 1 1 }  { W1_q1 MemPortDOUT2 0 32 } } }
	TAU1 { ap_memory {  { TAU1_address0 mem_address 1 5 }  { TAU1_ce0 mem_ce 1 1 }  { TAU1_q0 mem_dout 0 32 } } }
	W2_0 { ap_memory {  { W2_0_address0 mem_address 1 9 }  { W2_0_ce0 mem_ce 1 1 }  { W2_0_q0 mem_dout 0 32 }  { W2_0_address1 MemPortADDR2 1 9 }  { W2_0_ce1 MemPortCE2 1 1 }  { W2_0_q1 MemPortDOUT2 0 32 } } }
	W2_1 { ap_memory {  { W2_1_address0 mem_address 1 9 }  { W2_1_ce0 mem_ce 1 1 }  { W2_1_q0 mem_dout 0 32 }  { W2_1_address1 MemPortADDR2 1 9 }  { W2_1_ce1 MemPortCE2 1 1 }  { W2_1_q1 MemPortDOUT2 0 32 } } }
	TAU2 { ap_memory {  { TAU2_address0 mem_address 1 6 }  { TAU2_ce0 mem_ce 1 1 }  { TAU2_q0 mem_dout 0 32 } } }
	W3_0 { ap_memory {  { W3_0_address0 mem_address 1 10 }  { W3_0_ce0 mem_ce 1 1 }  { W3_0_q0 mem_dout 0 32 }  { W3_0_address1 MemPortADDR2 1 10 }  { W3_0_ce1 MemPortCE2 1 1 }  { W3_0_q1 MemPortDOUT2 0 32 } } }
	W3_1 { ap_memory {  { W3_1_address0 mem_address 1 10 }  { W3_1_ce0 mem_ce 1 1 }  { W3_1_q0 mem_dout 0 32 }  { W3_1_address1 MemPortADDR2 1 10 }  { W3_1_ce1 MemPortCE2 1 1 }  { W3_1_q1 MemPortDOUT2 0 32 } } }
	TAU3 { ap_memory {  { TAU3_address0 mem_address 1 6 }  { TAU3_ce0 mem_ce 1 1 }  { TAU3_q0 mem_dout 0 32 } } }
	WF1 { ap_memory {  { WF1_address0 mem_address 1 12 }  { WF1_ce0 mem_ce 1 1 }  { WF1_q0 mem_dout 0 32 } } }
	TAUF1 { ap_memory {  { TAUF1_address0 mem_address 1 7 }  { TAUF1_ce0 mem_ce 1 1 }  { TAUF1_q0 mem_dout 0 32 } } }
	WF2 { ap_memory {  { WF2_address0 mem_address 1 8 }  { WF2_ce0 mem_ce 1 1 }  { WF2_q0 mem_dout 0 32 }  { WF2_address1 MemPortADDR2 1 8 }  { WF2_ce1 MemPortCE2 1 1 }  { WF2_q1 MemPortDOUT2 0 32 } } }
	BF2 { ap_memory {  { BF2_address0 mem_address 1 1 }  { BF2_ce0 mem_ce 1 1 }  { BF2_q0 mem_dout 0 32 }  { BF2_address1 MemPortADDR2 1 1 }  { BF2_ce1 MemPortCE2 1 1 }  { BF2_q1 MemPortDOUT2 0 32 } } }
	logit0 { ap_vld {  { logit0 out_data 1 32 }  { logit0_ap_vld out_vld 1 1 } } }
	logit1 { ap_vld {  { logit1 out_data 1 32 }  { logit1_ap_vld out_vld 1 1 } } }
	pred_r { ap_vld {  { pred_r out_data 1 32 }  { pred_r_ap_vld out_vld 1 1 } } }
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
