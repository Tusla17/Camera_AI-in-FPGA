import numpy as np
from pathlib import Path
MEM = Path("mem"); MEM.mkdir(exist_ok=True)
QI = 15
for i in range(8):
    g = np.load(f"export/golden_{i}.npz")
    img = g["input"].reshape(-1)
    qi = np.clip(np.round(img*(1<<QI)).astype(np.int64), -(1<<QI), (1<<QI)-1)
    with open(MEM/f"conv1_in_{i}.mem","w") as f:
        for v in qi:
            f.write(f"{int(v) & 0xffffffff:08x}\n")
    print(f"golden_{i}: label={int(g['label'])}, n={qi.size}")
