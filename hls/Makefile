# ============================================================================
#  BNNEye - Vitis HLS - Makefile tong hop (csim / csynth / cosim / export)
# ============================================================================
#  Dat file nay CUNG THU MUC voi bnn.cpp + cac file .tcl:
#     D:\CodeWSL\Camera_AI\hls
#
#  YEU CAU: co GNU 'make' tren PATH  (kiem tra:  make --version)
#           Vitis 2025.2 tren Windows.
#  Moi recipe deu goi qua PowerShell nen chay duoc du 'make' dung cmd.exe
#  hay sh (Git-Bash / MSYS / WSL) lam shell.
#
#  VI DU:
#     make            -> in huong dan
#     make csynth     -> tong hop C ra QoR (tu dong xoa project cu truoc)
#     make report     -> in bao cao QoR (timing / latency / utilization)
#     make hls        -> full: csim -> csynth -> cosim -> export IP
#     make clean      -> xoa project bnn_hls
#     make csynth VITIS_RUN="E:/Xilinx/2025.2/Vitis/bin/vitis-run.bat"
# ============================================================================

# ---- Cong cu (ghi de qua dong lenh neu duong dan khac) ----
VITIS_RUN ?= D:/AMDDesignTools/2025.2/Vitis/bin/vitis-run.bat
CXX       ?= g++
PS        := powershell -NoProfile -ExecutionPolicy Bypass -Command

# ---- Tham so project (khop cac file .tcl) ----
PROJ    := bnn_hls
SOL     := sol1
TOP     := bnn_top
PART    := xczu7ev-ffvc1156-2-e
PERIOD  := 10

# ---- Nguon / bao cao ----
SRC     := bnn.cpp
HDR     := bnn.h
TB      := bnn_tb.cpp
RPT     := $(PROJ)/$(SOL)/syn/report/$(TOP)_csynth.rpt
SIZERPT := $(PROJ)/$(SOL)/syn/report/csynth_design_size.rpt

# ---- Thu muc .mem (weights + golden) cho target 'gcc' local ----
MEMDIR  ?= ../mem

.DEFAULT_GOAL := help
.PHONY: help all csim csynth cosim hls export report size clean gcc

help:
	@echo ============================================================
	@echo   BNNEye HLS - Makefile tong hop
	@echo ============================================================
	@echo   make csim     - C simulation (kiem tra 8/8 bit-exact)
	@echo   make csynth   - C synthesis  QoR: II, latency, tai nguyen
	@echo   make cosim    - C/RTL co-simulation
	@echo   make hls      - Full: csim + csynth + cosim + export IP
	@echo   make export   - Chi csynth + export IP  cho nhanh 2 AXI
	@echo   make report   - In bao cao csynth
	@echo   make size     - In bao cao design size
	@echo   make gcc      - Build/chay bang g++ sanity, khong can Vitis
	@echo   make clean    - Xoa project bnn_hls
	@echo ------------------------------------------------------------
	@echo   VITIS_RUN = $(VITIS_RUN)
	@echo ============================================================

all: hls

# ==== Cac flow: LUON xoa project cu truoc (tranh project hong nhu truoc day) ==
csim: clean
	$(PS) "& '$(VITIS_RUN)' --mode hls --tcl run_csim.tcl"

csynth: clean
	$(PS) "& '$(VITIS_RUN)' --mode hls --tcl run_csynth.tcl"

cosim: clean
	$(PS) "& '$(VITIS_RUN)' --mode hls --tcl run_cosim.tcl"

hls: clean
	$(PS) "& '$(VITIS_RUN)' --mode hls --tcl run_hls.tcl"

export: clean
	$(PS) "& '$(VITIS_RUN)' --mode hls --tcl run_export.tcl"

# ==== Xem bao cao ====
report:
	@$(PS) "if (Test-Path '$(RPT)') { Get-Content '$(RPT)' } else { Write-Host 'Chua co bao cao - chay: make csynth' }"

size:
	@$(PS) "if (Test-Path '$(SIZERPT)') { Get-Content '$(SIZERPT)' } else { Write-Host 'Chua co - chay: make csynth' }"

# ==== Xoa project ====
clean:
	@$(PS) "Remove-Item -Recurse -Force '$(PROJ)' -ErrorAction SilentlyContinue; if (Test-Path '$(PROJ)') { Write-Host 'CLEAN FAIL: $(PROJ)' } else { Write-Host 'clean OK: da xoa $(PROJ)' }"

# ==== Sanity build bang g++ (can g++ + thu muc .mem; chay tu WSL/Git-Bash) ====
gcc:
	$(CXX) -O2 -w -I. -DMEMDIR=\"$(MEMDIR)\" $(SRC) $(TB) -o csim_local
	./csim_local
