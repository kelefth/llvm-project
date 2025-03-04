; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=loop-versioning -S < %s | FileCheck %s

; NB: addrspaces 10-13 are non-integral
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128-ni:10:11:12:13"

%jl_value_t = type opaque
%jl_array_t = type { i8 addrspace(13)*, i64, i16, i16, i32 }

define void @test(%jl_value_t addrspace(10)** %arg) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  L74.lver.check:
; CHECK-NEXT:    [[I:%.*]] = alloca [3 x i64], align 8
; CHECK-NEXT:    [[I1:%.*]] = load [[JL_VALUE_T:%.*]] addrspace(10)*, [[JL_VALUE_T]] addrspace(10)** [[ARG:%.*]], align 8
; CHECK-NEXT:    [[I2:%.*]] = getelementptr inbounds [[JL_VALUE_T]] addrspace(10)*, [[JL_VALUE_T]] addrspace(10)** [[ARG]], i64 1
; CHECK-NEXT:    [[I3:%.*]] = load [[JL_VALUE_T]] addrspace(10)*, [[JL_VALUE_T]] addrspace(10)** [[I2]], align 8
; CHECK-NEXT:    [[I4:%.*]] = getelementptr inbounds [3 x i64], [3 x i64]* [[I]], i64 0, i64 0
; CHECK-NEXT:    store i64 1, i64* [[I4]], align 8
; CHECK-NEXT:    [[I5:%.*]] = getelementptr inbounds [3 x i64], [3 x i64]* [[I]], i64 0, i64 1
; CHECK-NEXT:    [[I6:%.*]] = load i64, i64* inttoptr (i64 24 to i64*), align 8
; CHECK-NEXT:    [[I7:%.*]] = addrspacecast [[JL_VALUE_T]] addrspace(10)* [[I3]] to [[JL_VALUE_T]] addrspace(11)*
; CHECK-NEXT:    [[I8:%.*]] = bitcast [[JL_VALUE_T]] addrspace(11)* [[I7]] to double addrspace(13)* addrspace(11)*
; CHECK-NEXT:    [[I9:%.*]] = load double addrspace(13)*, double addrspace(13)* addrspace(11)* [[I8]], align 8
; CHECK-NEXT:    [[I10:%.*]] = addrspacecast [[JL_VALUE_T]] addrspace(10)* [[I1]] to [[JL_VALUE_T]] addrspace(11)*
; CHECK-NEXT:    [[I11:%.*]] = bitcast [[JL_VALUE_T]] addrspace(11)* [[I10]] to double addrspace(13)* addrspace(11)*
; CHECK-NEXT:    [[I12:%.*]] = load double addrspace(13)*, double addrspace(13)* addrspace(11)* [[I11]], align 8
; CHECK-NEXT:    [[I121:%.*]] = bitcast double addrspace(13)* [[I12]] to i8 addrspace(13)*
; CHECK-NEXT:    [[I13:%.*]] = load i64, i64* [[I5]], align 8
; CHECK-NEXT:    [[SCEVGEP:%.*]] = getelementptr double, double addrspace(13)* [[I12]], i64 [[I6]]
; CHECK-NEXT:    [[SCEVGEP2:%.*]] = bitcast double addrspace(13)* [[SCEVGEP]] to i8 addrspace(13)*
; CHECK-NEXT:    [[TMP0:%.*]] = add i64 [[I6]], -1
; CHECK-NEXT:    [[TMP1:%.*]] = mul i64 [[I13]], [[TMP0]]
; CHECK-NEXT:    [[SCEVGEP3:%.*]] = getelementptr double, double addrspace(13)* [[I9]], i64 [[TMP1]]
; CHECK-NEXT:    [[TMP2:%.*]] = icmp ult double addrspace(13)* [[I9]], [[SCEVGEP3]]
; CHECK-NEXT:    [[UMIN:%.*]] = select i1 [[TMP2]], double addrspace(13)* [[I9]], double addrspace(13)* [[SCEVGEP3]]
; CHECK-NEXT:    [[UMIN4:%.*]] = bitcast double addrspace(13)* [[UMIN]] to i8 addrspace(13)*
; CHECK-NEXT:    [[TMP3:%.*]] = icmp ugt double addrspace(13)* [[I9]], [[SCEVGEP3]]
; CHECK-NEXT:    [[UMAX:%.*]] = select i1 [[TMP3]], double addrspace(13)* [[I9]], double addrspace(13)* [[SCEVGEP3]]
; CHECK-NEXT:    [[SCEVGEP5:%.*]] = getelementptr double, double addrspace(13)* [[UMAX]], i64 1
; CHECK-NEXT:    [[SCEVGEP56:%.*]] = bitcast double addrspace(13)* [[SCEVGEP5]] to i8 addrspace(13)*
; CHECK-NEXT:    [[BOUND0:%.*]] = icmp ult i8 addrspace(13)* [[I121]], [[SCEVGEP56]]
; CHECK-NEXT:    [[BOUND1:%.*]] = icmp ult i8 addrspace(13)* [[UMIN4]], [[SCEVGEP2]]
; CHECK-NEXT:    [[FOUND_CONFLICT:%.*]] = and i1 [[BOUND0]], [[BOUND1]]
; CHECK-NEXT:    br i1 [[FOUND_CONFLICT]], label [[L74_PH_LVER_ORIG:%.*]], label [[L74_PH:%.*]]
; CHECK:       L74.ph.lver.orig:
; CHECK-NEXT:    br label [[L74_LVER_ORIG:%.*]]
; CHECK:       L74.lver.orig:
; CHECK-NEXT:    [[VALUE_PHI20_LVER_ORIG:%.*]] = phi i64 [ 1, [[L74_PH_LVER_ORIG]] ], [ [[I21_LVER_ORIG:%.*]], [[L74_LVER_ORIG]] ]
; CHECK-NEXT:    [[VALUE_PHI21_LVER_ORIG:%.*]] = phi i64 [ 1, [[L74_PH_LVER_ORIG]] ], [ [[I22_LVER_ORIG:%.*]], [[L74_LVER_ORIG]] ]
; CHECK-NEXT:    [[VALUE_PHI22_LVER_ORIG:%.*]] = phi i64 [ 1, [[L74_PH_LVER_ORIG]] ], [ [[I24_LVER_ORIG:%.*]], [[L74_LVER_ORIG]] ]
; CHECK-NEXT:    [[I14_LVER_ORIG:%.*]] = add i64 [[VALUE_PHI21_LVER_ORIG]], -1
; CHECK-NEXT:    [[I15_LVER_ORIG:%.*]] = getelementptr inbounds double, double addrspace(13)* [[I9]], i64 [[I14_LVER_ORIG]]
; CHECK-NEXT:    [[I16_LVER_ORIG:%.*]] = bitcast double addrspace(13)* [[I15_LVER_ORIG]] to i64 addrspace(13)*
; CHECK-NEXT:    [[I17_LVER_ORIG:%.*]] = load i64, i64 addrspace(13)* [[I16_LVER_ORIG]], align 8
; CHECK-NEXT:    [[I18_LVER_ORIG:%.*]] = add i64 [[VALUE_PHI20_LVER_ORIG]], -1
; CHECK-NEXT:    [[I19_LVER_ORIG:%.*]] = getelementptr inbounds double, double addrspace(13)* [[I12]], i64 [[I18_LVER_ORIG]]
; CHECK-NEXT:    [[I20_LVER_ORIG:%.*]] = bitcast double addrspace(13)* [[I19_LVER_ORIG]] to i64 addrspace(13)*
; CHECK-NEXT:    store i64 [[I17_LVER_ORIG]], i64 addrspace(13)* [[I20_LVER_ORIG]], align 8
; CHECK-NEXT:    [[I21_LVER_ORIG]] = add i64 [[VALUE_PHI20_LVER_ORIG]], 1
; CHECK-NEXT:    [[I22_LVER_ORIG]] = add i64 [[I13]], [[VALUE_PHI21_LVER_ORIG]]
; CHECK-NEXT:    [[I23_LVER_ORIG:%.*]] = icmp eq i64 [[VALUE_PHI22_LVER_ORIG]], [[I6]]
; CHECK-NEXT:    [[I24_LVER_ORIG]] = add i64 [[VALUE_PHI22_LVER_ORIG]], 1
; CHECK-NEXT:    br i1 [[I23_LVER_ORIG]], label [[L94_LOOPEXIT:%.*]], label [[L74_LVER_ORIG]]
; CHECK:       L74.ph:
; CHECK-NEXT:    br label [[L74:%.*]]
; CHECK:       L74:
; CHECK-NEXT:    [[VALUE_PHI20:%.*]] = phi i64 [ 1, [[L74_PH]] ], [ [[I21:%.*]], [[L74]] ]
; CHECK-NEXT:    [[VALUE_PHI21:%.*]] = phi i64 [ 1, [[L74_PH]] ], [ [[I22:%.*]], [[L74]] ]
; CHECK-NEXT:    [[VALUE_PHI22:%.*]] = phi i64 [ 1, [[L74_PH]] ], [ [[I24:%.*]], [[L74]] ]
; CHECK-NEXT:    [[I14:%.*]] = add i64 [[VALUE_PHI21]], -1
; CHECK-NEXT:    [[I15:%.*]] = getelementptr inbounds double, double addrspace(13)* [[I9]], i64 [[I14]]
; CHECK-NEXT:    [[I16:%.*]] = bitcast double addrspace(13)* [[I15]] to i64 addrspace(13)*
; CHECK-NEXT:    [[I17:%.*]] = load i64, i64 addrspace(13)* [[I16]], align 8, !alias.scope !0
; CHECK-NEXT:    [[I18:%.*]] = add i64 [[VALUE_PHI20]], -1
; CHECK-NEXT:    [[I19:%.*]] = getelementptr inbounds double, double addrspace(13)* [[I12]], i64 [[I18]]
; CHECK-NEXT:    [[I20:%.*]] = bitcast double addrspace(13)* [[I19]] to i64 addrspace(13)*
; CHECK-NEXT:    store i64 [[I17]], i64 addrspace(13)* [[I20]], align 8, !alias.scope !3, !noalias !0
; CHECK-NEXT:    [[I21]] = add i64 [[VALUE_PHI20]], 1
; CHECK-NEXT:    [[I22]] = add i64 [[I13]], [[VALUE_PHI21]]
; CHECK-NEXT:    [[I23:%.*]] = icmp eq i64 [[VALUE_PHI22]], [[I6]]
; CHECK-NEXT:    [[I24]] = add i64 [[VALUE_PHI22]], 1
; CHECK-NEXT:    br i1 [[I23]], label [[L94_LOOPEXIT7:%.*]], label [[L74]]
; CHECK:       L94.loopexit:
; CHECK-NEXT:    br label [[L94:%.*]]
; CHECK:       L94.loopexit7:
; CHECK-NEXT:    br label [[L94]]
; CHECK:       L94:
; CHECK-NEXT:    ret void
;
top:
  %i = alloca [3 x i64], align 8
  %i1 = load %jl_value_t addrspace(10)*, %jl_value_t addrspace(10)** %arg, align 8
  %i2 = getelementptr inbounds %jl_value_t addrspace(10)*, %jl_value_t addrspace(10)** %arg, i64 1
  %i3 = load %jl_value_t addrspace(10)*, %jl_value_t addrspace(10)** %i2, align 8
  %i4 = getelementptr inbounds [3 x i64], [3 x i64]* %i, i64 0, i64 0
  store i64 1, i64* %i4, align 8
  %i5 = getelementptr inbounds [3 x i64], [3 x i64]* %i, i64 0, i64 1
  %i6 = load i64, i64* inttoptr (i64 24 to i64*), align 8
  %i7 = addrspacecast %jl_value_t addrspace(10)* %i3 to %jl_value_t addrspace(11)*
  %i8 = bitcast %jl_value_t addrspace(11)* %i7 to double addrspace(13)* addrspace(11)*
  %i9 = load double addrspace(13)*, double addrspace(13)* addrspace(11)* %i8, align 8
  %i10 = addrspacecast %jl_value_t addrspace(10)* %i1 to %jl_value_t addrspace(11)*
  %i11 = bitcast %jl_value_t addrspace(11)* %i10 to double addrspace(13)* addrspace(11)*
  %i12 = load double addrspace(13)*, double addrspace(13)* addrspace(11)* %i11, align 8
  %i13 = load i64, i64* %i5, align 8
  br label %L74

L74:                                              ; preds = %L74, %top
  %value_phi20 = phi i64 [ 1, %top ], [ %i21, %L74 ]
  %value_phi21 = phi i64 [ 1, %top ], [ %i22, %L74 ]
  %value_phi22 = phi i64 [ 1, %top ], [ %i24, %L74 ]
  %i14 = add i64 %value_phi21, -1
  %i15 = getelementptr inbounds double, double addrspace(13)* %i9, i64 %i14
  %i16 = bitcast double addrspace(13)* %i15 to i64 addrspace(13)*
  %i17 = load i64, i64 addrspace(13)* %i16, align 8
  %i18 = add i64 %value_phi20, -1
  %i19 = getelementptr inbounds double, double addrspace(13)* %i12, i64 %i18
  %i20 = bitcast double addrspace(13)* %i19 to i64 addrspace(13)*
  store i64 %i17, i64 addrspace(13)* %i20, align 8
  %i21 = add i64 %value_phi20, 1
  %i22 = add i64 %i13, %value_phi21
  %i23 = icmp eq i64 %value_phi22, %i6
  %i24 = add i64 %value_phi22, 1
  br i1 %i23, label %L94, label %L74

L94:                                              ; preds = %L74
  ret void
}
