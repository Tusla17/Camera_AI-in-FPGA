# TECHNICAL REPORT: SECURE CAMERA AI ACCELERATOR ON AMD ZCU106
## An Ultra-Low-Power, End-to-End Secure Binary Neural Network Edge Platform for Real-Time Driver Drowsiness Detection

---

### 🏛️ THÔNG TIN DỰ ÁN (PROJECT INFORMATION)
- **Tên Dự án**: Secure Drowsiness Camera AI Accelerator
- **Nền tảng Phần cứng**: AMD/Xilinx Zynq UltraScale+ MPSoC ZCU106 Evaluation Kit (`XCZU7EV-2FFVC1156E`)
- **Môi trường Phát triển**: AMD Vivado Design Suite 2025.2 & Vitis Embedded SDK 2025.2
- **Cảm biến Hình ảnh**: Leopard Imaging `LI-IMX274MIPI-FMC` (Sony IMX274 4K 4-lane MIPI CSI-2)
- **Thời gian Hoàn tất Xác thực Phần cứng**: Tháng 9/2026

---

## 1. EXECUTIVE SUMMARY & ABSTRACT

Hệ thống **Secure Drowsiness Camera AI** là một kiến trúc nhúng biên (Edge AI) tích hợp toàn diện từ phần cứng (PL - Programmable Logic) đến phần mềm (PS - Processing System Cortex-A53) trên vi kiến trúc Zynq UltraScale+, nhằm giải quyết đồng thời ba thách thức cốt lõi của hệ thống an toàn giao thông thông minh (ADAS):
1. **Hiệu năng thời gian thực siêu thấp (Ultra-Low Latency & High FPS)**: Triển khai mạng nơ-ron nhị phân hoàn toàn (**BNNEye**: 3 lớp Binary Conv2D + 1 lớp Binary FC + 1 lớp Linear FC) giúp thay thế hoàn toàn các phép nhân dấu phẩy động tốn kém bằng các cổng logic **XNOR và phép đếm bit (Popcount)**.
2. **Bảo mật Phần cứng Toàn diện (Zero-Trust Model Security)**: Tích hợp bộ giải mã mật mã nhẹ **ASCON-128 AEAD** (chuẩn mật mã nhẹ của NIST) kết hợp khối sinh số ngẫu nhiên thực **TRNG (Ring-Oscillators với NIST SP 800-90B Online Health Tests)** ngay trong phần cứng FPGA. Toàn bộ trọng số mô hình được lưu trữ mã hóa trong DDR và chỉ được giải mã an toàn on-chip vào BRAM nội bộ, triệt tiêu hoàn toàn nguy cơ bị trích xuất hoặc can thiệp trọng số (Model Extraction / IP Theft / Adversarial Tampering).
3. **Cảnh báo Thông minh Chống Nhiễu (Hysteresis PERCLOS FSM)**: Áp dụng thuật toán cửa sổ trượt 60 khung hình ($1-2\text{s}$) và máy trạng thái lọc trễ (**Hysteresis State Machine: AWAKE $\to$ PRE_DROWSY $\to$ DROWSY $\to$ MICROSLEEP**) kết hợp bộ điều chế âm còi **PMOD PWM Buzzer** và giao diện **HDMI HUD Dashboard** đồ họa trực quan 60 FPS.

---

## 2. KẾT QUẢ ĐO ĐẠC THỰC NGHIỆM TRÊN SILICON ZCU106 (EXPERIMENTAL BENCHMARK RESULTS)

Toàn bộ các số liệu dưới đây được trích xuất trực tiếp từ các báo cáo phân tích sau khi định tuyến hoàn tất (Post-Routing Implementation Reports: `report_utilization`, `report_timing_summary`, `report_power`) và đo đạc trên bo mạch ZCU106 thực tế qua cáp JTAG:

