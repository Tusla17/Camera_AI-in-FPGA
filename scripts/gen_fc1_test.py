import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
Q = 8

# Trong so fc1 (128,1024) {0,1}, neuron-major, 1 bit/dong
w01 = np.load(EXP/"fc1_w01.npy")            # +1->1, -1->0
with open(MEM/"fc1_w_bits.mem","w") as f:
    for j in range(w01.shape[0]):
        for k in range(w01.shape[1]):
            f.write(f"{int(w01[j,k])}\n")

# Nguong tau (bnf) -> fixed-point Qx.8, two's complement 32-bit hex
tau = np.load(EXP/"bnf_fold.npz")["tau"]
q = np.round(tau*(1<<Q)).astype(np.int64)
with open(MEM/"fc1_tau.mem","w") as f:
    for v in q:
        f.write(f"{int(v) & 0xffffffff:08x}\n")

# Golden input (l3_bin) -> 1024 bit, +1->1
g = np.load("export/golden_0.npz")
inb = (g["l3_bin"].reshape(-1) > 0).astype(np.uint8)
assert inb.size == 1024, inb.size
with open(MEM/"g0_in_bits.mem","w") as f:
    for b in inb: f.write(f"{int(b)}\n")

# Output ky vong (fc1_bin) -> 128 bit
outb = (g["fc1_bin"].reshape(-1) > 0).astype(np.uint8)
with open(MEM/"g0_fc1_expected.mem","w") as f:
    for b in outb: f.write(f"{int(b)}\n")

print("OK: w", w01.shape, "| in", inb.size, "| out", outb.size)
