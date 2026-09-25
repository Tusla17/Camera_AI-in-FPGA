import random, shutil
from pathlib import Path

SRC = "mrl_raw/mrleyedataset"
DST = "data"
VAL_RATIO = 0.2
EXT = {".png", ".jpg", ".jpeg", ".bmp"}
MAP = {"Open-Eyes": "open", "Close-Eyes": "closed"}   # đổi tên lớp cho gọn
random.seed(42)

for folder, cls in MAP.items():
    cdir = Path(SRC) / folder
    imgs = [p for p in cdir.iterdir() if p.suffix.lower() in EXT]
    random.shuffle(imgs)
    n_val = int(len(imgs) * VAL_RATIO)
    for split, group in {"val": imgs[:n_val], "train": imgs[n_val:]}.items():
        out = Path(DST) / split / cls
        out.mkdir(parents=True, exist_ok=True)
        for src in group:
            shutil.copy(src, out / src.name)
    print(f"{cls}: train={len(imgs)-n_val}  val={n_val}")
print("Xong! Dataset ở:", DST)