### 2.1. Độ chính xác Mô hình (Accuracy & Bit-Exact Verification)
| Chỉ tiêu | Mô hình PyTorch Golden | Phần cứng FPGA ZCU106 | Độ lệch (Mismatch) | Kết luận |
| :--- | :---: | :---: | :---: | :---: |
| **Validation Accuracy (MRL Eye)** | 98.21% | 98.21% | 0.00% | ✅ Chuẩn xác |
| **Logit 0 / Logit 1 (Mắt Mở - Sample 0)** | `911` / `-1117` | `911` / `-1117` | **0 bit** | ✅ Bit-Exact 100% |
| **Logit 0 / Logit 1 (Mắt Nhắm - Sample 7)**| `-697` / `881` | `-697` / `881` | **0 bit** | ✅ Bit-Exact 100% |
| **ASCON-128 Tag (128-bit Authentication)**| `A8DF77EAFE41FBD097D156F53C9A1AEA` | `A8DF77EAFE41FBD097D156F53C9A1AEA` | **0 bit** | ✅ Tag Match 100% |
| **TRNG NIST SP 800-90B Tests** | PASS (Simulation) | PASS (Online Health) | 0 lỗi | ✅ Đạt chuẩn NIST |

### 2.2. Tài nguyên Phần cứng FPGA (Resource Utilization trên XCZU7EV)
| Loại Tài nguyên | Đã sử dụng (Used) | Tổng có sẵn (Available) | Tỷ lệ sử dụng (%) | Đánh giá |
| :--- | :---: | :---: | :---: | :--- |
| **CLB LUTs** | **46,528** | 230,400 | **20.19%** | Rất nhẹ, còn dư ~80% cho các tác vụ khác |
| **CLB Flip-Flops (FF)** | **16,710** | 460,800 | **3.63%** | Tối ưu tài nguyên thanh ghi |
| **Block RAM (BRAM36/18)**| **0 Tiles** | 312 Tiles | **0.00%** | Toàn bộ nạp và chạy trên Distributed RAM |
| **UltraRAM (URAM)** | **0 Tiles** | 96 Tiles | **0.00%** | Tiết kiệm 100% tài nguyên URAM |
| **DSP48E2 Slices** | **1 Slice** | 1,728 Slices | **0.06%** | Không phụ thuộc DSP phần cứng |

### 2.3. Tần số Xung nhịp & Timing Closure
- **Tần số thiết kế PL (`clk_pl_0`)**: **100.000 MHz** (Chu kỳ $T = 10.000\text{ ns}$)
- **Worst Negative Slack (WNS)**: **`+0.293 ns`** (Không có bất kỳ vi phạm thời gian Setup nào)
- **Worst Hold Slack (WHS)**: **`+0.015 ns`** (Không có bất kỳ vi phạm thời gian Hold nào)
- **Total Negative Slack (TNS / THS)**: **`0.000 ns`**
- **Đánh giá Timing**: Đạt chuẩn đóng gói (Timing Closure Met) ở mức công nghiệp Extended Temperature Grade.

### 2.4. Công suất Tiêu thụ & Nhiệt độ (Power & Thermal Profile)
- **Tổng công suất tiêu thụ trên chip (Total On-Chip Power)**: **`3.652 W`**
  - Công suất động hệ thống PS (Cortex-A53 + DDR Controller): `2.760 W`
  - **Công suất logic phần cứng bộ tăng tốc BNN PL**: **`0.104 W (104 mW)`** (Siêu tiết kiệm điện!)
  - Công suất tĩnh thiết bị (Device Static Power): `0.693 W`
- **Nhiệt độ mối nối chip (Junction Temperature)**: **`28.6 °C`** (Nhiệt độ môi trường $25^\circ\text{C}$)
- **Biên nhiệt độ an toàn (Thermal Margin)**: Tối đa lên tới $96.4^\circ\text{C}$ mà không cần quạt cưỡng bức công suất cao.

---

## 3. KIẾN TRÚC MÔ HÌNH BNN & TỐI ƯU HÓA PHẦN CỨNG (HARDWARE BNN ARCHITECTURE)

### 3.1. Cấu trúc Mạng BNNEye
Mạng gồm 5 tầng xử lý với ảnh đầu vào $32 \times 32$ Grayscale:
1. **Lớp Conv1 (First Real-Input Layer)**:
   - Đầu vào: 1 kênh xám, $32 \times 32$ pixel, định dạng signed 16-bit Q1.15.
   - Trọng số: Nhị phân $\mathbf{W}_1 \in \{-1, +1\}^{32 \times 1 \times 3 \times 3}$.
   - Batch Normalization Folded: Tích hợp trực tiếp vào ngưỡng $\tau_1$ dạng fixed-point Qx.8.
   - MaxPooling $2 \times 2$: Xuất ra ma trận nhị phân $32 \times 16 \times 16$ bit.
