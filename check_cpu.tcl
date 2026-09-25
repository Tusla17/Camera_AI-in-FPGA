connect
targets -set -nocase -filter {name =~ "*Cortex-A53 #0*"}
catch {stop}
puts "=== TRANG THAI CPU CORTEX-A53 #0: ==="
puts [state]
puts "PC register:"
puts [rrd pc]
puts "Stack Backtrace:"
catch {puts [bt]}
con
