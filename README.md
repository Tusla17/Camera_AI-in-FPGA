# Secure Drowsiness Camera AI on AMD Zynq UltraScale+ ZCU106

[![AMD ZCU106](https://img.shields.io/badge/Board-AMD%20ZCU106%20MPSoC-orange.svg)](https://www.xilinx.com/products/boards-and-kits/zcu106.html)
[![Vivado 2025.2](https://img.shields.io/badge/Vivado-v2025.2-blue.svg)](https://www.xilinx.com/products/design-tools/vivado.html)
[![Vitis 2025.2](https://img.shields.io/badge/Vitis-v2025.2-green.svg)](https://www.xilinx.com/products/design-tools/vitis.html)
[![Model Accuracy](https://img.shields.io/badge/Validation%20Accuracy-98.21%25-brightgreen.svg)]()
[![Hardware Match](https://img.shields.io/badge/Silicon%20Match-100%25%20Bit--Exact-blueviolet.svg)]()
[![Security](https://img.shields.io/badge/Security-ASCON--128%20AEAD%20%2B%20TRNG-red.svg)]()

Hệ thống nhúng biên (Edge AI) phát hiện buồn ngủ thời gian thực ứng dụng mạng nơ-ron nhị phân (**BNN**) và bảo mật phần cứng toàn diện (**ASCON-128 AEAD + TRNG NIST SP 800-90B**) trên nền tảng **AMD/Xilinx Zynq UltraScale+ ZCU106**.

![Live HUD Dashboard 1280x720](dashboard_screenshot.png)

---

## 🌟 TÍNH NĂNG NỔI BẬT (KEY FEATURES)

1. **Mạng Nơ-ron Nhị phân (Binary Neural Network - BNNEye)**:
   - Thay thế hoàn toàn các phép nhân thực FP32/INT8 tốn kém bằng **cổng XNOR và đếm bit (Popcount)**.
   - Folded Batch Normalization: Chuyển toàn bộ tham số Scale/Bias về ngưỡng so sánh nguyên $\tau$ (Zero-DSP inference).
   - Độ chính xác đạt **98.21%** trên tập dữ liệu chuẩn MRL Eye Dataset.
   - Khớp kết quả thực thi phần cứng **100% bit-exact** với mô hình PyTorch Golden Model.

2. **Bảo mật Phần cứng Toàn diện (Zero-Trust Hardware Security)**:
   - **ASCON-128 AEAD**: Chuẩn mật mã nhẹ NIST số 1 giải mã trọng số on-chip trực tiếp vào Distributed RAM, không bao giờ lộ trọng số thô ra RAM DDR bên ngoài.
   - **Xác thực Tag 128-bit**: Khóa toàn bộ mô hình nếu phát hiện bất kỳ bit dữ liệu nào bị can thiệp.
   - **TRNG Ring-Oscillator**: Tích hợp khối sinh số ngẫu nhiên thực đạt chuẩn kiểm tra an toàn NIST SP 800-90B.

3. **Cảnh báo PERCLOS Chống Nhiễu & Giao diện Trực quan**:
   - Máy trạng thái **Hysteresis FSM 4 cấp độ**: `AWAKE`, `PRE_DROWSY`, `DROWSY`, `MICROSLEEP`.
   - Driver ngoại vi PMOD: Còi Buzzer điều chế tần số PWM $1000 - 3500\text{ Hz}$ và LED cảnh báo.
   - Dashboard đồ họa HDMI HUD hiển thị thanh trạng thái, đồ thị sóng chớp mắt và viền cảnh báo nhấp nháy 60 FPS.

4. **Hiệu năng & Tài nguyên Tối ưu trên Silicon XCZU7EV**:
   - **Tài nguyên**: Chỉ chiếm **20.19% LUTs**, **0 Block RAM Tiles (0%)**, **1 DSP Slice (0.06%)**.
   - **Công suất phần cứng PL**: Chỉ **`104 mW (0.104 W)`**, nhiệt độ chip mát mẻ $28.6^\circ\text{C}$.
   - **Thời gian suy luận**: $< 1\text{ ms}$ / frame (Băng thông tương đương $> 120\text{ FPS}$).

---

## 📁 CẤU TRÚC THƯ MỤC (REPOSITORY STRUCTURE)

```
Camera_AI/
├── rtl/                        # Mã nguồn phần cứng Verilog (PL)
│   ├── bnn_axi_lite.v          # Wrapper AXI4-Lite cho toàn bộ hệ thống
│   ├── top_clk.v               # Bộ điều phối tuần tự inference BNN
│   ├── conv1_engine.v          # Tầng tích chập Conv1 (Input thực Q15 -> Nhị phân)
│   ├── conv_engine.v           # Tầng tích chập nhị phân thuần XNOR (Conv2, Conv3)
│   ├── fc_engine.v             # Tầng kết nối đầy đủ FC1 (1024->128) & FC2 (128->2)
│   ├── weight_loader.v         # Bộ giải mã phần cứng ASCON-128 AEAD
│   ├── trng.v                  # Khối sinh số ngẫu nhiên thực Ring-Oscillator NIST
│   ├── camera_preproc.v        # Bộ tiền xử lý Camera RGB -> Grayscale 32x32 Q15
│   └── tb_bnn_axi_lite.v       # Testbench mô phỏng kiểm tra toàn diện
├── bnn_bd/                     # Project Vivado Block Design (ZynqMP + BNN IP)
├── bnn_zcu106.xsa              # Hardware Platform xuất cho Vitis SDK
├── vitis_workspace/            # Workspace ứng dụng phần mềm Bare-metal
│   └── bnn_test_app/src/
│       ├── main.c              # Chương trình chính ARM Cortex-A53
│       ├── perclos_fsm.c/.h    # Thuật toán lọc trễ PERCLOS Hysteresis FSM
│       ├── pmod_alarm.c/.h     # Driver điều khiển Còi PWM & LED PMOD
│       ├── display_gui.c/.h    # Engine render đồ họa HDMI HUD Dashboard
│       └── imx274_driver.c/.h  # Driver I2C điều khiển Camera Sony IMX274
├── run_zcu106.tcl              # Script tự động hóa JTAG nạp bitstream và đọc kết quả
├── serial_monitor.py           # Tool Python giám sát console UART CP2108
├── TECHNICAL_REPORT.md         # Báo cáo kỹ thuật chi tiết & Số liệu Benchmark
└── DEMO_SCRIPT.md              # Hướng dẫn từng bước trình diễn Demo trực tiếp
```

---

## 🚀 HƯỚNG DẪN CHẠY NHANH (QUICK START GUIDE)

### 1. Yêu cầu Hệ thống
- Bo mạch phát triển **AMD Zynq UltraScale+ ZCU106**.
- Cáp nguồn 12V adapter và 02 cáp Micro-USB (JTAG cổng J2, UART cổng J83).
- Cáp HDMI kết nối cổng HDMI TX với màn hình ngoài.
- AMD Vivado & Vitis phiên bản **2025.2** (hoặc 2022.2+).

### 2. Nạp Bitstream & Chạy Suy luận trên Bo mạch qua JTAG
Mở terminal PowerShell tại thư mục dự án và thực thi:
```powershell
& "D:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat" run_zcu106.tcl
```

### 3. Kết quả mong đợi trên Terminal
```text
================================================================
=== KET QUA THUC THI THOI GIAN THUC TREN BO ZCU106 (QUA JTAG): ===
================================================================
 1. Tien trinh thuc thi     : Step HOAN TAT TOAN BO TIEN TRINH (SUCCESS)
 2. MAGIC ID Hardware       : 0x0B11EE01 (Mong doi: 0x0B11EE01)
 3. Status Register         : 0x00000005
    - ASCON Decrypt Done    : PASS (Xac thuc thanh cong)
    - ASCON Tag Auth Error  : NONE (Hop le)
    - BNN Inference Done    : DONE
 4. AI Logit 0 (Alert)      : -697
 5. AI Logit 1 (Drowsy)     : 881
 6. Final Prediction        : 1 (DROWSY / BUON NGU)
 7. Test Status Marker      : 0x12345678
```

---

## 📊 TÀI LIỆU CHI TIẾT
- Chi tiết kỹ thuật, bảng phân tích tài nguyên và công suất: Xem [TECHNICAL_REPORT.md](TECHNICAL_REPORT.md).
- Hướng dẫn kịch bản trình diễn và thuyết trình demo: Xem [DEMO_SCRIPT.md](DEMO_SCRIPT.md).