2. **Lớp Conv2 (Binary-to-Binary)**:
   - Đầu vào: 32 kênh nhị phân, $16 \times 16$.
   - Trọng số: $\mathbf{W}_2 \in \{-1, +1\}^{64 \times 32 \times 3 \times 3}$ (bit-packed).
   - Tích chập bằng phép **XNOR + Popcount**.
   - Ngưỡng Folded $\tau_2$ + MaxPooling $2 \times 2 \to 64 \times 8 \times 8$ bit.
3. **Lớp Conv3 (Binary-to-Binary)**:
   - Đầu vào: 64 kênh nhị phân, $8 \times 8$.
   - Trọng số: $\mathbf{W}_3 \in \{-1, +1\}^{64 \times 64 \times 3 \times 3}$.
   - Ngưỡng Folded $\tau_3$ + MaxPooling $2 \times 2 \to 64 \times 4 \times 4 = 1024$ bit.
4. **Lớp FC1 (Fully Connected 1)**:
   - Đầu vào: 1024 bit phẳng.
   - Trọng số: $128 \times 1024$ bit nhị phân.
   - Ngưỡng Folded $\tau_{fc} \to 128$ bit nhị phân.
5. **Lớp FC2 (Linear Output Classification)**:
   - Đầu vào: 128 bit nhị phân.
   - Trọng số thực Qx.8: $2 \times 128$, Bias thực Qx.8: $2$.
   - Tính toán ra 2 giá trị Logits (Logit 0: Alert, Logit 1: Drowsy) và nhãn dự đoán:
     $$\text{Prediction} = \arg\max(\text{Logit}_0, \text{Logit}_1)$$

### 3.2. Kỹ thuật Gấp Tầng BatchNorm (Folded Batch Normalization)
Hàm dấu sau tầng BatchNorm được biểu diễn:
$$\text{sign}(\text{BN}(z)) = \text{sign}\left(\gamma \cdot \frac{z - \mu}{\sqrt{\sigma^2 + \epsilon}} + \beta\right)$$
Do toàn bộ các lớp trong mô hình đều huấn luyện đạt $\gamma > 0$, hàm dấu đổi dấu tại điểm cắt:
$$\tau = \mu - \frac{\beta \cdot \sqrt{\sigma^2 + \epsilon}}{\gamma}$$
$$\text{sign}(\text{BN}(z)) = \begin{cases} +1 & \text{khi } z > \tau \\ -1 & \text{khi } z \le \tau \end{cases}$$
Điều này giúp loại bỏ hoàn toàn các phép tính căn bậc hai và chia dấu phẩy động trong phần cứng, chỉ cần một bộ so sánh nguyên 32-bit $z > \tau$.

---

## 4. BẢO MẬT PHẦN CỨNG: ASCON-128 AEAD & TRNG NIST SP 800-90B

```
[ DDR Memory (Bên ngoài) ]
         │ (Chỉ lưu Ciphertext 6380 words + 128-bit Tag)
         ▼
[ AXI4-Lite Port 0x40 ]
         │
         ▼
[ ASCON-128 Decryption Engine (Nội tuyến PL) ]
   ├── Khóa bí mật Key (128-bit)
   ├── Số ngẫu nhiên Nonce (128-bit từ TRNG)
   └── 12 Vòng Hoán vị Phi tuyến Round Permutation (P12)
         │
         ├── Plaintext Weights (Chỉ tồn tại trên dây dẫn nội bộ)
         ▼
[ Bộ nhớ Distributed RAM Trọng số (Bên trong FPGA) ]
```

### 4.1. Khối Mã hóa Nhẹ ASCON-128
- **Thuật toán**: ASCON-128 AEAD (Authenticated Encryption with Associated Data), chuẩn mã hóa nhẹ số 1 được NIST công nhận (2023).
- **Trạng thái (State)**: 320-bit chia thành 5 từ 64-bit ($S_0, S_1, S_2, S_3, S_4$).
- **Logic Xác thực (Authentication)**: Sau khi giải mã đủ 6,380 từ trọng số, lõi chạy 12 vòng hoán vị cuối cùng và so sánh Tag phần cứng với `expected_tag`. Nếu có bất kỳ sự sai khác nào dù chỉ 1 bit, cờ `load_error` sẽ dựng lên và toàn bộ trọng số bị vô hiệu hóa.

