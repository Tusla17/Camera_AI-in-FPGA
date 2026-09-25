// Test co lap: chi include bnn_weights.h + doc vai phan tu.
// Neu csynth cai nay FAIL => bnn_weights.h lam crash preprocessing.
// Neu PASS => header OK, loi nam trong bnn.cpp.
#include "bnn_weights.h"
void hdr_top(int idx, int &s) {
    s = (int)W1[idx & 7]    + TAU1[idx & 31]
      + (int)W2[idx & 511]  + TAU2[idx & 63]
      + (int)W3[idx & 1023] + TAU3[idx & 63]
      + (int)WF1[idx & 4095]+ TAUF1[idx & 127]
      + WF2[idx & 255]      + BF2[idx & 1];
}
