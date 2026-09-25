"""
UART Serial Monitor for ZCU106 (Silicon Labs CP2108 USB-to-UART Bridge)
Default: COM13 (Interface 0 - Cortex-A53 Console), Baudrate 115200
Usage:
    python serial_monitor.py [COM_PORT] [BAUD_RATE]
Example:
    python serial_monitor.py
    python serial_monitor.py COM12
"""
import sys
import time

try:
    import serial
    import serial.tools.list_ports
except ImportError:
    print("[ERROR] Thu vien 'pyserial' chua duoc cai dat.")
    print("Vui long chay: pip install pyserial")
    sys.exit(1)

def find_zcu106_uart():
    ports = list(serial.tools.list_ports.comports())
    cp2108_ports = []
    for p in ports:
        if "CP2108" in p.description or "Silicon Labs" in p.description:
            cp2108_ports.append((p.device, p.description))
    return cp2108_ports

def main():
    baud = 115200
    target_port = "COM13"  # Mac dinh Interface 0 cua ZCU106

    # Neu nguoi dung truyen tham so dong lenh
    if len(sys.argv) > 1:
        target_port = sys.argv[1].upper()
    if len(sys.argv) > 2:
        baud = int(sys.argv[2])

    print("================================================================")
    print("===       ZCU106 UART TERMINAL MONITOR (115200 8-N-1)        ===")
    print("================================================================")
    
    cp2108 = find_zcu106_uart()
    if cp2108:
        print("[+] Tim thay cac cong UART cua ZCU106 tren he thong:")
        for dev, desc in cp2108:
            marker = " <-- [DANG CHON]" if dev == target_port else ""
            print(f"    - {dev}: {desc}{marker}")
    else:
        print("[!] Canh bao: Khong tim thay chip CP2108. Kiem tra cap USB UART (J83) da cam chua.")

    print(f"\n[+] Dang ket noi toi cong {target_port} o toc do {baud} baud...")
    
    try:
        ser = serial.Serial(target_port, baud, timeout=0.1)
        ser.reset_input_buffer()
        print(f"[+] Ket noi thanh cong! Dang lang nghe log tu ZCU106 Cortex-A53...\n")
        print("-------------------- [BAT DAU LOG TREN BO] ---------------------")
    except Exception as e:
        print(f"[LOI] Khong the mo cong {target_port}: {e}")
        print("Goi y: Neu COM13 bao ban hoac khong chay, thu chay: python serial_monitor.py COM12")
        sys.exit(1)

    try:
        while True:
            if ser.in_waiting > 0:
                data = ser.read(ser.in_waiting)
                try:
                    text = data.decode('utf-8', errors='replace')
                    sys.stdout.write(text)
                    sys.stdout.flush()
                except Exception:
                    sys.stdout.write(str(data))
                    sys.stdout.flush()
            time.sleep(0.01)
    except KeyboardInterrupt:
        print("\n-------------------- [DUNG MONITOR] ----------------------------")
        ser.close()

if __name__ == "__main__":
    main()
