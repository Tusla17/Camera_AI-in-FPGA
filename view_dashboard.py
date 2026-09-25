import os
import sys
import time
import subprocess
from PIL import Image

FB_FILE = "fb_dump.bin"
PNG_FILE = "dashboard_screenshot.png"
WIDTH = 1280
HEIGHT = 720
BYTES_PER_PIXEL = 4
TOTAL_BYTES = WIDTH * HEIGHT * BYTES_PER_PIXEL

def dump_from_jtag():
    print("[1/2] Dang lay Framebuffer tu DDR 0x10000000 qua JTAG...")
    xsdb_cmd = [
        r"D:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat",
        "get_dashboard.tcl"
    ]
    res = subprocess.run(xsdb_cmd, capture_output=True, text=True)
    if not os.path.exists(FB_FILE) or os.path.getsize(FB_FILE) < TOTAL_BYTES:
        print("[LOI] Khong the lay duoc Framebuffer tu JTAG!")
        print("Chi tiet loi:", res.stderr or res.stdout)
        return False
    return True

def convert_and_show():
    if not os.path.exists(FB_FILE):
        print(f"[THONG BAO] Chua tim thay {FB_FILE}, dang thu lay qua JTAG...")
        if not dump_from_jtag():
            return

    print("[2/2] Dang chuyen doi Framebuffer 1280x720 sang anh PNG...")
    with open(FB_FILE, "rb") as f:
        raw_data = f.read(TOTAL_BYTES)

    if len(raw_data) < TOTAL_BYTES:
        print(f"[LOI] Kich thuoc file {FB_FILE} nho hon 3.68 MB ({len(raw_data)} bytes)!")
        return

    # display_gui.c: (val << 16) | (val << 8) | val -> Little Endian BGRX
    img = Image.frombytes("RGB", (WIDTH, HEIGHT), raw_data, "raw", "BGRX")
    img.save(PNG_FILE)
    print(f"=== DA LUU ANH THANH CONG: {PNG_FILE} ===")
    
    # Hien thi giao dien
    try:
        import tkinter as tk
        from PIL import ImageTk

        root = tk.Tk()
        root.title("Secure Drowsiness Camera AI - Live HUD Dashboard (ZCU106 DDR 0x10000000)")
        root.geometry("1300x760")
        root.configure(bg="#0a0e17")

        # Header label
        lbl_title = tk.Label(root, text="[LIVE HUD VIEWER] Bo ZCU106 Zynq UltraScale+ | 1280x720 @ 60 FPS",
                             font=("Consolas", 14, "bold"), fg="#38bdf8", bg="#0a0e17")
        lbl_title.pack(pady=5)

        # Image display
        tk_img = ImageTk.PhotoImage(img)
        panel = tk.Label(root, image=tk_img, bg="#0a0e17")
        panel.pack(padx=10, pady=5)

        root.mainloop()
    except Exception as e:
        print(f"Mo bang trinh xem anh mac dinh cua Windows (Loi GUI: {e})...")
        os.startfile(PNG_FILE)

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "--dump":
        if dump_from_jtag():
            convert_and_show()
    else:
        convert_and_show()