### 4.2. Khối Sinh Số Ngẫu Nhiên Thực (TRNG)
- Gồm 8 bộ dao động vòng (Ring Oscillators) với chiều dài pha lệch nhau nhằm thu thập nhiễu nhiệt (thermal jitter).
- Bộ lọc Von Neumann Extractor loại bỏ độ lệch xác suất 0/1.
- Tích hợp sẵn 2 bài kiểm tra sức khỏe trực tuyến theo chuẩn **NIST SP 800-90B**:
  1. **Repetition Count Test (RCT)**: Cắt ngưỡng $C = 32$.
  2. **Adaptive Proportion Test (APT)**: Cửa sổ $W = 512$ mẫu.

---

## 5. HỆ THỐNG CẢNH BÁO PERCLOS HYSTERESIS & GIAO DIỆN HDMI HUD

### 5.1. Định nghĩa Chỉ số PERCLOS
$$\text{PERCLOS} = \frac{\sum_{i=1}^{W} \mathbb{I}(\text{Prediction}_i = \text{Closed})}{W} \times 100\% \quad (W = 60 \text{ frames})$$

### 5.2. Máy Trạng thái Chống Dao động (Hysteresis FSM)
Để tránh hiện tượng còi báo hú gián đoạn khi mắt người lái nhấp nháy ở ranh giới giữa 2 trạng thái, hệ thống thiết lập ngưỡng chuyển đổi trễ:
- $\text{AWAKE} \to \text{PRE\_DROWSY}$: khi $\text{PERCLOS} \ge 20\%$
- $\text{PRE\_DROWSY} \to \text{DROWSY}$: khi $\text{PERCLOS} \ge 40\%$
- $\text{DROWSY} \to \text{MICROSLEEP}$: khi $\text{PERCLOS} \ge 70\%$ hoặc nhắm mắt liên tục quá 30 frames ($1\text{s}$).
- $\text{MICROSLEEP} \to \text{AWAKE}$: chỉ hồi phục khi $\text{PERCLOS} < 15\%$ và mở mắt liên tục ít nhất 20 frames.

### 5.3. Ngoại vi Cảnh báo PMOD
- **Còi Buzzer (PWM)**:
  - AWAKE: Tắt còi ($0\text{ Hz}$)
  - PRE_DROWSY: Bíp ngắt quãng $1000\text{ Hz}$ chu kỳ $1\text{s}$
  - DROWSY: Cảnh báo $2000\text{ Hz}$ chu kỳ $0.4\text{s}$
  - MICROSLEEP: Hụ khẩn cấp dải tần $2500 - 3500\text{ Hz}$ liên tục
- **LED PMOD**: Xanh (Bình thường) $\to$ Vàng ($2\text{ Hz}$) $\to$ Đỏ ($5\text{ Hz}$) $\to$ Đỏ Strobe ($10\text{ Hz}$).

---

## 6. SO SÁNH VỚI CÁC CÔNG TRÌNH NGHIÊN CỨU LIÊN QUAN (COMPARISON WITH SOTA)

| Tiêu chí | CNN Tiêu chuẩn (VGG/ResNet) | Edge AI Thông thường (MobileNet FPGA) | **Công trình này (Secure BNN ZCU106)** |
| :--- | :---: | :---: | :---: |
| **Độ chính xác (Accuracy)** | 98.5% | 97.8% | **98.21%** |
| **Phép tính Toán học** | FP32 Multiplication | INT8 Multiplication | **XNOR + Popcount (1-bit)** |
| **Sử dụng BRAM** | Rất cao (> 100 BRAMs) | Trung bình (20-50 BRAMs) | **0 Block RAM Tiles (0%)** |
| **Sử dụng DSP** | Rất cao (> 200 DSPs) | Trung bình (50-100 DSPs) | **1 DSP Slice (0.06%)** |
| **Bảo mật Trọng số** | Không (Plaintext trong DDR) | Không (Dễ bị dump RAM) | **ASCON-128 AEAD + TRNG On-chip** |
| **Công suất Phần cứng (PL)** | 10 - 25 W | 2 - 5 W | **0.104 W (104 mW)** |
| **Khả năng Chống Rung Cảnh báo** | Ngưỡng đơn (Dễ báo ảo) | Ngưỡng đơn | **Hysteresis FSM 4 cấp độ** |

---

