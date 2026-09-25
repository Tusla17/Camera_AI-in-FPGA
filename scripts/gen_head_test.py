import numpy as np
from pathlib import Path

MEM = Path("mem"); MEM.mkdir(exist_ok=True)
N = 8
with open(MEM/"head_in.mem","w") as fin, open(MEM/"head_labels.mem","w") as flab:
    for i in range(N):
        g = np.load(f"export/golden_{i}.npz")
        inb = (g["l3_bin"].reshape(-1) > 0).astype(np.uint8)
        assert inb.size == 1024
        for b in inb: fin.write(f"{int(b)}\n")
        flab.write(f"{int(g['label']) & 0xffffffff:08x}\n")
print("wrote", N, "golden inputs (l3_bin) + labels")
