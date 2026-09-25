import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
Q = 8

w01 = np.load(EXP/"conv2_w01.npy")       # (64,32,3,3)
assert w01.shape == (64,32,3,3), w01.shape
wf = w01.reshape(64,-1)                  # (64,288)
with open(MEM/"conv2_w_bits.mem","w") as f:
    for oc in range(64):
        for t in range(wf.shape[1]):
            f.write(f"{int(wf[oc,t])}\n")

tau = np.load(EXP/"bn2_fold.npz")["tau"]
q = np.round(tau*(1<<Q)).astype(np.int64)
with open(MEM/"conv2_tau.mem","w") as f:
    for v in q: f.write(f"{int(v) & 0xffffffff:08x}\n")

g = np.load("export/golden_0.npz")
l1 = g["l1_bin"].reshape(32,16,16)
inb = (l1.reshape(-1) > 0).astype(np.uint8)
with open(MEM/"conv2_in.mem","w") as f:
    for b in inb: f.write(f"{int(b)}\n")

exp = (g["l2_bin"].reshape(-1) > 0).astype(np.uint8)
with open(MEM/"conv2_exp.mem","w") as f:
    for b in exp: f.write(f"{int(b)}\n")

print("conv2 test: w", w01.shape, "| in", inb.size, "| exp", exp.size)  # in 8192 | exp 4096
