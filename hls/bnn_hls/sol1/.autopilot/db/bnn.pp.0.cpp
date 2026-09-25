# 1 "bnn.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 422 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "D:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot\\etc/autopilot_ssdm_op.h" 1
# 105 "D:/AMDDesignTools/2025.2/Vitis/common/technology/autopilot\\etc/autopilot_ssdm_op.h"
extern "C" {






    void _ssdm_op_IfRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_StreamRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned _ssdm_StreamSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_ReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Read(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_WriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Write(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_PrintNone(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintInt(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintDouble(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Return(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_Inline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecStable(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecStableContent(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBindPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipoDepth(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_DataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecLicense(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void __xilinx_ip_top(...) __attribute__ ((nothrow)) __attribute__((overloadable));


}
# 2 "<built-in>" 2
# 1 "bnn.cpp" 2
# 1 "./bnn.h" 1
# 36 "./bnn.h"
typedef int img_t;
typedef int acc_t;
typedef int pred_t;



__attribute__((sdx_kernel("bnn_top", 0))) void bnn_top(const img_t img[32*32],
             const unsigned int W1[9], const int TAU1[32],
             const unsigned int W2[576], const int TAU2[64],
             const unsigned int W3[1152], const int TAU3[64],
             const unsigned int WF1[4096],const int TAUF1[128],
             const int WF2[2*128], const int BF2[2],
             acc_t &logit0, acc_t &logit1, pred_t &pred);
# 2 "bnn.cpp" 2
# 26 "bnn.cpp"
__attribute__((sdx_kernel("bnn_top", 0))) void bnn_top(const img_t img[32*32],
             const unsigned int W1[9], const int TAU1[32],
             const unsigned int W2[576], const int TAU2[64],
             const unsigned int W3[1152], const int TAU3[64],
             const unsigned int WF1[4096],const int TAUF1[128],
             const int WF2[2*128], const int BF2[2],
             acc_t &logit0, acc_t &logit1, pred_t &pred) {
#line 9 "D:/CodeWSL/Camera_AI/hls/run_export.tcl"
#pragma HLSDIRECTIVE TOP name=bnn_top
# 32 "bnn.cpp"


    static int l1[32*16*16];
    static int l2[64*8*8];
    static int l3[64*4*4];
    static int f1[128];
    static int ps[32*32];



#pragma HLS ARRAY_PARTITION variable=img cyclic factor=4 dim=1
#pragma HLS ARRAY_PARTITION variable=l1 cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=l2 cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=W2 cyclic factor=2 dim=1
#pragma HLS ARRAY_PARTITION variable=W3 cyclic factor=2 dim=1


    VITIS_LOOP_49_1: for (int oc = 0; oc < 32; oc++) {
        VITIS_LOOP_50_2: for (int oh = 0; oh < 32; oh++)
            VITIS_LOOP_51_3: for (int ow = 0; ow < 32; ow++) {
#pragma HLS PIPELINE II=1
                int acc = 0;
                VITIS_LOOP_54_4: for (int kh = 0; kh < 3; kh++)
                    VITIS_LOOP_55_5: for (int kw = 0; kw < 3; kw++) {
                        int ih = oh + kh - 1, iw = ow + kw - 1;
                        if (ih >= 0 && ih < 32 && iw >= 0 && iw < 32) {
                            int v = (int)img[ih*32 + iw];
                            if (((int)(((W1)[(oc*9 + kh*3 + kw) >> 5] >> ((oc*9 + kh*3 + kw) & 31)) & 1u)) == 1) acc += v;
                            else acc -= v;
                        }
                    }
                ps[oh*32 + ow] = acc;
            }
        VITIS_LOOP_65_6: for (int ph = 0; ph < 16; ph++)
            VITIS_LOOP_66_7: for (int pw = 0; pw < 16; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph )*32 + (2*pw )];
                int s1 = ps[(2*ph )*32 + (2*pw+1)];
                int s2 = ps[(2*ph+1)*32 + (2*pw )];
                int s3 = ps[(2*ph+1)*32 + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l1[oc*(16*16) + (ph*16 + pw)] = (m > TAU1[oc]) ? 1 : 0;
            }
    }


    VITIS_LOOP_78_8: for (int oc = 0; oc < 64; oc++) {
        VITIS_LOOP_79_9: for (int oh = 0; oh < 16; oh++)
            VITIS_LOOP_80_10: for (int ow = 0; ow < 16; ow++) {
                int acc = 0;
                VITIS_LOOP_82_11: for (int ci = 0; ci < 32; ci++) {
#pragma HLS PIPELINE II=1
                    VITIS_LOOP_84_12: for (int kh = 0; kh < 3; kh++)
                        VITIS_LOOP_85_13: for (int kw = 0; kw < 3; kw++) {
                            int ih = oh + kh - 1, iw = ow + kw - 1;
                            if (ih >= 0 && ih < 16 && iw >= 0 && iw < 16) {
                                int a = l1[ci*16*16 + ih*16 + iw];
                                int w = ((int)(((W2)[(oc*(32*9) + ci*9 + kh*3 + kw) >> 5] >> ((oc*(32*9) + ci*9 + kh*3 + kw) & 31)) & 1u));
                                acc += (a == w) ? 1 : -1;
                            }
                        }
                }
                ps[oh*16 + ow] = acc;
            }
        VITIS_LOOP_96_14: for (int ph = 0; ph < 8; ph++)
            VITIS_LOOP_97_15: for (int pw = 0; pw < 8; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph )*16 + (2*pw )];
                int s1 = ps[(2*ph )*16 + (2*pw+1)];
                int s2 = ps[(2*ph+1)*16 + (2*pw )];
                int s3 = ps[(2*ph+1)*16 + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l2[oc*(8*8) + (ph*8 + pw)] = (((long long)m << 8) > TAU2[oc]) ? 1 : 0;
            }
    }


    VITIS_LOOP_109_16: for (int oc = 0; oc < 64; oc++) {
        VITIS_LOOP_110_17: for (int oh = 0; oh < 8; oh++)
            VITIS_LOOP_111_18: for (int ow = 0; ow < 8; ow++) {
                int acc = 0;
                VITIS_LOOP_113_19: for (int ci = 0; ci < 64; ci++) {
#pragma HLS PIPELINE II=1
                    VITIS_LOOP_115_20: for (int kh = 0; kh < 3; kh++)
                        VITIS_LOOP_116_21: for (int kw = 0; kw < 3; kw++) {
                            int ih = oh + kh - 1, iw = ow + kw - 1;
                            if (ih >= 0 && ih < 8 && iw >= 0 && iw < 8) {
                                int a = l2[ci*8*8 + ih*8 + iw];
                                int w = ((int)(((W3)[(oc*(64*9) + ci*9 + kh*3 + kw) >> 5] >> ((oc*(64*9) + ci*9 + kh*3 + kw) & 31)) & 1u));
                                acc += (a == w) ? 1 : -1;
                            }
                        }
                }
                ps[oh*8 + ow] = acc;
            }
        VITIS_LOOP_127_22: for (int ph = 0; ph < 4; ph++)
            VITIS_LOOP_128_23: for (int pw = 0; pw < 4; pw++) {
#pragma HLS PIPELINE II=1
                int s0 = ps[(2*ph )*8 + (2*pw )];
                int s1 = ps[(2*ph )*8 + (2*pw+1)];
                int s2 = ps[(2*ph+1)*8 + (2*pw )];
                int s3 = ps[(2*ph+1)*8 + (2*pw+1)];
                int m = s0; if (s1>m) m=s1; if (s2>m) m=s2; if (s3>m) m=s3;
                l3[oc*(4*4) + (ph*4 + pw)] = (((long long)m << 8) > TAU3[oc]) ? 1 : 0;
            }
    }


    VITIS_LOOP_140_24: for (int n = 0; n < 128; n++) {
        int acc = 0;
        VITIS_LOOP_142_25: for (int k = 0; k < 1024; k++) {
#pragma HLS PIPELINE II=1
            int a = l3[k];
            int w = ((int)(((WF1)[(n*1024 + k) >> 5] >> ((n*1024 + k) & 31)) & 1u));
            acc += (a == w) ? 1 : -1;
        }
        f1[n] = (((long long)acc << 8) > TAUF1[n]) ? 1 : 0;
    }


    long long a0 = BF2[0], a1 = BF2[1];
    VITIS_LOOP_153_26: for (int k = 0; k < 128; k++) {
#pragma HLS PIPELINE II=1
        long long w0 = WF2[0*128 + k];
        long long w1 = WF2[1*128 + k];
        a0 += f1[k] ? w0 : -w0;
        a1 += f1[k] ? w1 : -w1;
    }
    logit0 = (acc_t)(int)a0;
    logit1 = (acc_t)(int)a1;
    pred = (a1 > a0) ? 1 : 0;
}
