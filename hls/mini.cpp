// Test toolchain toi thieu: neu csynth cai nay cung fail => loi la o Vitis/toolchain,
// khong phai code BNN.  Chay:  vitis-run --mode hls --tcl run_mini.tcl
void mini_top(const int a[8], int &s) {
    int t = 0;
    for (int i = 0; i < 8; i++) t += a[i];
    s = t;
}
