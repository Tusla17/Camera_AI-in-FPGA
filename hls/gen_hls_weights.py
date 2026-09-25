#!/usr/bin/env python3
# Reference model (== RTL) + ghi golden_logits.mem cho testbench HLS.
# Chay tu thu muc hls\:  python gen_hls_weights.py [duong_dan_mem]
# Mac dinh doc .mem o ../mem, ghi golden_logits.mem o ../mem.
# (v3: khong sinh header nua — weights nap vao bnn_top qua cong dau vao,
#  testbench tu doc .mem luc chay. Script nay chi de self-check + golden.)
import sys
from pathlib import Path

MEM = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("../mem")

KNOWN_GOLDEN = [
    (911, -1117), (937, -1119), (983, -1167), (1281, -1379),
    (-651, 1013), (-965, 1261), (-657, 859), (-697, 881),
]
KNOWN_LABEL = [0,0,0,0,1,1,1,1]

def read_bits(name):
    out = []
    for ln in open(MEM/name):
        ln = ln.strip()
        if ln == "": continue
        out.append(int(ln, 2) & 1)
    return out

def read_hex32(name):
    out = []
    for ln in open(MEM/name):
        ln = ln.strip()
        if ln == "": continue
        v = int(ln, 16)
        if v >= (1 << 31): v -= (1 << 32)
        out.append(v)
    return out

W1   = read_bits("conv1_w_bits.mem")   # 288
TAU1 = read_hex32("conv1_tau.mem")     # 32
W2   = read_bits("conv2_w_bits.mem")   # 18432
TAU2 = read_hex32("conv2_tau.mem")     # 64
W3   = read_bits("conv3_w_bits.mem")   # 36864
TAU3 = read_hex32("conv3_tau.mem")     # 64
WF1  = read_bits("fc1_w_bits.mem")     # 131072
TAUF1= read_hex32("fc1_tau.mem")       # 128
WF2  = read_hex32("fc2_w.mem")         # 256
BF2  = read_hex32("fc2_b.mem")         # 2

EXPECT = {"conv1_w_bits":288,"conv1_tau":32,"conv2_w_bits":18432,"conv2_tau":64,
          "conv3_w_bits":36864,"conv3_tau":64,"fc1_w_bits":131072,"fc1_tau":128,
          "fc2_w":256,"fc2_b":2}
got = {"conv1_w_bits":len(W1),"conv1_tau":len(TAU1),"conv2_w_bits":len(W2),"conv2_tau":len(TAU2),
       "conv3_w_bits":len(W3),"conv3_tau":len(TAU3),"fc1_w_bits":len(WF1),"fc1_tau":len(TAUF1),
       "fc2_w":len(WF2),"fc2_b":len(BF2)}
bad = [k for k in EXPECT if EXPECT[k] != got[k]]
if bad:
    for k in bad: print(f"[SIZE] {k}: got {got[k]} expect {EXPECT[k]}")
    sys.exit("Kich thuoc .mem sai — dung lai.")
print("[OK] kich thuoc tat ca .mem dung.")

Q = 8
C1_OC, P1_H, P1_W = 32, 16, 16
def conv1(img):
    l1 = [0]*(C1_OC*P1_H*P1_W); H, W_ = 32, 32; psum = [0]*(H*W_)
    for oc in range(32):
        for pos in range(H*W_):
            oh, ow = divmod(pos, W_); acc = 0
            for kh in range(3):
                for kw in range(3):
                    ih, iw = oh+kh-1, ow+kw-1
                    if 0<=ih<H and 0<=iw<W_:
                        v = img[ih*W_+iw]
                        acc += v if W1[oc*9+kh*3+kw]==1 else -v
            psum[pos] = acc
        for pp in range(16*16):
            ph, pw = divmod(pp, 16)
            s = (psum[(2*ph)*W_+2*pw], psum[(2*ph)*W_+2*pw+1],
                 psum[(2*ph+1)*W_+2*pw], psum[(2*ph+1)*W_+2*pw+1])
            l1[oc*256+pp] = 1 if max(s) > TAU1[oc] else 0
    return l1

def conv_bin(inb, CIN, COUT, H, W_, Wb, TAU):
    NP = (H//2)*(W_//2); out = [0]*(COUT*NP); psum = [0]*(H*W_)
    for oc in range(COUT):
        for pos in range(H*W_):
            oh, ow = divmod(pos, W_); acc = 0
            for ci in range(CIN):
                part = 0
                for kh in range(3):
                    for kw in range(3):
                        ih, iw = oh+kh-1, ow+kw-1
                        if 0<=ih<H and 0<=iw<W_:
                            a = inb[ci*H*W_+ih*W_+iw]
                            w = Wb[oc*(CIN*9)+ci*9+kh*3+kw]
                            part += 1 if a==w else -1
                acc += part
            psum[pos] = acc
        pw2 = W_//2
        for pp in range(NP):
            ph, pw = divmod(pp, pw2)
            s = (psum[(2*ph)*W_+2*pw], psum[(2*ph)*W_+2*pw+1],
                 psum[(2*ph+1)*W_+2*pw], psum[(2*ph+1)*W_+2*pw+1])
            out[oc*NP+pp] = 1 if (max(s) << Q) > TAU[oc] else 0
    return out

def infer(img):
    l1 = conv1(img)
    l2 = conv_bin(l1, 32, 64, 16, 16, W2, TAU2)
    l3 = conv_bin(l2, 64, 64, 8, 8, W3, TAU3)
    f1 = [0]*128
    for n in range(128):
        acc = 0; base = n*1024
        for k in range(1024):
            acc += 1 if l3[k]==WF1[base+k] else -1
        f1[n] = 1 if (acc << Q) > TAUF1[n] else 0
    a0, a1 = BF2[0], BF2[1]
    for k in range(128):
        a0 += WF2[0*128+k] if f1[k] else -WF2[0*128+k]
        a1 += WF2[1*128+k] if f1[k] else -WF2[1*128+k]
    def t32(x):
        x &= (1<<32)-1
        return x-(1<<32) if x>=(1<<31) else x
    return t32(a0), t32(a1), (1 if a1>a0 else 0)

def read_input(t):
    p = MEM/f"conv1_in_{t}.mem"
    if not p.exists(): return None
    vals = read_hex32(f"conv1_in_{t}.mem")
    return vals if len(vals)==1024 else None

golden_rows = []; n_ok = 0
have_inputs = all((MEM/f"conv1_in_{t}.mem").exists() for t in range(8))
if have_inputs:
    print("[REF] chay reference model tren 8 input...")
    for t in range(8):
        img = read_input(t); l0, l1v, pr = infer(img)
        golden_rows.append((l0, l1v, KNOWN_LABEL[t]))
        exp = KNOWN_GOLDEN[t]
        ok = (l0==exp[0] and l1v==exp[1]); n_ok += 1 if ok else 0
        print(f"  test {t}: logit0={l0:5d} logit1={l1v:5d} pred={pr}  {'OK' if ok else '!! MISMATCH exp '+str(exp)}")
    print(f"[REF] khop golden da biet: {n_ok}/8")
    with open(MEM/"golden_logits.mem", "w", newline="\n") as f:
        for (l0, l1v, lb) in golden_rows:
            f.write(f"{l0} {l1v} {lb}\n")
    print(f"[OK] da ghi {MEM/'golden_logits.mem'}")
else:
    print("[WARN] thieu conv1_in_0..7.mem — bo qua golden_logits.mem")
