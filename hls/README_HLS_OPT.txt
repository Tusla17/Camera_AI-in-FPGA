================================================================
 BNNEye - Vitis HLS toi uu - PHIEN BAN v4 (AN TOAN CSYNTH)
================================================================

MUC TIEU BAN NAY: QUA duoc csynth (khong con loi
  "Compilation of the preprocessed source 'bnn' failed")
  + nhanh hon baseline. Sau khi qua, doc QoR roi day tiep toi Muc 3.

----------------------------------------------------------------
1. VI SAO v2/v3 SAP (root cause)
----------------------------------------------------------------
Loi "Compilation of the preprocessed source 'bnn' failed" KHONG
kem dong loi cu phap nao, va file trung gian bnn.pp.0.cpp KHONG
duoc tao -> day la CRASH front-end clang cua Vitis 2025.2, khong
phai loi C++ (g++ bien dich + chay bit-exact binh thuong).

Da chay lai voi project XOA SACH hoan toan -> VAN sap => nguyen
nhan nam trong SOURCE, khong phai project hong.

So voi ban deliver (da csynth OK @152 MHz), v3 them 3 cau truc ma
front-end Vitis hay sap:
  (1) ham TEMPLATE:  template<int CIN,...> conv_layer(...)
  (2) #pragma HLS ARRAY_PARTITION tren MANG THAM SO cua HAM CON
      dat INLINE off (partition port giao dien ham con)
  (3) mang 'static' 2 CHIEU: static int psum[H*W][COUT]

----------------------------------------------------------------
2. v4 SUA THE NAO
----------------------------------------------------------------
- GOP TAT CA vao 1 ham bnn_top duy nhat: KHONG ham con, KHONG
  template, mang deu 1 CHIEU. => khong con cau truc gay sap.
- Chi dung pragma "lanh": PIPELINE tren tung vong, va
  ARRAY_PARTITION tren mang o PHAM VI TOP (tham so top + bien cuc
  bo cua bnn_top) - day la cach Vitis luon tong hop on dinh.
- Factor phan manh la LUY THUA 2, nho (2/4/8) de csynth nhanh.
- Van BIT-EXACT: chi doi thu tu vong lap (cong so nguyen co tinh
  ket hop) + them pragma; moi phep toan giu nguyen.

Kiem chung sandbox (g++): output v4 == baseline TUNG BIT
(IDENTICAL_BITEXACT).

Toi uu ap dung:
  conv1 : pipeline vong pixel (oh,ow), II=1
  conv2 : pipeline vong tich chap kenh (ci), l1/W2 phan manh
  conv3 : pipeline vong ci, l2/W3 phan manh
  fc1   : pipeline vong k (II=1)
  fc2   : pipeline vong k (II=1)

----------------------------------------------------------------
3. CACH CHAY (project moi tinh)
----------------------------------------------------------------
Giai nen de GHI DE bnn.cpp cu, roi:

  cd D:\CodeWSL\Camera_AI\hls
  Remove-Item -Recurse -Force .\bnn_hls -ErrorAction SilentlyContinue
  Test-Path .\bnn_hls        # phai in False
  & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_csynth.tcl

Ky vong: qua duoc "Analyzing design file 'bnn.cpp'" va chay tiep
cac pha Unroll/Inline -> Array/Struct -> Performance -> Bind ->
ket thuc csynth_design (KHONG con dong 'failed').

Doc bao cao QoR: bnn_hls\sol1\syn\report\bnn_top_csynth.rpt
Gui minh phan Timing + Latency + Utilization.

----------------------------------------------------------------
4. SAU KHI QUA CSYNTH
----------------------------------------------------------------
Doc II thuc te tung vong tu report; neu con room:
  - tang factor phan manh l1/l2 (8 -> 16) de ep II=1 vong ci
  - hoac unroll mot phan ci
dan toi Muc 3 (~0.3-0.5 ms). Sau do chay cosim (run_hls.tcl).

(Cac ban cu: v3/v2 lam sap front-end - BO. v1 qua rong - BO.)
