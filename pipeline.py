#!/usr/bin/env python3
"""
==============================================================================
Secure Camera AI: Driver Drowsiness Detection System
AMD Zynq UltraScale+ ZCU106 FPGA Accelerator
Unified Python Automation Pipeline
==============================================================================
Usage:
    python pipeline.py dashboard [--dump]  # View Live HUD Framebuffer GUI
    python pipeline.py export              # Export & encrypt PyTorch BNN weights
    python pipeline.py train               # Train BNNEye model on dataset
    python pipeline.py monitor [--port COM3] # Real-time UART monitor
    python pipeline.py sim-mem             # Generate simulation test vectors (.mem)
==============================================================================
"""

import os
import sys
import argparse
import subprocess
import time

def cmd_dashboard(args):
    """View Live HUD Framebuffer GUI extracted from DDR4 0x10000000 via JTAG."""
    from PIL import Image

    FB_FILE = "fb_dump.bin"
    PNG_FILE = "dashboard_screenshot.png"
    WIDTH = 1280
    HEIGHT = 720
    TOTAL_BYTES = WIDTH * HEIGHT * 4

    if args.dump or not os.path.exists(FB_FILE):
        print("[1/2] Fetching Framebuffer from ZCU106 DDR (0x10000000) via JTAG/XSDB...")
        xsdb_bin = r"D:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat"
        if not os.path.exists(xsdb_bin):
            xsdb_bin = "xsdb"
        res = subprocess.run([xsdb_bin, "get_dashboard.tcl"], capture_output=True, text=True)
        if not os.path.exists(FB_FILE) or os.path.getsize(FB_FILE) < TOTAL_BYTES:
            print("[ERROR] Could not extract Framebuffer via JTAG.")
            print(res.stderr or res.stdout)
            if not os.path.exists(FB_FILE):
                return

    print("[2/2] Converting 1280x720 Raw Framebuffer to PNG...")
    with open(FB_FILE, "rb") as f:
        raw_data = f.read(TOTAL_BYTES)

    if len(raw_data) < TOTAL_BYTES:
        print(f"[ERROR] Incomplete frame dump: {len(raw_data)} bytes (expected {TOTAL_BYTES})")
        return

    img = Image.frombytes("RGB", (WIDTH, HEIGHT), raw_data, "raw", "BGRX")
    img.save(PNG_FILE)
    print(f"=== Dashboard image saved successfully: {PNG_FILE} ===")

    try:
        import tkinter as tk
        from PIL import ImageTk

        root = tk.Tk()
        root.title("Secure Drowsiness Camera AI - Live HUD Dashboard (ZCU106)")
        root.geometry("1300x760")
        root.configure(bg="#0a0e17")

        lbl = tk.Label(root, text="[LIVE HUD VIEWER] AMD ZCU106 MPSoC | 1280x720 @ 60 FPS",
                       font=("Consolas", 14, "bold"), fg="#38bdf8", bg="#0a0e17")
        lbl.pack(pady=5)

        tk_img = ImageTk.PhotoImage(img)
        panel = tk.Label(root, image=tk_img, bg="#0a0e17")
        panel.pack(padx=10, pady=5)
        root.mainloop()
    except Exception as e:
        print(f"Opening with default system viewer (GUI Note: {e})...")
        os.startfile(PNG_FILE)

def cmd_export(args):
    """Export PyTorch BNN weights into C headers and encrypted arrays."""
    print("=== Exporting PyTorch BNN Weights & Generating C Headers ===")
    import export
    print("Export completed successfully.")

def cmd_train(args):
    """Train BNNEye model on dataset."""
    print("=== Training BNNEye Binary Neural Network ===")
    import train
    print("Training process finished.")

def cmd_monitor(args):
    """Monitor UART serial communication with ZCU106."""
    import serial_monitor
    serial_monitor.main()

def cmd_sim_mem(args):
    """Regenerate test vectors for RTL simulation."""
    print("=== Regenerating Verilog Simulation Test Vectors (.mem) ===")
    script_path = os.path.join("scripts", "gen_mem.py")
    if os.path.exists(script_path):
        subprocess.run([sys.executable, script_path])
    else:
        print(f"Script not found: {script_path}")

def main():
    parser = argparse.ArgumentParser(
        description="Secure Camera AI: Driver Drowsiness Detection System on AMD ZCU106",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    subparsers = parser.add_subparsers(dest="command", help="Available subcommands")

    # Subcommand: dashboard
    p_dash = subparsers.add_parser("dashboard", help="Display Live HUD Dashboard")
    p_dash.add_argument("--dump", action="store_true", help="Force new JTAG memory dump from ZCU106 DDR")
    p_dash.set_defaults(func=cmd_dashboard)

    # Subcommand: export
    p_exp = subparsers.add_parser("export", help="Export PyTorch BNN weights to C headers")
    p_exp.set_defaults(func=cmd_export)

    # Subcommand: train
    p_train = subparsers.add_parser("train", help="Train BNN model")
    p_train.set_defaults(func=cmd_train)

    # Subcommand: monitor
    p_mon = subparsers.add_parser("monitor", help="Monitor UART console from ZCU106")
    p_mon.add_argument("--port", default=None, help="Serial COM port (e.g., COM3)")
    p_mon.set_defaults(func=cmd_monitor)

    # Subcommand: sim-mem
    p_mem = subparsers.add_parser("sim-mem", help="Generate RTL simulation test vectors")
    p_mem.set_defaults(func=cmd_sim_mem)

    args = parser.parse_args()
    if hasattr(args, "func"):
        args.func(args)
    else:
        # Default behavior: launch dashboard viewer
        cmd_dashboard(argparse.Namespace(dump=False))

if __name__ == "__main__":
    main()
