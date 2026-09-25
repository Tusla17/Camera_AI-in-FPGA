connect
targets -set -nocase -filter {name =~ "*PSU*"}
puts "--- Reading BNN MAGIC at 0x800A0014 ---"
catch { puts [mrd -force 0x800A0014] } err1
puts "Result: $err1"

puts "--- Reading IIC at 0x80090000 ---"
catch { puts [mrd -force 0x80090000] } err2
puts "Result: $err2"

puts "--- Reading DDR 0x01000000 ---"
catch { puts [mrd -force 0x01000000 8] } err3
puts "Result: $err3"
exit
