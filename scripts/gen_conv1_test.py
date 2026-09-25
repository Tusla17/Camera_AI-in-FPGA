import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
QI = 15   # so bit phan so cho anh + tau (Q1.15)

# weight conv1 (32,1,3,3) {0,1} -> (32,9)
w01 = np.load(EXP/"conv1_w01.npy")
assert w01.shape == (32,1,3,3), w01.shape
wf = w01.reshape(32,-1)
with open(MEM/"conv1_w_bits.mem","w") as f:
    for oc in range(32):
        for t in range(wf.shape[1]):
            f.write(f"{int(wf[oc,t])}\n")

# tau bn1 -> Q1.15 (cung mien voi tong conv cua pixel Q1.15)
tau = np.load(EXP/"bn1_fold.npz")["tau"]
q = np.round(tau*(1<<QI)).astype(np.int64)
with open(MEM/"conv1_tau.mem","w") as f:
    for v in q: f.write(f"{int(v) & 0xffffffff:08x}\n")

g = np.load("export/golden_0.npz")
img = g["input"].reshape(32,32)                 # thuc, ~[-1,1]
qi = np.round(img*(1<<QI)).astype(np.int64)
qi = np.clip(qi, -(1<<QI), (1<<QI)-1)           # giu trong dai Q1.15
with open(MEM/"conv1_in.mem","w") as f:
    for v in qi.reshape(-1): f.write(f"{int(v) & 0xffffffff:08x}\n")

exp = (g["l1_bin"].reshape(-1) > 0).astype(np.uint8)
with open(MEM/"conv1_exp.mem","w") as f:
    for b in exp: f.write(f"{int(b)}\n")

print("conv1: w", w01.shape, "| in", qi.size, "| exp", exp.size,
      "| tau range", round(float(tau.min()),3), round(float(tau.max()),3))
