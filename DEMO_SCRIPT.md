# HƯỚNG DẪN TRÌNH DIỄN DEMO THỜI GIAN THỰC TRÊN BO AMD ZCU106
## Live Demonstration & Presentation Playbook: Secure Drowsiness Camera AI

---

### 🎬 MỤC TIÊU TRÌNH DIỄN (DEMO OBJECTIVES)
Tài liệu này cung cấp kịch bản từng bước (Step-by-Step Script) để thuyết trình, bảo vệ đồ án hoặc trình diễn trực tiếp trước Ban giám khảo cuộc thi / Hội đồng khoa học.

---

## 1. CHUẨN BỊ THIẾT BỊ TRƯỚC KHI BẬT NGUỒN (HARDWARE SETUP)

1. **Bo mạch ZCU106**:
   - Gạt công tắc gạt cấu hình Boot Mode SW6: `0000` (JTAG Mode).
   - Cắm nguồn 12V adapter vào jack nguồn ZCU106.
2. **Dây cáp kết nối**:
   - Cáp Micro-USB 1 $\to$ Cổng J2 (USB JTAG) cắm vào máy tính Windows.
   - Cáp Micro-USB 2 $\to$ Cổng J83 (USB UART CP2108) cắm vào máy tính Windows.
   - Cáp HDMI $\to$ Cổng HDMI TX trên bo mạch kết nối vào màn hình ngoài (Monitor/TV 1080p).
   - *(Tùy chọn)*: Cắm card camera Leopard Imaging LI-IMX274 vào khe FMC HPC0 (J5).
   - *(Tùy chọn)*: Cắm còi Buzzer và LED module vào cổng PMOD0 / PMOD1.

---

## 2. KỊCH BẢN TRÌNH DIỄN 4 PHẦN (4-PHASE LIVE DEMO)

### PHASE 1: CHỨNG MINH TÍNH BẢO MẬT MÔ HÌNH PHẦN CỨNG (ZERO-TRUST ASCON-128 AEAD)
- **Ý nghĩa**: Chứng minh với hội đồng rằng mô hình AI không bao giờ bị lộ trọng số ở dạng Plaintext ra ngoài bộ nhớ RAM DDR (chống tấn công trích xuất IP AI).
- **Thao tác**:
  Chạy script bring-up JTAG:
  ```powershell
  & "D:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat" run_zcu106.tcl
  ```
- **Điểm nhấn thuyết trình**:
  1. ARM Cortex-A53 đọc 6,380 từ trọng số đã được mã hóa **ASCON-128 AEAD** từ Flash/DDR và bơm liên tục vào cổng AXI `0x40`.
  2. Lõi phần cứng ASCON-128 trên FPGA giải mã on-chip và tính toán ra **128-bit Authentication Tag**: `0xA8DF77EAFE41FBD097D156F53C9A1AEA`.
  3. Chỉ khi Tag này khớp hoàn toàn, bit `load_done` dựng lên (`Status = 0x00000005`, `load_error = 0`), BNN mới được phép hoạt động.

---

### PHASE 2: KIỂM CHỨNG ĐỘ CHÍNH XÁC PHẦN CỨNG BIT-EXACT 100% VỚI PYTORCH
- **Ý nghĩa**: Chứng minh bộ tăng tốc nhị phân phần cứng (XNOR + Popcount) không làm sai lệch dù chỉ 1 bit so với mô hình huấn luyện trên GPU máy tính.
- **Thao tác & Kết quả trực quan**:
  - Mẫu 0 (Mắt Mở - Tỉnh Táo):
    - Phần cứng tính ra: `Logit0 = 911`, `Logit1 = -1117` $\to$ Dự đoán: `0 (ALERT / TỈNH TÁO)`.
    - PyTorch Golden: `911, -1117, 0` $\to$ **Khớp 100%**.
  - Mẫu 7 (Mắt Nhắm - Buồn Ngủ):
    - Phần cứng tính ra: `Logit0 = -697`, `Logit1 = 881` $\to$ Dự đoán: `1 (DROWSY / BUỒN NGỦ)`.
    - PyTorch Golden: `-697, 881, 1` $\to$ **Khớp 100%**.

---

### PHASE 3: MÔ PHỎNG CHUỖI MỎI MẮT 160 KHUNG HÌNH & BỘ LỌC TRỄ PERCLOS
- **Ý nghĩa**: Chứng minh hệ thống không chỉ phát hiện chớp mắt đơn lẻ mà đánh giá chính xác mức độ buồn ngủ theo chuẩn y khoa PERCLOS.
- **Diễn biến 160 frames trên Màn hình HDMI Dashboard**:
  - **Frames 0 - 39 (Tỉnh táo)**: 
    - Mắt mở liên tục. PERCLOS = $0\%$.
    - Trạng thái HUD: `AWAKE` (Màu xanh lục). Còi Buzzer tắt.
  - **Frames 40 - 69 (Bắt đầu mệt mỏi)**:
    - Chớp mắt ngắt quãng. PERCLOS tăng lên $25 - 35\%$.
    - Trạng thái HUD chuyển: `PRE_DROWSY` (Màu vàng). Còi bíp nhẹ $1000\text{ Hz}$ nhắc nhở.
  - **Frames 70 - 109 (Buồn ngủ rõ rệt)**:
    - Mắt nhắm thường xuyên. PERCLOS đạt $45 - 65\%$.
    - Trạng thái HUD chuyển: `DROWSY` (Màu cam đậm). Còi báo $2000\text{ Hz}$ dồn dập.
  - **Frames 110 - 139 (Ngủ gật - Microsleep nguy hiểm)**:
    - Mắt nhắm nghiền liên tục trên 30 frames. PERCLOS $\ge 75\%$.
    - Trạng thái HUD: `MICROSLEEP` (Màu đỏ chói). Viền màn hình HDMI nhấp nháy đỏ cảnh báo toàn màn hình (Strobe Alert). Còi hụ khẩn cấp $2500 - 3500\text{ Hz}$.
  - **Frames 140 - 160 (Tỉnh lại - Recovery)**:
    - Tài xế giật mình mở mắt. Nhờ **Hysteresis FSM**, còi không tắt ngay mà giảm dần mức độ, tránh hiện tượng bật tắt liên tục gây gián đoạn.

---

### PHASE 4: THEO DÕI VÀ DEBUG QUA CỔNG UART SERIAL MONITOR
- Mở cửa sổ dòng lệnh PowerShell thứ hai và chạy trình giám sát Serial:
  ```powershell
  python serial_monitor.py
  ```
- Hoặc mở phần mềm **Hercules Setup Utility**:
  - Cấu hình: Tab `Serial` $\to$ Chọn cổng `COM13` (Interface 0 - PS UART) $\to$ Baud rate `115200` $\to$ Click `Open`.
  - Nhấn nút **POR_B** hoặc nút Reset trên bo ZCU106 để quan sát toàn bộ log khởi động và đo đạc chi tiết từng khung hình!
