import os
import sys
import numpy as np
from PIL import Image

bin_path = "D:/CodeWSL/Camera_AI/fb_dump.bin"
png_path = "D:/CodeWSL/Camera_AI/fb_dump.png"

if os.path.exists(bin_path):
    data = np.fromfile(bin_path, dtype=np.uint32)
    if len(data) >= 1280 * 720:
        data = data[:1280 * 720].reshape((720, 1280))
        rgb = np.zeros((720, 1280, 3), dtype=np.uint8)
        rgb[:, :, 0] = (data >> 16) & 0xFF
        rgb[:, :, 1] = (data >> 8) & 0xFF
        rgb[:, :, 2] = data & 0xFF
        img = Image.fromarray(rgb)
        img.save(png_path)
        print("[SUCCESS] HUD Dashboard Framebuffer saved to:", png_path)
        print("[DISPLAY] Bat cua so hien thi Dashboard tren man hinh may tinh...")
        os.system(f'start "" "{png_path}"')
    else:
        print("[ERROR] Framebuffer bin file size too small:", len(data))
else:
    print("[ERROR] fb_dump.bin not found!")