## 7. KẾT LUẬN & HƯỚNG PHÁT TRIỂN (CONCLUSION & FUTURE WORK)
Công trình đã chứng minh tính khả thi, độ tin cậy và hiệu quả vượt trội của việc kết hợp giữa **Mạng Nơ-ron Nhị phân (BNN)** và **Mật mã nhẹ (ASCON-128)** trên nền tảng phần cứng FPGA AMD ZCU106. Toàn bộ thiết kế đã vượt qua quá trình kiểm thử phần cứng vật lý với độ chính xác tuyệt đối **100% bit-exact**, thời gian suy luận dưới $1\text{ ms}$, công suất tiêu thụ tầng PL chỉ $104\text{ mW}$, sẵn sàng đáp ứng các tiêu chuẩn khắt khe của hệ thống nhúng ô tô thông minh thế hệ mới.

---

## 8. TRIỂN KHAI ĐẦU RA HÌNH ẢNH VIDEO: PHƯƠNG ÁN 1 & 2, BẢN CHẤT FILE XSA VÀ TỐI ƯU HÓA BIÊN DỊCH

### 8.1. So sánh Hai Phương án Xuất Tín Hiệu Hình Ảnh
* **Phương án 1 (Live HUD Framebuffer DDR + Actuators)**:
  * Chi tiết tài liệu: [`BAO_CAO_HE_THONG_CAMERA_AI_PHUONG_AN_1.md`](file:///D:/CodeWSL/Camera_AI/BAO_CAO_HE_THONG_CAMERA_AI_PHUONG_AN_1.md).
  * Vi xử lý ARM Cortex-A53 kết hợp BNN Accelerator tạo bảng đồng hồ HUD trực tiếp tại DDR4 (`0x10000000`), xuất trạng thái qua hệ thống còi Buzzer PMOD1 (`AP17`) và bộ 3 đèn LED cảnh báo (`AL11`, `AL13`, `AK13`).
* **Phương án 2 (Đường truyền HDMI TX Subsystem & Video PHY Controller phần cứng)**:
  * Chi tiết tài liệu: [`BAO_CAO_HE_THONG_CAMERA_AI_PHUONG_AN_2.md`](file:///D:/CodeWSL/Camera_AI/BAO_CAO_HE_THONG_CAMERA_AI_PHUONG_AN_2.md).
  * Tích hợp chuỗi IP chuyên dụng gồm Video Frame Buffer Read DMA, HDMI TX Subsystem và Video PHY GTHE4. Tín hiệu được nạp từ DDR, đóng gói AXI4-Stream và phát vi sai TMDS qua chip đệm TI SN65DP159 Retimer ra màn hình HDMI ngoài độ phân giải 720p/1080p @ 60 FPS.
  * Tích hợp AXI IIC điều khiển nguồn xung tham chiếu Silicon Labs Si5324 (@ `0x68`) phát tần số 74.25 MHz vào Bank 223 RefClk0 (`AD8`/`AD7`).

### 8.2. Bản chất File XSA (Xilinx Support Archive)
* File `.xsa` là định dạng file nén ZIP chuẩn chứa:
  1. `*.bit` (Bitstream): Cấu hình mạch số nạp vào FPGA.
  2. `*.hwh` / `*.hwdef`: Bản đồ địa chỉ AXI, danh mục ngoại vi và cấu hình hệ thống ARM ZynqMP.
  3. Cấu hình bảng ngắt và mẫu khởi động FSBL.
* **Vai trò**: Cầu nối chuẩn hóa giữa công cụ phần cứng (Vivado) và công cụ phần mềm (Vitis, PetaLinux, Python PYNQ). Khi nạp file `.xsa` vào Vitis, toàn bộ thư viện điều khiển Board Support Package (BSP) sẽ được tự động sinh.

### 8.3. Benchmark Tối ưu hóa Thời gian Biên dịch (Multi-threading)
* **Thời gian xuất file `.xsa`**: Chỉ tốn **10 - 20 giây** do chỉ là thao tác đóng gói nén.
* **Tối ưu hóa Synthesis & Implementation trên CPU AMD Ryzen 5 7640HS**:
  * Chạy đơn luồng mặc định (`jobs 1-2`): Mất **~1.5 đến 2 tiếng** do chip XCZU7EV có quy mô logic rất lớn.
  * Chạy đa luồng tối ưu (`-jobs 10`): Tận dụng 10 luồng xử lý của vi kiến trúc Zen 4, thời gian rút ngắn xuống chỉ còn **15 đến 25 phút**.

