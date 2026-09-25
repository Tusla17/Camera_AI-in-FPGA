#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <string>
#include <cstdint>
#include "bnn.h"

#ifndef MEMDIR
#define MEMDIR "../mem"
#endif

// csim/cosim chay binary tu thu muc build sau (bnn_hls/sol1/csim/build),
// nen '../mem' khong con tro dung toi Camera_AI/mem. Ta do tim thu muc .mem
// bang cach thu lan luot nhieu vi tri, chon cai nao mo duoc file mau.
static std::string g_memdir;
static const std::string& memdir(){
    if (!g_memdir.empty()) return g_memdir;
    const char* cands[] = {
        MEMDIR,                        // 1. define luc compile (sandbox / tuy chinh)
        "../mem",                      // 2. chay tu hls\
        "../../../../../mem",          // 3. Vitis csim/cosim build dir -> Camera_AI\mem
        "../../../../mem",
        "../../../mem",
        "../../mem",
        "../../../../../../mem",
        "D:/CodeWSL/Camera_AI/mem",    // 4. duong dan tuyet doi da biet (Windows)
        "mem",
        "."
    };
    const char* sentinel = "conv1_w_bits.mem";
    for (unsigned k = 0; k < sizeof(cands)/sizeof(cands[0]); k++){
        std::string probe = std::string(cands[k]) + "/" + sentinel;
        FILE* fp = fopen(probe.c_str(), "r");
        if (fp){ fclose(fp); g_memdir = cands[k];
                 fprintf(stderr, "[TB] MEMDIR = %s\n", g_memdir.c_str());
                 return g_memdir; }
    }
    g_memdir = MEMDIR; // khong tim thay -> bao loi ro rang khi mo file
    fprintf(stderr, "[TB] CANH BAO: khong tim thay %s o cac vi tri thu; dung MEMDIR=%s\n", sentinel, g_memdir.c_str());
    return g_memdir;
}

static std::string path(const char* f){ return memdir() + "/" + f; }

// Doc file bit (moi dong '0'/'1') -> pack vao u32 words
static void load_bits_packed(const char* f, unsigned int* words, int nbits){
    int nwords = (nbits + 31) / 32;
    for (int i = 0; i < nwords; i++) words[i] = 0;
    FILE* fp = fopen(path(f).c_str(), "r");
    if (!fp){ fprintf(stderr, "[TB] khong mo duoc %s\n", path(f).c_str()); exit(1); }
    char buf[256]; int i = 0;
    while (i < nbits && fgets(buf, sizeof(buf), fp)){
        // bo qua dong rong
        char* p = buf; while (*p==' '||*p=='\t'||*p=='\r'||*p=='\n') p++;
        if (*p=='\0') continue;
        if (*p == '1') words[i>>5] |= (1u << (i & 31));
        i++;
    }
    fclose(fp);
    if (i != nbits){ fprintf(stderr, "[TB] %s: doc %d bit, can %d\n", f, i, nbits); exit(1); }
}

// Doc file hex 32-bit (signed)
static void load_hex32(const char* f, int* out, int n){
    FILE* fp = fopen(path(f).c_str(), "r");
    if (!fp){ fprintf(stderr, "[TB] khong mo duoc %s\n", path(f).c_str()); exit(1); }
    char buf[256]; int i = 0;
    while (i < n && fgets(buf, sizeof(buf), fp)){
        char* p = buf; while (*p==' '||*p=='\t'||*p=='\r'||*p=='\n') p++;
        if (*p=='\0') continue;
        // strtoull (64-bit unsigned) tren MOI nen tang; strtol bi bao hoa
        // toi 0x7FFFFFFF tren Windows (long = 32-bit) voi cac hex co MSB=1.
        unsigned long long v = strtoull(p, NULL, 16);
        out[i++] = (int)(int32_t)(uint32_t)(v & 0xffffffffULL);
    }
    fclose(fp);
    if (i != n){ fprintf(stderr, "[TB] %s: doc %d gia tri, can %d\n", f, i, n); exit(1); }
}

int main(){
    // ROM weight (packed u32) + tau/fc2 (int32)
    static unsigned int W1[W1_WORDS], W2[W2_WORDS], W3[W3_WORDS], WF1[WF1_WORDS];
    static int TAU1[C1_OC], TAU2[C2_OC], TAU3[C3_OC], TAUF1[FC1_OUT];
    static int WF2[FC2_OUT*FC1_OUT], BF2[FC2_OUT];

    load_bits_packed("conv1_w_bits.mem", W1, 288);
    load_bits_packed("conv2_w_bits.mem", W2, 18432);
    load_bits_packed("conv3_w_bits.mem", W3, 36864);
    load_bits_packed("fc1_w_bits.mem",  WF1, 131072);
    load_hex32("conv1_tau.mem", TAU1, C1_OC);
    load_hex32("conv2_tau.mem", TAU2, C2_OC);
    load_hex32("conv3_tau.mem", TAU3, C3_OC);
    load_hex32("fc1_tau.mem",  TAUF1, FC1_OUT);
    load_hex32("fc2_w.mem",    WF2,  FC2_OUT*FC1_OUT);
    load_hex32("fc2_b.mem",    BF2,  FC2_OUT);

    // Golden logits (sinh boi gen_hls_weights.py)
    int gold[8][3];
    { FILE* fp = fopen(path("golden_logits.mem").c_str(), "r");
      if (!fp){ fprintf(stderr, "[TB] khong mo duoc golden_logits.mem (chay gen_hls_weights.py truoc)\n"); return 1; }
      for (int t = 0; t < 8; t++) fscanf(fp, "%d %d %d", &gold[t][0], &gold[t][1], &gold[t][2]);
      fclose(fp); }

    static img_t img[IMG_H*IMG_W];
    int npass = 0;
    for (int t = 0; t < 8; t++){
        char fin[64]; snprintf(fin, sizeof(fin), "conv1_in_%d.mem", t);
        FILE* fp = fopen(path(fin).c_str(), "r");
        if (!fp){ fprintf(stderr, "[TB] khong mo duoc %s\n", path(fin).c_str()); return 1; }
        char buf[256]; int i = 0;
        while (i < IMG_H*IMG_W && fgets(buf, sizeof(buf), fp)){
            char* p = buf; while (*p==' '||*p=='\t'||*p=='\r'||*p=='\n') p++;
            if (*p=='\0') continue;
            unsigned long long v = strtoull(p, NULL, 16);
            img[i++] = (img_t)(int)(int32_t)(uint32_t)(v & 0xffffffffULL);
        }
        fclose(fp);
        if (i != IMG_H*IMG_W){ fprintf(stderr, "[TB] %s: doc %d, can %d\n", fin, i, IMG_H*IMG_W); return 1; }

        acc_t l0, l1; pred_t pr;
        bnn_top(img, W1, TAU1, W2, TAU2, W3, TAU3, WF1, TAUF1, WF2, BF2, l0, l1, pr);

        int gl0 = gold[t][0], gl1 = gold[t][1], glab = gold[t][2];
        bool ok = ((int)l0 == gl0) && ((int)l1 == gl1) && ((int)pr == glab);
        if (ok){ npass++; printf("test %d: PASS  logit0=%d logit1=%d pred=%d (label=%d)\n", t, (int)l0, (int)l1, (int)pr, glab); }
        else        printf("test %d: FAIL  got(%d,%d,pred=%d) exp(%d,%d,label=%d)\n", t, (int)l0, (int)l1, (int)pr, gl0, gl1, glab);
    }
    printf("==== %d/8 PASS ====\n", npass);
    return (npass == 8) ? 0 : 1;
}
