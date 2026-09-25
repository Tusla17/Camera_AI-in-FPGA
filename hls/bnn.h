#ifndef BNN_H
#define BNN_H
// KHONG include he thong (vd <cstdint>) trong duong tong hop: front-end clang cua
// Vitis 2025.2 (che do HLS, Windows) co the crash khi resolve header he thong.
// bnn.cpp chi dung int / unsigned int / long long.

// ===== Kich thuoc (khop model BNNEye) =====
#define IMG_H 32
#define IMG_W 32
#define C1_OC 32
#define P1_H  16
#define P1_W  16
#define C2_IC 32
#define C2_OC 64
#define C2_H  16
#define C2_W  16
#define P2_H  8
#define P2_W  8
#define C3_IC 64
#define C3_OC 64
#define C3_H  8
#define C3_W  8
#define P3_H  4
#define P3_W  4
#define FC1_IN  1024
#define FC1_OUT 128
#define FC2_OUT 2
#define Q 8

// So tu 32-bit cua cac ROM weight da bit-pack
#define W1_WORDS  9      // 288  bits
#define W2_WORDS  576    // 18432
#define W3_WORDS  1152   // 36864
#define WF1_WORDS 4096   // 131072

typedef int img_t;    // anh Q15 signed 32-bit
typedef int acc_t;    // logit 32-bit (RTL: logit = a[31:0])
typedef int pred_t;   // 0/1

// Weights la CONG DAU VAO (PS napt qua AXI/BRAM o nhánh 2) — khong khoi tao
// mang const trong code tong hop (tranh crash preprocessing cua Vitis csynth).
void bnn_top(const img_t img[IMG_H*IMG_W],
             const unsigned int W1[W1_WORDS],  const int TAU1[C1_OC],
             const unsigned int W2[W2_WORDS],  const int TAU2[C2_OC],
             const unsigned int W3[W3_WORDS],  const int TAU3[C3_OC],
             const unsigned int WF1[WF1_WORDS],const int TAUF1[FC1_OUT],
             const int WF2[FC2_OUT*FC1_OUT],   const int BF2[FC2_OUT],
             acc_t &logit0, acc_t &logit1, pred_t &pred);
#endif
