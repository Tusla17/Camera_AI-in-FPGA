#include "bnn.h"

// Bit-packed weight ROM: bit i cua mang A = (A[i>>5] >> (i&31)) & 1.
#define GETBIT(A, i) ((int)(((A)[(i) >> 5] >> ((i) & 31)) & 1u))

// ============================================================================
//  BNNEye - Vitis HLS - ban TOI UU AN TOAN (v4)
//  Muc tieu: QUA duoc csynth (khong lam sap front-end clang) + nhanh hon baseline.
//
//  Bai hoc tu cac ban truoc (v2/v3 lam sap 'Compilation of the preprocessed
//  source failed'): TRANH cac cau truc sau voi Vitis 2025.2:
//    (1) ham TEMPLATE  (conv_layer<...>)
//    (2) #pragma HLS ARRAY_PARTITION tren MANG THAM SO cua HAM CON (INLINE off)
//    (3) mang 'static' 2 CHIEU  (static int psum[H*W][COUT])
//  => Ban nay GOP TAT CA vao 1 ham bnn_top, khong ham con, khong template,
//     mang 1 chieu, chi pipeline + array_partition trong pham vi top.
//
//  Bit-exact voi baseline/RTL: chi doi THU TU vong lap (cong so nguyen co
//  tinh ket hop) + them pragma; moi phep toan giu nguyen.
//    - conv1: acc += / -= img ; pool2 max ; l1 = (m > tau) ? 1:0   (khong dich)
//    - conv2/3: acc += (a==w)?+1:-1 ; pool2 max ; out = ((m<<Q) > tau) ? 1:0
//    - fc1: acc += (a==w)?+1:-1 ; f1 = ((acc<<Q) > tau) ? 1:0
//    - fc2: a += f1 ? w : -w ; logit = (int)a ; pred = (a1 > a0)
// ============================================================================

