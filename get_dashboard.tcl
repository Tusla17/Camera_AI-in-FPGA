# Script trich xuat Framebuffer 1280x720 tu RAM DDR4 cua ZCU106 qua JTAG
connect
targets -set -nocase -filter {name =~ "*PSU*"}

puts "=== Dang trich xuat Framebuffer tu DDR 0x10000000 (1280x720 ARGB)... ==="
mrd -bin -file "D:/CodeWSL/Camera_AI/fb_dump.bin" 0x10000000 921600
puts "=== Da luu thanh cong file fb_dump.bin (3.68 MB)! ==="
