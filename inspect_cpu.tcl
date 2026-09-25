connect
targets -set -nocase -filter {name =~ "*A53*#0*"}
puts "CPU STATE: [state]"
catch { puts "PC: [rrd pc]" }
catch { puts "ESR_EL3: [rrd esr_el3]" }
catch { puts "FAR_EL3: [rrd far_el3]" }
catch { puts "ESR_EL1: [rrd esr_el1]" }
catch { puts "FAR_EL1: [rrd far_el1]" }
targets -set -nocase -filter {name =~ "*PSU*"}
configparams force-mem-accesses 1
catch { puts "READ 0x800A0014: [mrd -value -force 0x800A0014]" }
catch { puts "READ 0x80080000: [mrd -value -force 0x80080000]" }
catch { puts "READ 0x80060000: [mrd -value -force 0x80060000]" }
catch { puts "READ 0x80070000: [mrd -value -force 0x80070000]" }
exit
