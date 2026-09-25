import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
Q = 8

# weight conv3 (64,64,3,3) {0,1} -> (64,576) C-order (ic,kh,kw)
w01 = np.load(EXP/"conv3_w01.npy")
assert w01.shape == (64,64,3,3), w01.shape
wf = w01.reshape(64,-1)
with open(MEM/"conv3_w_bits.mem","w") as f:
    for oc in range(64):
        for t in range(wf.shape[1]):
            f.write(f"{int(wf[oc,t])}\n")

# tau bn3 -> Q.8 two's complement hex
tau = np.load(EXP/"bn3_fold.npz")["tau"]
q = np.round(tau*(1<<Q)).astype(np.int64)
with open(MEM/"conv3_tau.mem","w") as f:
    for v in q: f.write(f"{int(v) & 0xffffffff:08x}\n")

g = np.load("export/golden_0.npz")
# input l2_bin (64,8,8) -> bits C-order
l2 = g["l2_bin"].reshape(64,8,8)
inb = (l2.reshape(-1) > 0).astype(np.uint8)
with open(MEM/"conv3_in.mem","w") as f:
    for b in inb: f.write(f"{int(b)}\n")

# expected l3_bin (64,4,4) -> bits
exp = (g["l3_bin"].reshape(-1) > 0).astype(np.uint8)
with open(MEM/"conv3_exp.mem","w") as f:
    for b in exp: f.write(f"{int(b)}\n")

print("conv3 test: w", w01.shape, "| in", inb.size, "| exp", exp.size)