void bnn_top(const img_t img[IMG_H*IMG_W],
             const unsigned int W1[W1_WORDS],  const int TAU1[C1_OC],
             const unsigned int W2[W2_WORDS],  const int TAU2[C2_OC],
             const unsigned int W3[W3_WORDS],  const int TAU3[C3_OC],
             const unsigned int WF1[WF1_WORDS],const int TAUF1[FC1_OUT],
             const int WF2[FC2_OUT*FC1_OUT],   const int BF2[FC2_OUT],
             acc_t &logit0, acc_t &logit1, pred_t &pred) {

    static int l1[C1_OC*P1_H*P1_W];   // 8192 (0/1)
    static int l2[C2_OC*P2_H*P2_W];   // 4096 (0/1)
    static int l3[C3_OC*P3_H*P3_W];   // 1024 (0/1)
    static int f1[FC1_OUT];           // 128  (0/1)
    static int ps[IMG_H*IMG_W];       // psum dung chung (max 1024)

    // Phan manh nhe (luy thua 2) de cac vong pipeline doc song song duoc.
    // Chi phan manh mang la NUT co chai; giu factor nho de csynth nhanh & on dinh.
#pragma HLS ARRAY_PARTITION variable=img cyclic factor=4 dim=1
#pragma HLS ARRAY_PARTITION variable=l1  cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=l2  cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=W2  cyclic factor=2 dim=1
#pragma HLS ARRAY_PARTITION variable=W3  cyclic factor=2 dim=1

    // ============================ conv1: 1 -> 32, 32x32 ====================
    for (int oc = 0; oc < C1_OC; oc++) {
        for (int oh = 0; oh < IMG_H; oh++)
            for (int ow = 0; ow < IMG_W; ow++) {
#pragma HLS PIPELINE II=1
                int acc = 0;
                for (int kh = 0; kh < 3; kh++)
                    for (int kw = 0; kw < 3; kw++) {
                        int ih = oh + kh - 1, iw = ow + kw - 1;
                        if (ih >= 0 && ih < IMG_H && iw >= 0 && iw < IMG_W) {
                            int v = (int)img[ih*IMG_W + iw];
                            if (GETBIT(W1, oc*9 + kh*3 + kw) == 1) acc += v;
                            else                                   acc -= v;
                        }
                    }
                ps[oh*IMG_W + ow] = acc;
            }
        for (int ph = 0; ph < P1_H; ph++)
            for (int pw = 0; pw < P1_W; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph  )*IMG_W + (2*pw  )];
                int s1 = ps[(2*ph  )*IMG_W + (2*pw+1)];
                int s2 = ps[(2*ph+1)*IMG_W + (2*pw  )];
                int s3 = ps[(2*ph+1)*IMG_W + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l1[oc*(P1_H*P1_W) + (ph*P1_W + pw)] = (m > TAU1[oc]) ? 1 : 0;
            }
    }

    // ============================ conv2: 32 -> 64, 16x16 ===================
    for (int oc = 0; oc < C2_OC; oc++) {
        for (int oh = 0; oh < C2_H; oh++)
            for (int ow = 0; ow < C2_W; ow++) {
                int acc = 0;
                for (int ci = 0; ci < C2_IC; ci++) {
#pragma HLS PIPELINE II=1
                    for (int kh = 0; kh < 3; kh++)
                        for (int kw = 0; kw < 3; kw++) {
                            int ih = oh + kh - 1, iw = ow + kw - 1;
                            if (ih >= 0 && ih < C2_H && iw >= 0 && iw < C2_W) {
                                int a = l1[ci*C2_H*C2_W + ih*C2_W + iw];
                                int w = GETBIT(W2, oc*(C2_IC*9) + ci*9 + kh*3 + kw);
                                acc += (a == w) ? 1 : -1;
                            }
                        }
                }
                ps[oh*C2_W + ow] = acc;
            }
        for (int ph = 0; ph < P2_H; ph++)
            for (int pw = 0; pw < P2_W; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph  )*C2_W + (2*pw  )];
                int s1 = ps[(2*ph  )*C2_W + (2*pw+1)];
                int s2 = ps[(2*ph+1)*C2_W + (2*pw  )];
                int s3 = ps[(2*ph+1)*C2_W + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l2[oc*(P2_H*P2_W) + (ph*P2_W + pw)] = (((long long)m << Q) > TAU2[oc]) ? 1 : 0;
            }
    }

    // ============================ conv3: 64 -> 64, 8x8 =====================
    for (int oc = 0; oc < C3_OC; oc++) {
        for (int oh = 0; oh < C3_H; oh++)
            for (int ow = 0; ow < C3_W; ow++) {
                int acc = 0;
                for (int ci = 0; ci < C3_IC; ci++) {
#pragma HLS PIPELINE II=1
                    for (int kh = 0; kh < 3; kh++)
                        for (int kw = 0; kw < 3; kw++) {
                            int ih = oh + kh - 1, iw = ow + kw - 1;
                            if (ih >= 0 && ih < C3_H && iw >= 0 && iw < C3_W) {
                                int a = l2[ci*C3_H*C3_W + ih*C3_W + iw];
                                int w = GETBIT(W3, oc*(C3_IC*9) + ci*9 + kh*3 + kw);
                                acc += (a == w) ? 1 : -1;
                            }
                        }
                }
                ps[oh*C3_W + ow] = acc;
            }
        for (int ph = 0; ph < P3_H; ph++)
            for (int pw = 0; pw < P3_W; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph  )*C3_W + (2*pw  )];
                int s1 = ps[(2*ph  )*C3_W + (2*pw+1)];
                int s2 = ps[(2*ph+1)*C3_W + (2*pw  )];
                int s3 = ps[(2*ph+1)*C3_W + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l3[oc*(P3_H*P3_W) + (ph*P3_W + pw)] = (((long long)m << Q) > TAU3[oc]) ? 1 : 0;
            }
    }

    // ============================ fc1: 1024 -> 128 =========================
    for (int n = 0; n < FC1_OUT; n++) {
        int acc = 0;
        for (int k = 0; k < FC1_IN; k++) {
#pragma HLS PIPELINE II=1
            int a = l3[k];
            int w = GETBIT(WF1, n*FC1_IN + k);
            acc += (a == w) ? 1 : -1;
        }
        f1[n] = (((long long)acc << Q) > TAUF1[n]) ? 1 : 0;
    }

    // ============================ fc2: 128 -> 2 (logit thuc) ===============
    long long a0 = BF2[0], a1 = BF2[1];
    for (int k = 0; k < FC1_OUT; k++) {
#pragma HLS PIPELINE II=1
        long long w0 = WF2[0*FC1_OUT + k];
        long long w1 = WF2[1*FC1_OUT + k];
        a0 += f1[k] ? w0 : -w0;
        a1 += f1[k] ? w1 : -w1;
    }
    logit0 = (acc_t)(int)a0;   // RTL: logit = a[31:0]
    logit1 = (acc_t)(int)a1;
    pred   = (a1 > a0) ? 1 : 0;
}
