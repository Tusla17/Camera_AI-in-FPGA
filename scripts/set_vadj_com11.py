import serial
import time
import sys

def main():
    print("=== Tool tu dong ket noi MSP430 System Controller tren COM11 ===")
    try:
        ser = serial.Serial('COM11', 115200, timeout=1.5)
    except Exception as e:
        print(f"[LOI]: Khong the mo COM11: {e}")
        print("-> Neu ban dang mo COM11 trong Hercules, hay bam nut [Close] tren Hercules truoc!")
        return

    print("1. Dang gui ma phim ESC (0x1B)...")
    ser.write(b'\x1b')
    time.sleep(0.5)
    resp = ser.read_all().decode('ascii', errors='ignore')
    print("   Phan hoi:", repr(resp))

    print("2. Dang gui phim Enter...")
    ser.write(b'\r\n')
    time.sleep(0.5)
    resp2 = ser.read_all().decode('ascii', errors='ignore')
    print("   Phan hoi:\n", resp2)

    # Thu gui '?' va 'help'
    ser.write(b'?\r\n')
    time.sleep(0.5)
    resp3 = ser.read_all().decode('ascii', errors='ignore')
    if resp3:
        print("   Phan hoi voi '?':\n", resp3)

    ser.write(b'help\r\n')
    time.sleep(0.5)
    resp4 = ser.read_all().decode('ascii', errors='ignore')
    if resp4:
        print("   Phan hoi voi 'help':\n", resp4)

    # Thu gui '@ver'
    ser.write(b'@ver\r\n')
    time.sleep(0.5)
    resp5 = ser.read_all().decode('ascii', errors='ignore')
    if resp5:
        print("   Phan hoi voi '@ver':\n", resp5)

    ser.close()
    print("=== Hoan tat kiem tra COM11 ===")

if __name__ == '__main__':
    main()
