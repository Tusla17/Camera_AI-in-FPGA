; ModuleID = 'D:/CodeWSL/Camera_AI/hls/bnn_hls/sol1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind willreturn
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_bnn_top_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" "partition" %img, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="9" %W1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" %TAU1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="576" "partition" %W2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %TAU2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1152" "partition" %W3, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %TAU3, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %WF1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="128" %TAUF1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %WF2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" %BF2, i32* noalias nocapture nonnull align 4 dereferenceable(4) %logit0, i32* noalias nocapture nonnull align 4 dereferenceable(4) %logit1, i32* noalias nocapture nonnull align 4 dereferenceable(4) %pred) local_unnamed_addr #1 {
entry:
  %0 = bitcast i32* %img to [1024 x i32]*
  %_0 = call i8* @malloc(i64 1024)
  %_1 = call i8* @malloc(i64 1024)
  %_2 = call i8* @malloc(i64 1024)
  %_3 = call i8* @malloc(i64 1024)
  %img_copy_0 = bitcast i8* %_0 to [256 x i32]*
  %img_copy_1 = bitcast i8* %_1 to [256 x i32]*
  %img_copy_2 = bitcast i8* %_2 to [256 x i32]*
  %img_copy_3 = bitcast i8* %_3 to [256 x i32]*
  %_01 = getelementptr [256 x i32], [256 x i32]* %img_copy_0, i64 0, i64 0
  %_12 = getelementptr [256 x i32], [256 x i32]* %img_copy_1, i64 0, i64 0
  %_23 = getelementptr [256 x i32], [256 x i32]* %img_copy_2, i64 0, i64 0
  %_34 = getelementptr [256 x i32], [256 x i32]* %img_copy_3, i64 0, i64 0
  %1 = bitcast i32* %W1 to [9 x i32]*
  %W1_copy = alloca [9 x i32], align 512
  %2 = bitcast i32* %TAU1 to [32 x i32]*
  %TAU1_copy = alloca [32 x i32], align 512
  %3 = bitcast i32* %W2 to [576 x i32]*
  %W2_copy_0 = alloca [288 x i32], align 512
  %W2_copy_1 = alloca [288 x i32], align 512
  %_05 = getelementptr [288 x i32], [288 x i32]* %W2_copy_0, i64 0, i64 0
  %_16 = getelementptr [288 x i32], [288 x i32]* %W2_copy_1, i64 0, i64 0
  %4 = bitcast i32* %TAU2 to [64 x i32]*
  %TAU2_copy = alloca [64 x i32], align 512
  %5 = bitcast i32* %W3 to [1152 x i32]*
  %_07 = call i8* @malloc(i64 2304)
  %_18 = call i8* @malloc(i64 2304)
  %W3_copy_0 = bitcast i8* %_07 to [576 x i32]*
  %W3_copy_1 = bitcast i8* %_18 to [576 x i32]*
  %_09 = getelementptr [576 x i32], [576 x i32]* %W3_copy_0, i64 0, i64 0
  %_110 = getelementptr [576 x i32], [576 x i32]* %W3_copy_1, i64 0, i64 0
  %6 = bitcast i32* %TAU3 to [64 x i32]*
  %TAU3_copy = alloca [64 x i32], align 512
  %7 = bitcast i32* %WF1 to [4096 x i32]*
  %8 = call i8* @malloc(i64 16384)
  %WF1_copy = bitcast i8* %8 to [4096 x i32]*
  %9 = bitcast i32* %TAUF1 to [128 x i32]*
  %TAUF1_copy = alloca [128 x i32], align 512
  %10 = bitcast i32* %WF2 to [256 x i32]*
  %WF2_copy = alloca [256 x i32], align 512
  %11 = bitcast i32* %BF2 to [2 x i32]*
  %BF2_copy = alloca [2 x i32], align 512
  %logit0_copy = alloca i32, align 512
  %logit1_copy = alloca i32, align 512
  %pred_copy = alloca i32, align 512
  call void @copy_in([1024 x i32]* nonnull %0, [256 x i32]* %img_copy_0, [256 x i32]* %img_copy_1, [256 x i32]* %img_copy_2, [256 x i32]* %img_copy_3, [9 x i32]* nonnull %1, [9 x i32]* nonnull align 512 %W1_copy, [32 x i32]* nonnull %2, [32 x i32]* nonnull align 512 %TAU1_copy, [576 x i32]* nonnull %3, [288 x i32]* nonnull align 512 %W2_copy_0, [288 x i32]* nonnull align 512 %W2_copy_1, [64 x i32]* nonnull %4, [64 x i32]* nonnull align 512 %TAU2_copy, [1152 x i32]* nonnull %5, [576 x i32]* %W3_copy_0, [576 x i32]* %W3_copy_1, [64 x i32]* nonnull %6, [64 x i32]* nonnull align 512 %TAU3_copy, [4096 x i32]* nonnull %7, [4096 x i32]* %WF1_copy, [128 x i32]* nonnull %9, [128 x i32]* nonnull align 512 %TAUF1_copy, [256 x i32]* nonnull %10, [256 x i32]* nonnull align 512 %WF2_copy, [2 x i32]* nonnull %11, [2 x i32]* nonnull align 512 %BF2_copy, i32* nonnull %logit0, i32* nonnull align 512 %logit0_copy, i32* nonnull %logit1, i32* nonnull align 512 %logit1_copy, i32* nonnull %pred, i32* nonnull align 512 %pred_copy)
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_01, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_12, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_23, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_34, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_01, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_12, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_23, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_34, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_05, i32 999, i32 1, i32 1, i1 false) ], !dbg !76
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_16, i32 999, i32 1, i32 1, i1 false) ], !dbg !76
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_05, i32 998, i32 1, i32 0, i1 false) ], !dbg !76
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_16, i32 998, i32 1, i32 0, i1 false) ], !dbg !76
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_09, i32 999, i32 1, i32 1, i1 false) ], !dbg !77
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_110, i32 999, i32 1, i32 1, i1 false) ], !dbg !77
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_09, i32 998, i32 1, i32 0, i1 false) ], !dbg !77
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i32* %_110, i32 998, i32 1, i32 0, i1 false) ], !dbg !77
  call void @apatb_bnn_top_hw([256 x i32]* %img_copy_0, [256 x i32]* %img_copy_1, [256 x i32]* %img_copy_2, [256 x i32]* %img_copy_3, [9 x i32]* %W1_copy, [32 x i32]* %TAU1_copy, [288 x i32]* %W2_copy_0, [288 x i32]* %W2_copy_1, [64 x i32]* %TAU2_copy, [576 x i32]* %W3_copy_0, [576 x i32]* %W3_copy_1, [64 x i32]* %TAU3_copy, [4096 x i32]* %WF1_copy, [128 x i32]* %TAUF1_copy, [256 x i32]* %WF2_copy, [2 x i32]* %BF2_copy, i32* %logit0_copy, i32* %logit1_copy, i32* %pred_copy)
  call void @copy_back([1024 x i32]* %0, [256 x i32]* %img_copy_0, [256 x i32]* %img_copy_1, [256 x i32]* %img_copy_2, [256 x i32]* %img_copy_3, [9 x i32]* %1, [9 x i32]* %W1_copy, [32 x i32]* %2, [32 x i32]* %TAU1_copy, [576 x i32]* %3, [288 x i32]* %W2_copy_0, [288 x i32]* %W2_copy_1, [64 x i32]* %4, [64 x i32]* %TAU2_copy, [1152 x i32]* %5, [576 x i32]* %W3_copy_0, [576 x i32]* %W3_copy_1, [64 x i32]* %6, [64 x i32]* %TAU3_copy, [4096 x i32]* %7, [4096 x i32]* %WF1_copy, [128 x i32]* %9, [128 x i32]* %TAUF1_copy, [256 x i32]* %10, [256 x i32]* %WF2_copy, [2 x i32]* %11, [2 x i32]* %BF2_copy, i32* %logit0, i32* %logit0_copy, i32* %logit1, i32* %logit1_copy, i32* %pred, i32* %pred_copy)
  call void @free(i8* %_0)
  call void @free(i8* %_1)
  call void @free(i8* %_2)
  call void @free(i8* %_3)
  call void @free(i8* %_07)
  call void @free(i8* %_18)
  tail call void @free(i8* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024i32([1024 x i32]* "orig.arg.no"="0" %dst, [1024 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [1024 x i32]* %src, null
  %1 = icmp eq [1024 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x i32], [1024 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x i32], [1024 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* align 512 %dst, [9 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [9 x i32]* %dst, null
  %1 = icmp eq [9 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a9i32([9 x i32]* nonnull %dst, [9 x i32]* nonnull %src, i64 9)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a9i32([9 x i32]* %dst, [9 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [9 x i32]* %src, null
  %1 = icmp eq [9 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [9 x i32], [9 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [9 x i32], [9 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a32i32([32 x i32]* align 512 %dst, [32 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x i32]* %dst, null
  %1 = icmp eq [32 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32i32([32 x i32]* nonnull %dst, [32 x i32]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32i32([32 x i32]* %dst, [32 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x i32]* %src, null
  %1 = icmp eq [32 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x i32], [32 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x i32], [32 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a576i32([576 x i32]* "orig.arg.no"="0" %dst, [576 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [576 x i32]* %src, null
  %1 = icmp eq [576 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [576 x i32], [576 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [576 x i32], [576 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %dst, [64 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x i32]* %dst, null
  %1 = icmp eq [64 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a64i32([64 x i32]* nonnull %dst, [64 x i32]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64i32([64 x i32]* %dst, [64 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x i32]* %src, null
  %1 = icmp eq [64 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x i32], [64 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x i32], [64 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1152i32([1152 x i32]* "orig.arg.no"="0" %dst, [1152 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [1152 x i32]* %src, null
  %1 = icmp eq [1152 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1152 x i32], [1152 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1152 x i32], [1152 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %dst, [4096 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [4096 x i32]* %dst, null
  %1 = icmp eq [4096 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a4096i32([4096 x i32]* nonnull %dst, [4096 x i32]* nonnull %src, i64 4096)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4096i32([4096 x i32]* %dst, [4096 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [4096 x i32]* %src, null
  %1 = icmp eq [4096 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4096 x i32], [4096 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4096 x i32], [4096 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a128i32([128 x i32]* align 512 %dst, [128 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x i32]* %dst, null
  %1 = icmp eq [128 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a128i32([128 x i32]* nonnull %dst, [128 x i32]* nonnull %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a128i32([128 x i32]* %dst, [128 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x i32]* %src, null
  %1 = icmp eq [128 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x i32], [128 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [128 x i32], [128 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* align 512 %dst, [256 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [256 x i32]* %dst, null
  %1 = icmp eq [256 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a256i32([256 x i32]* nonnull %dst, [256 x i32]* nonnull %src, i64 256)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256i32([256 x i32]* %dst, [256 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [256 x i32]* %src, null
  %1 = icmp eq [256 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x i32], [256 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x i32], [256 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* align 512 %dst, [2 x i32]* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [2 x i32]* %dst, null
  %1 = icmp eq [2 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i32([2 x i32]* nonnull %dst, [2 x i32]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i32([2 x i32]* %dst, [2 x i32]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x i32]* %src, null
  %1 = icmp eq [2 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i32], [2 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x i32], [2 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %dst, i32* readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq i32* %dst, null
  %1 = icmp eq i32* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i32, i32* %src, align 4
  store i32 %3, i32* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #4

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024i32.4.5([256 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [1024 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [1024 x i32]* %src, null
  %1 = icmp eq [256 x i32]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 4
  %4 = urem i64 %for.loop.idx2, 4
  %dst.addr_0 = getelementptr [256 x i32], [256 x i32]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [256 x i32], [256 x i32]* %dst_1, i64 0, i64 %3
  %dst.addr_2 = getelementptr [256 x i32], [256 x i32]* %dst_2, i64 0, i64 %3
  %dst.addr_3 = getelementptr [256 x i32], [256 x i32]* %dst_3, i64 0, i64 %3
  %src.addr = getelementptr [1024 x i32], [1024 x i32]* %src, i64 0, i64 %for.loop.idx2
  %5 = load i32, i32* %src.addr, align 4
  switch i64 %4, label %dst.addr.case.3 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i32 %5, i32* %dst.addr_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i32 %5, i32* %dst.addr_1, align 4
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  store i32 %5, i32* %dst.addr_2, align 4
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  %6 = icmp eq i64 %4, 3
  call void @llvm.assume(i1 %6)
  store i32 %5, i32* %dst.addr_3, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a1024i32.3.6([256 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.2" %dst_2, [256 x i32]* "orig.arg.no"="0" "unpacked"="0.3" %dst_3, [1024 x i32]* readonly "orig.arg.no"="1" %src) #3 {
entry:
  %0 = icmp eq [256 x i32]* %dst_0, null
  %1 = icmp eq [1024 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1024i32.4.5([256 x i32]* nonnull %dst_0, [256 x i32]* %dst_1, [256 x i32]* %dst_2, [256 x i32]* %dst_3, [1024 x i32]* nonnull %src, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a576i32.8.9([288 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [288 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [576 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [576 x i32]* %src, null
  %1 = icmp eq [288 x i32]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr_0 = getelementptr [288 x i32], [288 x i32]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [288 x i32], [288 x i32]* %dst_1, i64 0, i64 %3
  %src.addr = getelementptr [576 x i32], [576 x i32]* %src, i64 0, i64 %for.loop.idx2
  %5 = load i32, i32* %src.addr, align 4
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  store i32 %5, i32* %dst.addr_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  %6 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %6)
  store i32 %5, i32* %dst.addr_1, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a576i32.7.10([288 x i32]* align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [288 x i32]* align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [576 x i32]* readonly "orig.arg.no"="1" %src) #3 {
entry:
  %0 = icmp eq [288 x i32]* %dst_0, null
  %1 = icmp eq [576 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a576i32.8.9([288 x i32]* nonnull %dst_0, [288 x i32]* %dst_1, [576 x i32]* nonnull %src, i64 576)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1152i32.12.13([576 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [576 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [1152 x i32]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [1152 x i32]* %src, null
  %1 = icmp eq [576 x i32]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr_0 = getelementptr [576 x i32], [576 x i32]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [576 x i32], [576 x i32]* %dst_1, i64 0, i64 %3
  %src.addr = getelementptr [1152 x i32], [1152 x i32]* %src, i64 0, i64 %for.loop.idx2
  %5 = load i32, i32* %src.addr, align 4
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  store i32 %5, i32* %dst.addr_0, align 4
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  %6 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %6)
  store i32 %5, i32* %dst.addr_1, align 4
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a1152i32.11.14([576 x i32]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [576 x i32]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [1152 x i32]* readonly "orig.arg.no"="1" %src) #3 {
entry:
  %0 = icmp eq [576 x i32]* %dst_0, null
  %1 = icmp eq [1152 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1152i32.12.13([576 x i32]* nonnull %dst_0, [576 x i32]* %dst_1, [1152 x i32]* nonnull %src, i64 1152)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_in([1024 x i32]* readonly "orig.arg.no"="0", [256 x i32]* "orig.arg.no"="1" "unpacked"="1.0" %_0, [256 x i32]* "orig.arg.no"="1" "unpacked"="1.1" %_1, [256 x i32]* "orig.arg.no"="1" "unpacked"="1.2" %_2, [256 x i32]* "orig.arg.no"="1" "unpacked"="1.3" %_3, [9 x i32]* readonly "orig.arg.no"="2", [9 x i32]* align 512 "orig.arg.no"="3", [32 x i32]* readonly "orig.arg.no"="4", [32 x i32]* align 512 "orig.arg.no"="5", [576 x i32]* readonly "orig.arg.no"="6", [288 x i32]* align 512 "orig.arg.no"="7" "unpacked"="7.0" %_01, [288 x i32]* align 512 "orig.arg.no"="7" "unpacked"="7.1" %_12, [64 x i32]* readonly "orig.arg.no"="8", [64 x i32]* align 512 "orig.arg.no"="9", [1152 x i32]* readonly "orig.arg.no"="10", [576 x i32]* "orig.arg.no"="11" "unpacked"="11.0" %_03, [576 x i32]* "orig.arg.no"="11" "unpacked"="11.1" %_14, [64 x i32]* readonly "orig.arg.no"="12", [64 x i32]* align 512 "orig.arg.no"="13", [4096 x i32]* readonly "orig.arg.no"="14", [4096 x i32]* "orig.arg.no"="15", [128 x i32]* readonly "orig.arg.no"="16", [128 x i32]* align 512 "orig.arg.no"="17", [256 x i32]* readonly "orig.arg.no"="18", [256 x i32]* align 512 "orig.arg.no"="19", [2 x i32]* readonly "orig.arg.no"="20", [2 x i32]* align 512 "orig.arg.no"="21", i32* readonly "orig.arg.no"="22", i32* align 512 "orig.arg.no"="23", i32* readonly "orig.arg.no"="24", i32* align 512 "orig.arg.no"="25", i32* readonly "orig.arg.no"="26", i32* align 512 "orig.arg.no"="27") #5 {
entry:
  call void @onebyonecpy_hls.p0a1024i32.3.6([256 x i32]* %_0, [256 x i32]* %_1, [256 x i32]* %_2, [256 x i32]* %_3, [1024 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* align 512 %2, [9 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a32i32([32 x i32]* align 512 %4, [32 x i32]* %3)
  call void @onebyonecpy_hls.p0a576i32.7.10([288 x i32]* align 512 %_01, [288 x i32]* align 512 %_12, [576 x i32]* %5)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %7, [64 x i32]* %6)
  call void @onebyonecpy_hls.p0a1152i32.11.14([576 x i32]* %_03, [576 x i32]* %_14, [1152 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %10, [64 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %12, [4096 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0a128i32([128 x i32]* align 512 %14, [128 x i32]* %13)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* align 512 %16, [256 x i32]* %15)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* align 512 %18, [2 x i32]* %17)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %20, i32* %19)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %22, i32* %21)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %24, i32* %23)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024i32.20.21([1024 x i32]* "orig.arg.no"="0" %dst, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [256 x i32]* %src_0, null
  %1 = icmp eq [1024 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 4
  %4 = urem i64 %for.loop.idx2, 4
  %dst.addr = getelementptr [1024 x i32], [1024 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [256 x i32], [256 x i32]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [256 x i32], [256 x i32]* %src_1, i64 0, i64 %3
  %src.addr_2 = getelementptr [256 x i32], [256 x i32]* %src_2, i64 0, i64 %3
  %src.addr_3 = getelementptr [256 x i32], [256 x i32]* %src_3, i64 0, i64 %3
  switch i64 %4, label %src.addr.case.3 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i32, i32* %src.addr_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load i32, i32* %src.addr_1, align 4
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  %_2 = load i32, i32* %src.addr_2, align 4
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  %5 = icmp eq i64 %4, 3
  call void @llvm.assume(i1 %5)
  %_3 = load i32, i32* %src.addr_3, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %6 = phi i32 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ %_2, %src.addr.case.2 ], [ %_3, %src.addr.case.3 ]
  store i32 %6, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a1024i32.19.22([1024 x i32]* "orig.arg.no"="0" %dst, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %src_2, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %src_3) #3 {
entry:
  %0 = icmp eq [1024 x i32]* %dst, null
  %1 = icmp eq [256 x i32]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1024i32.20.21([1024 x i32]* nonnull %dst, [256 x i32]* nonnull %src_0, [256 x i32]* %src_1, [256 x i32]* %src_2, [256 x i32]* %src_3, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a576i32.24.25([576 x i32]* "orig.arg.no"="0" %dst, [288 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [288 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [288 x i32]* %src_0, null
  %1 = icmp eq [576 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr = getelementptr [576 x i32], [576 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [288 x i32], [288 x i32]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [288 x i32], [288 x i32]* %src_1, i64 0, i64 %3
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i32, i32* %src.addr_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %5 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %5)
  %_1 = load i32, i32* %src.addr_1, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %6 = phi i32 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ]
  store i32 %6, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a576i32.23.26([576 x i32]* "orig.arg.no"="0" %dst, [288 x i32]* readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [288 x i32]* readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #3 {
entry:
  %0 = icmp eq [576 x i32]* %dst, null
  %1 = icmp eq [288 x i32]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a576i32.24.25([576 x i32]* nonnull %dst, [288 x i32]* nonnull %src_0, [288 x i32]* %src_1, i64 576)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1152i32.28.29([1152 x i32]* "orig.arg.no"="0" %dst, [576 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [576 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [576 x i32]* %src_0, null
  %1 = icmp eq [1152 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr = getelementptr [1152 x i32], [1152 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [576 x i32], [576 x i32]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [576 x i32], [576 x i32]* %src_1, i64 0, i64 %3
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i32, i32* %src.addr_0, align 4
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %5 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %5)
  %_1 = load i32, i32* %src.addr_1, align 4
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %6 = phi i32 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ]
  store i32 %6, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a1152i32.27.30([1152 x i32]* "orig.arg.no"="0" %dst, [576 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [576 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1) #3 {
entry:
  %0 = icmp eq [1152 x i32]* %dst, null
  %1 = icmp eq [576 x i32]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1152i32.28.29([1152 x i32]* nonnull %dst, [576 x i32]* nonnull %src_0, [576 x i32]* %src_1, i64 1152)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_out([1024 x i32]* "orig.arg.no"="0", [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [9 x i32]* "orig.arg.no"="2", [9 x i32]* readonly align 512 "orig.arg.no"="3", [32 x i32]* "orig.arg.no"="4", [32 x i32]* readonly align 512 "orig.arg.no"="5", [576 x i32]* "orig.arg.no"="6", [288 x i32]* readonly align 512 "orig.arg.no"="7" "unpacked"="7.0" %_01, [288 x i32]* readonly align 512 "orig.arg.no"="7" "unpacked"="7.1" %_12, [64 x i32]* "orig.arg.no"="8", [64 x i32]* readonly align 512 "orig.arg.no"="9", [1152 x i32]* "orig.arg.no"="10", [576 x i32]* readonly "orig.arg.no"="11" "unpacked"="11.0" %_03, [576 x i32]* readonly "orig.arg.no"="11" "unpacked"="11.1" %_14, [64 x i32]* "orig.arg.no"="12", [64 x i32]* readonly align 512 "orig.arg.no"="13", [4096 x i32]* "orig.arg.no"="14", [4096 x i32]* readonly "orig.arg.no"="15", [128 x i32]* "orig.arg.no"="16", [128 x i32]* readonly align 512 "orig.arg.no"="17", [256 x i32]* "orig.arg.no"="18", [256 x i32]* readonly align 512 "orig.arg.no"="19", [2 x i32]* "orig.arg.no"="20", [2 x i32]* readonly align 512 "orig.arg.no"="21", i32* "orig.arg.no"="22", i32* readonly align 512 "orig.arg.no"="23", i32* "orig.arg.no"="24", i32* readonly align 512 "orig.arg.no"="25", i32* "orig.arg.no"="26", i32* readonly align 512 "orig.arg.no"="27") #6 {
entry:
  call void @onebyonecpy_hls.p0a1024i32.19.22([1024 x i32]* %0, [256 x i32]* %_0, [256 x i32]* %_1, [256 x i32]* %_2, [256 x i32]* %_3)
  call fastcc void @onebyonecpy_hls.p0a9i32([9 x i32]* %1, [9 x i32]* align 512 %2)
  call fastcc void @onebyonecpy_hls.p0a32i32([32 x i32]* %3, [32 x i32]* align 512 %4)
  call void @onebyonecpy_hls.p0a576i32.23.26([576 x i32]* %5, [288 x i32]* align 512 %_01, [288 x i32]* align 512 %_12)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %6, [64 x i32]* align 512 %7)
  call void @onebyonecpy_hls.p0a1152i32.27.30([1152 x i32]* %8, [576 x i32]* %_03, [576 x i32]* %_14)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %9, [64 x i32]* align 512 %10)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %11, [4096 x i32]* %12)
  call fastcc void @onebyonecpy_hls.p0a128i32([128 x i32]* %13, [128 x i32]* align 512 %14)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* %15, [256 x i32]* align 512 %16)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* %17, [2 x i32]* align 512 %18)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %19, i32* align 512 %20)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %21, i32* align 512 %22)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %23, i32* align 512 %24)
  ret void
}

declare void @apatb_bnn_top_hw([256 x i32]*, [256 x i32]*, [256 x i32]*, [256 x i32]*, [9 x i32]*, [32 x i32]*, [288 x i32]*, [288 x i32]*, [64 x i32]*, [576 x i32]*, [576 x i32]*, [64 x i32]*, [4096 x i32]*, [128 x i32]*, [256 x i32]*, [2 x i32]*, i32*, i32*, i32*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @copy_back([1024 x i32]* "orig.arg.no"="0", [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.0" %_0, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.1" %_1, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.2" %_2, [256 x i32]* readonly "orig.arg.no"="1" "unpacked"="1.3" %_3, [9 x i32]* "orig.arg.no"="2", [9 x i32]* readonly align 512 "orig.arg.no"="3", [32 x i32]* "orig.arg.no"="4", [32 x i32]* readonly align 512 "orig.arg.no"="5", [576 x i32]* "orig.arg.no"="6", [288 x i32]* readonly align 512 "orig.arg.no"="7" "unpacked"="7.0" %_01, [288 x i32]* readonly align 512 "orig.arg.no"="7" "unpacked"="7.1" %_12, [64 x i32]* "orig.arg.no"="8", [64 x i32]* readonly align 512 "orig.arg.no"="9", [1152 x i32]* "orig.arg.no"="10", [576 x i32]* readonly "orig.arg.no"="11" "unpacked"="11.0" %_03, [576 x i32]* readonly "orig.arg.no"="11" "unpacked"="11.1" %_14, [64 x i32]* "orig.arg.no"="12", [64 x i32]* readonly align 512 "orig.arg.no"="13", [4096 x i32]* "orig.arg.no"="14", [4096 x i32]* readonly "orig.arg.no"="15", [128 x i32]* "orig.arg.no"="16", [128 x i32]* readonly align 512 "orig.arg.no"="17", [256 x i32]* "orig.arg.no"="18", [256 x i32]* readonly align 512 "orig.arg.no"="19", [2 x i32]* "orig.arg.no"="20", [2 x i32]* readonly align 512 "orig.arg.no"="21", i32* "orig.arg.no"="22", i32* readonly align 512 "orig.arg.no"="23", i32* "orig.arg.no"="24", i32* readonly align 512 "orig.arg.no"="25", i32* "orig.arg.no"="26", i32* readonly align 512 "orig.arg.no"="27") #6 {
entry:
  call fastcc void @onebyonecpy_hls.p0i32(i32* %19, i32* align 512 %20)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %21, i32* align 512 %22)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %23, i32* align 512 %24)
  ret void
}

declare void @bnn_top_hw_stub(i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull readonly, i32* noalias nocapture nonnull, i32* noalias nocapture nonnull, i32* noalias nocapture nonnull)

define void @bnn_top_hw_stub_wrapper([256 x i32]*, [256 x i32]*, [256 x i32]*, [256 x i32]*, [9 x i32]*, [32 x i32]*, [288 x i32]*, [288 x i32]*, [64 x i32]*, [576 x i32]*, [576 x i32]*, [64 x i32]*, [4096 x i32]*, [128 x i32]*, [256 x i32]*, [2 x i32]*, i32*, i32*, i32*) #7 {
entry:
  %19 = call i8* @malloc(i64 4096)
  %20 = bitcast i8* %19 to [1024 x i32]*
  %21 = call i8* @malloc(i64 2304)
  %22 = bitcast i8* %21 to [576 x i32]*
  %23 = call i8* @malloc(i64 4608)
  %24 = bitcast i8* %23 to [1152 x i32]*
  call void @copy_out([1024 x i32]* %20, [256 x i32]* %0, [256 x i32]* %1, [256 x i32]* %2, [256 x i32]* %3, [9 x i32]* null, [9 x i32]* %4, [32 x i32]* null, [32 x i32]* %5, [576 x i32]* %22, [288 x i32]* %6, [288 x i32]* %7, [64 x i32]* null, [64 x i32]* %8, [1152 x i32]* %24, [576 x i32]* %9, [576 x i32]* %10, [64 x i32]* null, [64 x i32]* %11, [4096 x i32]* null, [4096 x i32]* %12, [128 x i32]* null, [128 x i32]* %13, [256 x i32]* null, [256 x i32]* %14, [2 x i32]* null, [2 x i32]* %15, i32* null, i32* %16, i32* null, i32* %17, i32* null, i32* %18)
  %25 = bitcast [1024 x i32]* %20 to i32*
  %26 = bitcast [9 x i32]* %4 to i32*
  %27 = bitcast [32 x i32]* %5 to i32*
  %28 = bitcast [576 x i32]* %22 to i32*
  %29 = bitcast [64 x i32]* %8 to i32*
  %30 = bitcast [1152 x i32]* %24 to i32*
  %31 = bitcast [64 x i32]* %11 to i32*
  %32 = bitcast [4096 x i32]* %12 to i32*
  %33 = bitcast [128 x i32]* %13 to i32*
  %34 = bitcast [256 x i32]* %14 to i32*
  %35 = bitcast [2 x i32]* %15 to i32*
  call void @bnn_top_hw_stub(i32* %25, i32* %26, i32* %27, i32* %28, i32* %29, i32* %30, i32* %31, i32* %32, i32* %33, i32* %34, i32* %35, i32* %16, i32* %17, i32* %18)
  call void @copy_in([1024 x i32]* %20, [256 x i32]* %0, [256 x i32]* %1, [256 x i32]* %2, [256 x i32]* %3, [9 x i32]* null, [9 x i32]* %4, [32 x i32]* null, [32 x i32]* %5, [576 x i32]* %22, [288 x i32]* %6, [288 x i32]* %7, [64 x i32]* null, [64 x i32]* %8, [1152 x i32]* %24, [576 x i32]* %9, [576 x i32]* %10, [64 x i32]* null, [64 x i32]* %11, [4096 x i32]* null, [4096 x i32]* %12, [128 x i32]* null, [128 x i32]* %13, [256 x i32]* null, [256 x i32]* %14, [2 x i32]* null, [2 x i32]* %15, i32* null, i32* %16, i32* null, i32* %17, i32* null, i32* %18)
  call void @free(i8* %19)
  call void @free(i8* %21)
  call void @free(i8* %23)
  ret void
}

attributes #0 = { inaccessiblememonly nounwind willreturn }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { nounwind willreturn }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind willreturn "xlx.source"="infer-from-pragma" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}
!datalayout.transforms.on.top = !{!6, !16, !24}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = !{!7, !9, !11}
!7 = !{!8}
!8 = !{!"0", [1024 x i32]* null}
!9 = !{!10}
!10 = !{!"array_partition", !"type=Cyclic", !"dim=1", !"factor=4"}
!11 = !{!12, !13, !14, !15}
!12 = !{!"0.0", [256 x i32]* null}
!13 = !{!"0.1", [256 x i32]* null}
!14 = !{!"0.2", [256 x i32]* null}
!15 = !{!"0.3", [256 x i32]* null}
!16 = !{!17, !19, !21}
!17 = !{!18}
!18 = !{!"3", [576 x i32]* null}
!19 = !{!20}
!20 = !{!"array_partition", !"type=Cyclic", !"dim=1", !"factor=2"}
!21 = !{!22, !23}
!22 = !{!"3.0", [288 x i32]* null}
!23 = !{!"3.1", [288 x i32]* null}
!24 = !{!25, !19, !27}
!25 = !{!26}
!26 = !{!"5", [1152 x i32]* null}
!27 = !{!28, !29}
!28 = !{!"5.0", [576 x i32]* null}
!29 = !{!"5.1", [576 x i32]* null}
!30 = !DILocation(line: 42, column: 1, scope: !31)
!31 = distinct !DISubprogram(name: "bnn_top", linkageName: "_Z7bnn_topPKiPKjS0_S2_S0_S2_S0_S2_S0_S0_S0_RiS3_S3_", scope: !32, file: !32, line: 26, type: !33, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !49, variables: !5)
!32 = !DIFile(filename: "bnn.cpp", directory: "D:\5CCodeWSL\5CCamera_AI\5Chls")
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35, !40, !43, !40, !43, !40, !43, !40, !43, !43, !43, !45, !45, !47}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "img_t", file: !38, line: 36, baseType: !39)
!38 = !DIFile(filename: "./bnn.h", directory: "D:\5CCodeWSL\5CCamera_AI\5Chls")
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!42 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!45 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "acc_t", file: !38, line: 37, baseType: !39)
!47 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "pred_t", file: !38, line: 38, baseType: !39)
!49 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !50, producer: "AMD/Xilinx clang version 16.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !51, globals: !53, splitDebugInlining: false, gnuPubnames: true)
!50 = !DIFile(filename: "D:/CodeWSL/Camera_AI/hls/bnn_hls/sol1/.autopilot/db\5Cbnn.pp.0.cpp", directory: "D:\5CCodeWSL\5CCamera_AI\5Chls", checksumkind: CSK_MD5, checksum: "c05282ede6abeaa7008cde27c474451b")
!51 = !{!39, !52, !46}
!52 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!53 = !{!54, !59, !64, !69, !74}
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "l1", scope: !31, file: !32, line: 34, type: !56, isLocal: true, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 262144, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 8192)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "l2", scope: !31, file: !32, line: 35, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 131072, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 4096)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "l3", scope: !31, file: !32, line: 36, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 32768, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 1024)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "f1", scope: !31, file: !32, line: 37, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 4096, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 128)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(name: "ps", scope: !31, file: !32, line: 38, type: !66, isLocal: true, isDefinition: true)
!76 = !DILocation(line: 45, column: 1, scope: !31)
!77 = !DILocation(line: 46, column: 1, scope: !31)
