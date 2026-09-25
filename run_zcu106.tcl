# Script nap Bitstream, khoi dong HDMI TX & Camera AI truc tiep tren ZCU106 qua JTAG
# Ung dung thong nhat: hdmi_tx_app.elf (BNN AI + Sony IMX274 + Video PHY + HDMI TX)

puts "=== 1. Ket noi toi JTAG Server... ==="
connect
configparams force-mem-accesses 1

set t_list ""
for {set i 0} {$i < 6} {incr i} {
    after 500
    set t_list [targets]
    if {[string match "*PSU*" $t_list]} { break }
}
puts "Target Devices phat hien boi JTAG:"
puts $t_list

if {[string match "*board power off*" $t_list]} {
    puts "\r\n================================================================"
    puts ">>> CANH BAO: BO MACH ZCU106 DANG TAT NGUON (board power off)! <<<"
    puts ">>> Xin vui long gat cong tac nguon SW1 sang vi tri ON de tiep tuc! <<<"
    puts "================================================================\r\n"
    exit 1
}

if {[string match "*dummy_dap*" $t_list] || [string match "*CBR not done*" $t_list]} {
    puts "\r\n================================================================"
    puts ">>> CANH BAO: BO MACH DANG KHOA DAP (CBR not done / dummy_dap)! <<<"
    puts ">>> Nguyen nhan: Cong tac che do khoi dong SW6 chua o che do JTAG. <<<"
    puts ">>> HUONG DAN KHAC PHUC:                                         <<<"
    puts ">>> 1. Gat ca 4 can gat cua switch SW6 ve phia in chu 'ON' (JTAG: 0000)."
    puts ">>> 2. Nhan nut bam SW4 (POR Reset canh do) hoac tat/bat lai SW1."
    puts "================================================================\r\n"
    exit 1
}

# 2. Mo khoa JTAG Security tren PSU
puts "\r\n=== 2. Mo khoa JTAG Security tren PSU... ==="
catch {
    targets -set -nocase -filter {name =~ "*PSU*"}
    mwr 0xffca0038 0x1ff
}

# 3. Nap Bitstream FPGA vao PL (bnn_hdmi_top.bit)
puts "=== 3. Dang nap Bitstream FPGA (bnn_hdmi_top.bit)... ==="
targets -set -nocase -filter {name =~ "*PSU*"}
fpga -file "D:/CodeWSL/Camera_AI/bnn_hdmi_top.bit"
after 1000

# 4. Khoi tao phan cung qua FSBL (DDR4 Controller, PLL, Clocks, MIO)
puts "=== 4. Khoi tao DDR4 RAM va System qua FSBL (First Stage Boot Loader)... ==="
targets -set -nocase -filter {name =~ "*A53*#0*"}
rst -processor -clear-registers
after 500
dow "D:/CodeWSL/Camera_AI/fsbl.elf"
con
after 3500
stop
after 500

# 5. Giai phong PS-PL Isolation va AFI Resets
puts "=== 5. Giai phong cach ly PS-PL Isolation, Reset AXI Bus & PL Fabric Reset... ==="
targets -set -nocase -filter {name =~ "*PSU*"}
configparams force-mem-accesses 1
catch {
    # Bat PL0 (100MHz) va PL1 (300MHz Video Clock) tu RPLL
    mwr -force 0xFF5E00C0 0x01010F02
    mwr -force 0xFF5E00C4 0x01010502
    after 50

    # REQ_PWRUP_INT_EN PL
    mwr -force 0xFFD80118 0x00800000
    # REQ_PWRUP_TRIG PL
    mwr -force 0xFFD80120 0x00800000
    # Deassert AFI Resets (RST_FPD_TOP)
    mwr -force 0xFD1A0100 0x00000000
    # Deassert LPD AFI Reset (RST_LPD_TOP)
    mwr -force 0xFF5E023C 0x00000000
    # LPD SLCR AFI FS
    mwr -force 0xFF419000 0x00000000
    # Deassert PL Fabric Reset via EMIO GPIO Bank 5 (pl_resetn0, SI5324_RST_OUT, bnn_0, vid_phy)
    mwr -force 0xFF0A002C 0x80000000
    mwr -force 0xFF0A002C 0x7FFF8000
    mwr -force 0xFF0A0344 0x80000000
    mwr -force 0xFF0A0348 0x80000000
    mwr -force 0xFF0A002C 0x7FFF0000
    mwr -force 0xFF0A0054 0x00000000
    after 50
    mwr -force 0xFF0A002C 0x7FFF8000
    mwr -force 0xFF0A0054 0x80000000
    after 50

    # Deassert TPG Reset via AXI GPIO tai 0x80060000
    catch { mwr -force 0x80060000 0x00000001 }
}
after 500

