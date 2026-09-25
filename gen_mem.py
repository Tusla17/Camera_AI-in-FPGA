import numpy as np
from pathlib import Path

EXP = Path("export"); MEM = Path("mem"); MEM.mkdir(exist_ok=True)
Q = 8   # số bit phân số cho tau (fixed-point Qx.8)

# 1) Trọng số: mỗi output channel -> 1 dòng hex (từ mảng bit-packed)
for name in ["conv1","conv2","conv3","fc1"]:
    packed = np.load(EXP/f"{name}_w_packed.npy")   # (out, nbytes) uint8
    with open(MEM/f"{name}_w.mem","w") as f:
        for row in packed:
            f.write("".join(f"{b:02x}" for b in row) + "\n")
    print(name, "weights ->", packed.shape)

# 2) Ngưỡng tau -> số nguyên có dấu (fixed-point Qx.8), 1 dòng/kênh
for bn in ["bn1","bn2","bn3","bnf"]:
    tau = np.load(EXP/f"{bn}_fold.npz")["tau"]
    q = np.round(tau * (1<<Q)).astype(np.int32)
    with open(MEM/f"{bn}_tau.mem","w") as f:
        for v in q:
            f.write(f"{v & 0xffffffff:08x}\n")
    print(bn, "tau range", tau.min(), tau.max())

# 3) fc2 (thực) -> Qx.8
fc2 = np.load(EXP/"fc2.npz")
for key in ["weight","bias"]:
    q = np.round(fc2[key] * (1<<Q)).astype(np.int32).ravel()
    with open(MEM/f"fc2_{key}.mem","w") as f:
        for v in q:
            f.write(f"{v & 0xffffffff:08x}\n")
print("Xong! .mem ở:", MEM.resolve())
