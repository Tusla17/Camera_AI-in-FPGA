connect
targets
targets -set -nocase -filter {name =~ "*A53*#0*"}
puts "=== Cortex-A53 State ==="
catch { puts [state] }
catch { puts "PC = [rrd pc]" }
catch { puts "Backtrace: [bt]" }
puts "=== Checking AXI Peripherals ==="
catch { puts [format "BNN MAGIC (0x800A0014) = 0x%08X" [mrd -value -force 0x800A0014]] }
catch { puts [format "VPHY Base (0x80080000) = 0x%08X" [mrd -value -force 0x80080000]] }
catch { puts [format "TPG GPIO  (0x80060000) = 0x%08X" [mrd -value -force 0x80060000]] }
catch { puts [format "TPG Core  (0x80070000) = 0x%08X" [mrd -value -force 0x80070000]] }
disconnect
exit