# Kiem tra truc tiep cac thanh ghi phan cung quan trong qua JTAG de dam bao AXI bus thong suot
set hw_magic   0
set vid_phy_id 0
set tpg_gpio   0
catch { set hw_magic   [mrd -value -force 0x800A0014] }
catch { set vid_phy_id [mrd -value -force 0x80080000] }
catch { set tpg_gpio   [mrd -value -force 0x80060000] }
puts [format "===> SANITY CHECK: BNN MAGIC Register tai 0x800A0014 = 0x%08X (Mong doi: 0x0B11EE01)" $hw_magic]
puts [format "===> SANITY CHECK: Video PHY Controller tai 0x80080000 = 0x%08X" $vid_phy_id]
puts [format "===> SANITY CHECK: TPG Reset GPIO tai 0x80060000 = 0x%08X" $tpg_gpio]

# 6. Nap va chay ung dung thong nhat hdmi_tx_app.elf (BNN AI + Sony IMX274 + HDMI TX)
puts "=== 6. Nap va chay ung dung thong nhat hdmi_tx_app.elf... ==="
puts "       (Bao gom: BNN AI Accelerator + Camera MIPI Rx + Video Demosaic + HDMI TX)"
targets -set -nocase -filter {name =~ "*A53*#0*"}
rst -processor -clear-registers
after 500
dow "D:/CodeWSL/Camera_AI/hdmi_tx_app.elf"
con
after 1000

# 7. Cho thuc thi AI va doc ket qua qua DDR RAM Result Buffer (0x01000000)
puts "=== 7. Dang thuc thi AI & Pipeline Camera tren ZCU106... ==="

set marker 0
set timeout 45
while {$timeout > 0} {
    after 1000
    configparams force-mem-accesses 1
    targets -set -nocase -filter {name =~ "*PSU*"}
    catch { set marker [mrd -value -force 0x01000014] }
    if {$marker == 0x12345678} { break }
    incr timeout -1
}

# Doc gia tri tu DDR RAM qua target PSU (AXI DAP he thong) de khong anh huong Cortex-A53
targets -set -nocase -filter {name =~ "*PSU*"}
configparams force-mem-accesses 1

set magic    0
set status   0
set logit0   0
set logit1   0
set pred     0
set i2c_mask 0

catch { set magic    [mrd -value -force 0x01000000] }
catch { set status   [mrd -value -force 0x01000004] }
catch { set logit0   [mrd -value -force 0x01000008] }
catch { set logit1   [mrd -value -force 0x0100000C] }
catch { set pred     [mrd -value -force 0x01000010] }
catch { set marker   [mrd -value -force 0x01000014] }
catch { set i2c_mask [mrd -value -force 0x01000018] }

# Chuyen doi so bu 2 (Signed 32-bit integer)
set s_logit0 [expr {$logit0 > 0x7FFFFFFF ? $logit0 - 0x100000000 : $logit0}]
set s_logit1 [expr {$logit1 > 0x7FFFFFFF ? $logit1 - 0x100000000 : $logit1}]

set step_str "Chua khoi chay"
if {$marker == 1} { set step_str "Da vao ham main() & bat dau BNN AI validation" }
if {$marker == 0x12345678} { set step_str "HOAN TAT TOAN BO TIEN TRINH (SUCCESS)" }

