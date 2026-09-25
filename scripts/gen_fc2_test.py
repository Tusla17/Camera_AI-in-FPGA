import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
Q = 8

fc2 = np.load(EXP/"fc2.npz")
W = fc2["weight"]   # (2,128)
b = fc2["bias"]     # (2,)

wq = np.round(W*(1<<Q)).astype(np.int64)
with open(MEM/"fc2_w.mem","w") as f:      # o-major: o=0 (128 dong) roi o=1
    for o in range(W.shape[0]):
        for k in range(W.shape[1]):
            f.write(f"{int(wq[o,k]) & 0xffffffff:08x}\n")

bq = np.round(b*(1<<Q)).astype(np.int64)
with open(MEM/"fc2_b.mem","w") as f:
    for v in bq: f.write(f"{int(v) & 0xffffffff:08x}\n")

g = np.load("export/golden_0.npz")
with open(MEM/"g0_label.mem","w") as f:
    f.write(f"{int(g['label']) & 0xffffffff:08x}\n")

inpm = np.where(g["fc1_bin"].reshape(-1) > 0, 1.0, -1.0)
logits_ref = W @ inpm + b
print("label =", int(g["label"]),
      "| logits_ref =", np.round(logits_ref,3),
      "| argmax =", int(np.argmax(logits_ref)))
