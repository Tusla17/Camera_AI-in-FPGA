HLS BNN - huong dan (khop RTL bit-exact, weights-as-ports)
==========================================================

TAI SAO BAN NAY: ban cu dung bnn_weights.h (mang const khoi tao ~74KB) lam CRASH
bo tien xu ly cua Vitis csynth (loi "Compilation of the preprocessed source failed",
khong kem error that). Chung minh: mini_top (khong header) thi csynth PASS, con
test_hdr.cpp (chi include bnn_weights.h) thi FAIL y het.

FIX: bo hoan toan mang khoi tao lon khoi code tong hop. Weights gio la CONG DAU VAO
cua bnn_top; testbench tu nap tu file .mem luc chay. bnn.cpp duoc csynth khong con
gi de nghen. Dung kien truc that: o nhanh 2, PS se nap weights vao PL qua AXI/BRAM.
Datapath giu nguyen -> van bit-exact voi RTL.

File trong zip (dat vao D:\CodeWSL\Camera_AI\hls\):
  bnn.h, bnn.cpp, bnn_tb.cpp   - design + testbench (weights-as-ports)
  gen_hls_weights.py           - reference model + ghi golden_logits.mem
  run_csim.tcl / run_csynth.tcl / run_hls.tcl

CAC BUOC CHAY (tu thu muc hls\):

1. Self-check reference + tao golden_logits.mem:
     python gen_hls_weights.py
   Ky vong: [REF] khop golden da biet: 8/8

2. csim (nhanh, kiem tra bit-exact):
     Remove-Item -Recurse -Force bnn_hls -ErrorAction SilentlyContinue
     & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_csim.tcl
   Ky vong: ==== 8/8 PASS ====

3. csynth (lay QoR: LUT/FF/DSP/BRAM, Fmax, latency/II):
     Remove-Item -Recurse -Force bnn_hls -ErrorAction SilentlyContinue
     & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_csynth.tcl
   Xem report: bnn_hls\sol1\syn\report\bnn_top_csynth.rpt

4. Khi csim 8/8 + hai long QoR -> full flow:
     & "D:\AMDDesignTools\2025.2\Vitis\bin\vitis-run.bat" --mode hls --tcl run_hls.tcl

Ghi chu: warning '__GMP_LIBGMP_DLL macro redefined' la vo hai (moi nguoi deu gap).
