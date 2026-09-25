import sys, numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
QI = 15
i = int(sys.argv[1]) if len(sys.argv) > 1 else 0
g = np.load(f"export/golden_{i}.npz")
img = g["input"].reshape(-1)
qi = np.clip(np.round(img*(1<<QI)).astype(np.int64), -(1<<QI), (1<<QI)-1)
with open(MEM/"conv1_in.mem","w") as f:
    for v in qi: f.write(f"{int(v) & 0xffffffff:08x}\n")
with open(MEM/"top_label.mem","w") as f:
    f.write(f"{int(g['label']) & 0xffffffff:08x}\n")
print(f"golden_{i}: label={int(g['label'])}")
