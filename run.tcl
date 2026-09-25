# ==============================================================================
# Secure Camera AI: Driver Drowsiness Detection System on AMD ZCU106
# Unified TCL Automation Script
# ==============================================================================
# Commands:
#   vivado -mode batch -source run.tcl -tclargs sim     # Run full RTL simulation
#   vivado -mode batch -source run.tcl -tclargs build   # Build hardware Block Design
#   xsdb run.tcl deploy                                 # Deploy & verify on ZCU106 via JTAG
#   xsdb run.tcl dump                                   # Dump 1280x720 Framebuffer from DDR
# ==============================================================================

set cmd [lindex $argv 0]
if {$cmd == ""} {
    set cmd "sim"
}

if {$cmd == "sim"} {
    puts "================================================================"
    puts "=== Launching Vivado RTL Batch Simulation (TRNG + ASCON + BNN) ==="
    puts "================================================================"
    source "run_sim.tcl"
} elseif {$cmd == "build"} {
    puts "================================================================"
    puts "=== Building Vivado Block Design for AMD ZCU106 ==="
    puts "================================================================"
    source "create_bd.tcl"
} elseif {$cmd == "deploy"} {
    puts "================================================================"
    puts "=== Deploying Bitstream & Bare-metal App to ZCU106 via JTAG ==="
    puts "================================================================"
    source "run_zcu106.tcl"
} elseif {$cmd == "dump"} {
    puts "================================================================"
    puts "=== Extracting Live 720p Framebuffer (0x10000000) from ZCU106 ==="
    puts "================================================================"
    source "get_dashboard.tcl"
} else {
    puts "Unknown command: $cmd"
    puts "Available commands: sim, build, deploy, dump"
}