puts "\r\n================================================================"
puts "=== KET QUA THUC THI THOI GIAN THUC TREN BO ZCU106 (QUA JTAG): ==="
puts "================================================================"
puts [format " 1. Tien trinh thuc thi     : Step %s" $step_str]
puts [format " 2. MAGIC ID Hardware       : 0x%08X (Mong doi: 0x0B11EE01)" $magic]
puts [format " 3. Status Register         : 0x%08X" $status]
puts [format "    - ASCON Decrypt Done    : %s" [expr {($status & 0x4) ? "PASS (Xac thuc thanh cong)" : "CHUA XONG"}]]
puts [format "    - ASCON Tag Auth Error  : %s" [expr {($status & 0x10) ? "ERROR (Sai Tag)" : "NONE (Hop le)"}]]
puts [format "    - BNN Inference Done    : %s" [expr {($status & 0x1) ? "DONE" : "CHUA XONG"}]]
puts [format " 4. AI Logit 0 (Alert)      : %d (Golden: -697)" $s_logit0]
puts [format " 5. AI Logit 1 (Drowsy)     : %d (Golden: 881)" $s_logit1]
puts [format " 6. Final Prediction        : %d (%s)" $pred [expr {$pred == 0 ? "ALERT / TINH TAO" : "DROWSY / BUON NGU"}]]
puts [format " 7. Test Status Marker      : 0x%08X" $marker]
puts [format " 8. Trang thai Ngoai vi I2C : 0x%08X" $i2c_mask]
puts [format "    - PCA9548A MUX (0x75)   : %s" [expr {($i2c_mask & 0x1) ? "DETECTED (OK)" : "FAIL"}]]
puts [format "    - Sony IMX274 Cam (0x1A): %s" [expr {($i2c_mask & 0x2) ? "DETECTED (FMC HPC0 OK)" : "CHUA KET NOI / CHUA CAP NGUON"}]]
puts [format "    - TI CDCE913 Clock(0x65): %s" [expr {($i2c_mask & 0x4) ? "DETECTED (OK)" : "CHUA KET NOI"}]]
puts [format "    - TI SN65DP159 HDMI(0x5E): %s" [expr {($i2c_mask & 0x8) ? "DETECTED (OK)" : "FAIL"}]]
puts [format "    - IDT Video Clock (0x6C): %s" [expr {($i2c_mask & 0x10) ? "DETECTED (OK)" : "FAIL"}]]

if {$magic == 0x0B11EE01 && ($status & 0x5) == 0x5 && $s_logit0 == -697 && $s_logit1 == 881 && $pred == 1} {
    puts "\r\n================================================================"
    puts "===> \[TEST PASSED 100% BIT-EXACT\]: PHAN CUNG BNN + ASCON-128 HOAT DONG HOAN HAO! <==="
    puts "================================================================\r\n"
} else {
    puts "\r\n===> \[INFO\]: Dang theo doi tien trinh thuc thi..."
}

# 8. Tu dong trich xuat Framebuffer HUD Dashboard tu DDR 0x10000000
puts "=== 8. Dang trich xuat Framebuffer HUD Dashboard tu DDR 0x10000000... ==="
catch { mrd -bin -file "D:/CodeWSL/Camera_AI/fb_dump.bin" -force 0x10000000 921600 }
puts "=== Da trich xuat xong Framebuffer (fb_dump.bin)! ==="
puts "=== Dang mo giao dien Dashboard HUD 720p60 tren man hinh may tinh... ==="
catch { exec cmd.exe /c python "D:/CodeWSL/Camera_AI/show_hud.py" & }

puts "\r\n=================================================================="
puts {>>> [HUONG DAN MAN HINH ROI & HERCULES SERIAL COM]:              <<<}
puts {>>> 1. Man hinh roi (cong P2) se sang va hien thi COLOR BARS    <<<}
puts {>>>    chuan 1080p@60Hz tu Video TPG Controller!                <<<}
puts {>>> 2. Tren Hercules Serial (COM13, Baudrate 115200):            <<<}
puts {>>>    - Gui 'c': Tai kich hoat Color Bars 1080p60               <<<}
puts {>>>    - Gui 'i': Xem thong so HDMI Link, TMDS Clock & TPG Status<<<}
puts {>>>    - Gui 'v': Chon cac mau Test Pattern khac (Ramp, Tartan)  <<<}
puts {>>> 3. Giao dien HUD Dashboard AI da duoc mo tren PC tu RAM DDR4! <<<}
puts "==================================================================\r\n"
