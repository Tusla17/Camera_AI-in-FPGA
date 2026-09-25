import numpy as np, sys, os
idx = int(sys.argv[1]) if len(sys.argv) > 1 else 0
g = np.load(f"export/golden_{idx}.npz")
l3   = (g['l3_bin'].reshape(-1) > 0).astype(int)    # 1024, C-order = oc*16+ph*4+pw
fc1b = (g['fc1_bin'].reshape(-1) > 0).astype(int)   # 128
label = int(g['label'])
os.makedirs("mem", exist_ok=True)
with open("mem/fc_in.mem", "w") as f:
    for b in l3:   f.write(f"{b}\n")
with open("mem/fc_exp_bin.mem", "w") as f:
    for b in fc1b: f.write(f"{b}\n")
with open("mem/fc_label.mem", "w") as f:
    f.write(f"{label}\n")
print(f"fc test idx={idx} | l3 {l3.size} | fc1_bin {fc1b.size} | label {label}")
