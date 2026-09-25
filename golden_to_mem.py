import numpy as np
from pathlib import Path

MEM = Path("mem"); MEM.mkdir(exist_ok=True)
g = np.load("export/golden_0.npz")   # đổi index để test ảnh khác

# input conv1: ảnh Q1.15 (signed 16-bit)
img = g["input"].reshape(-1)
q = np.round(img * (1<<15)).astype(np.int32)
np.savetxt(MEM/"g0_input.mem", (q & 0xffff), fmt="%04x")

# output nhị phân từng lớp: map +1->1, -1->0, ghi 1 bit/dòng
for key in ["l1_bin","l2_bin","l3_bin","fc1_bin"]:
    bits = (g[key].reshape(-1) > 0).astype(np.uint8)
    np.savetxt(MEM/f"g0_{key}.mem", bits, fmt="%d")

print("label =", int(g["label"]), "| logits =", g["logits"].ravel())

