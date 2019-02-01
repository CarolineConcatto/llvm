; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse4.1 | FileCheck %s --check-prefixes=ALL,SSE
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx    | FileCheck %s --check-prefixes=ALL,AVX,AVX1
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx2   | FileCheck %s --check-prefixes=ALL,AVX,AVX2

define <16 x i8> @load8_ins_elt0_v16i8(i8* %p) nounwind {
; SSE-LABEL: load8_ins_elt0_v16i8:
; SSE:       # %bb.0:
; SSE-NEXT:    movzbl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX1-LABEL: load8_ins_elt0_v16i8:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzbl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load8_ins_elt0_v16i8:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastb (%rdi), %xmm0
; AVX2-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <16 x i8> undef, i8 %x, i32 0
  ret <16 x i8> %ins
}

define <8 x i16> @load16_ins_elt0_v8i16(i16* %p) nounwind {
; SSE-LABEL: load16_ins_elt0_v8i16:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX1-LABEL: load16_ins_elt0_v8i16:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzwl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load16_ins_elt0_v8i16:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastw (%rdi), %xmm0
; AVX2-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <8 x i16> undef, i16 %x, i32 0
  ret <8 x i16> %ins
}

define <4 x i32> @load32_ins_elt0_v4i32(i32* %p) nounwind {
; SSE-LABEL: load32_ins_elt0_v4i32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_elt0_v4i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <4 x i32> undef, i32 %x, i32 0
  ret <4 x i32> %ins
}

define <2 x i64> @load64_ins_elt0_v2i64(i64* %p) nounwind {
; SSE-LABEL: load64_ins_elt0_v2i64:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_elt0_v2i64:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <2 x i64> undef, i64 %x, i32 0
  ret <2 x i64> %ins
}

define <4 x float> @load32_ins_elt0_v4f32(float* %p) nounwind {
; SSE-LABEL: load32_ins_elt0_v4f32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_elt0_v4f32:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <4 x float> undef, float %x, i32 0
  ret <4 x float> %ins
}

define <2 x double> @load64_ins_elt0_v2f64(double* %p) nounwind {
; SSE-LABEL: load64_ins_elt0_v2f64:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_elt0_v2f64:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <2 x double> undef, double %x, i32 0
  ret <2 x double> %ins
}

define <16 x i8> @load8_ins_eltc_v16i8(i8* %p) nounwind {
; SSE-LABEL: load8_ins_eltc_v16i8:
; SSE:       # %bb.0:
; SSE-NEXT:    movzbl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    pslld $24, %xmm0
; SSE-NEXT:    retq
;
; AVX1-LABEL: load8_ins_eltc_v16i8:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzbl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    vpslld $24, %xmm0, %xmm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load8_ins_eltc_v16i8:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastb (%rdi), %xmm0
; AVX2-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <16 x i8> undef, i8 %x, i32 3
  ret <16 x i8> %ins
}

define <8 x i16> @load16_ins_eltc_v8i16(i16* %p) nounwind {
; SSE-LABEL: load16_ins_eltc_v8i16:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    pslldq {{.*#+}} xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5]
; SSE-NEXT:    retq
;
; AVX1-LABEL: load16_ins_eltc_v8i16:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzwl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    vpslldq {{.*#+}} xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3,4,5]
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load16_ins_eltc_v8i16:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastw (%rdi), %xmm0
; AVX2-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <8 x i16> undef, i16 %x, i32 5
  ret <8 x i16> %ins
}

define <4 x i32> @load32_ins_eltc_v4i32(i32* %p) nounwind {
; SSE-LABEL: load32_ins_eltc_v4i32:
; SSE:       # %bb.0:
; SSE-NEXT:    movd {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,0,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_eltc_v4i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastss (%rdi), %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <4 x i32> undef, i32 %x, i32 2
  ret <4 x i32> %ins
}

define <2 x i64> @load64_ins_eltc_v2i64(i64* %p) nounwind {
; SSE-LABEL: load64_ins_eltc_v2i64:
; SSE:       # %bb.0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,1,0,1]
; SSE-NEXT:    retq
;
; AVX1-LABEL: load64_ins_eltc_v2i64:
; AVX1:       # %bb.0:
; AVX1-NEXT:    vmovddup {{.*#+}} xmm0 = mem[0,0]
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load64_ins_eltc_v2i64:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastq (%rdi), %xmm0
; AVX2-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <2 x i64> undef, i64 %x, i32 1
  ret <2 x i64> %ins
}

define <4 x float> @load32_ins_eltc_v4f32(float* %p) nounwind {
; SSE-LABEL: load32_ins_eltc_v4f32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1,2,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_eltc_v4f32:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastss (%rdi), %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <4 x float> undef, float %x, i32 3
  ret <4 x float> %ins
}

define <2 x double> @load64_ins_eltc_v2f64(double* %p) nounwind {
; SSE-LABEL: load64_ins_eltc_v2f64:
; SSE:       # %bb.0:
; SSE-NEXT:    movddup {{.*#+}} xmm0 = mem[0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_eltc_v2f64:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovddup {{.*#+}} xmm0 = mem[0,0]
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <2 x double> undef, double %x, i32 1
  ret <2 x double> %ins
}

define <32 x i8> @load8_ins_elt0_v32i8(i8* %p) nounwind {
; SSE-LABEL: load8_ins_elt0_v32i8:
; SSE:       # %bb.0:
; SSE-NEXT:    movzbl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX1-LABEL: load8_ins_elt0_v32i8:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzbl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load8_ins_elt0_v32i8:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastb (%rdi), %ymm0
; AVX2-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <32 x i8> undef, i8 %x, i32 0
  ret <32 x i8> %ins
}

define <16 x i16> @load16_ins_elt0_v16i16(i16* %p) nounwind {
; SSE-LABEL: load16_ins_elt0_v16i16:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX1-LABEL: load16_ins_elt0_v16i16:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzwl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load16_ins_elt0_v16i16:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastw (%rdi), %ymm0
; AVX2-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <16 x i16> undef, i16 %x, i32 0
  ret <16 x i16> %ins
}

define <8 x i32> @load32_ins_elt0_v8i32(i32* %p) nounwind {
; SSE-LABEL: load32_ins_elt0_v8i32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_elt0_v8i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <8 x i32> undef, i32 %x, i32 0
  ret <8 x i32> %ins
}

define <4 x i64> @load64_ins_elt0_v4i64(i64* %p) nounwind {
; SSE-LABEL: load64_ins_elt0_v4i64:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_elt0_v4i64:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <4 x i64> undef, i64 %x, i32 0
  ret <4 x i64> %ins
}

define <8 x float> @load32_ins_elt0_v8f32(float* %p) nounwind {
; SSE-LABEL: load32_ins_elt0_v8f32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_elt0_v8f32:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <8 x float> undef, float %x, i32 0
  ret <8 x float> %ins
}

define <4 x double> @load64_ins_elt0_v4f64(double* %p) nounwind {
; SSE-LABEL: load64_ins_elt0_v4f64:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_elt0_v4f64:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <4 x double> undef, double %x, i32 0
  ret <4 x double> %ins
}

define <32 x i8> @load8_ins_eltc_v32i8(i8* %p) nounwind {
; SSE-LABEL: load8_ins_eltc_v32i8:
; SSE:       # %bb.0:
; SSE-NEXT:    movzbl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm1
; SSE-NEXT:    psllq $40, %xmm1
; SSE-NEXT:    retq
;
; AVX1-LABEL: load8_ins_eltc_v32i8:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzbl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    vpsllq $40, %xmm0, %xmm0
; AVX1-NEXT:    vinsertf128 $1, %xmm0, %ymm0, %ymm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load8_ins_eltc_v32i8:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastb (%rdi), %ymm0
; AVX2-NEXT:    retq
  %x = load i8, i8* %p
  %ins = insertelement <32 x i8> undef, i8 %x, i32 21
  ret <32 x i8> %ins
}

define <16 x i16> @load16_ins_eltc_v16i16(i16* %p) nounwind {
; SSE-LABEL: load16_ins_eltc_v16i16:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm1
; SSE-NEXT:    psllq $48, %xmm1
; SSE-NEXT:    retq
;
; AVX1-LABEL: load16_ins_eltc_v16i16:
; AVX1:       # %bb.0:
; AVX1-NEXT:    movzwl (%rdi), %eax
; AVX1-NEXT:    vmovd %eax, %xmm0
; AVX1-NEXT:    vpsllq $48, %xmm0, %xmm0
; AVX1-NEXT:    vinsertf128 $1, %xmm0, %ymm0, %ymm0
; AVX1-NEXT:    retq
;
; AVX2-LABEL: load16_ins_eltc_v16i16:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastw (%rdi), %ymm0
; AVX2-NEXT:    retq
  %x = load i16, i16* %p
  %ins = insertelement <16 x i16> undef, i16 %x, i32 11
  ret <16 x i16> %ins
}

define <8 x i32> @load32_ins_eltc_v8i32(i32* %p) nounwind {
; SSE-LABEL: load32_ins_eltc_v8i32:
; SSE:       # %bb.0:
; SSE-NEXT:    movd {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    pshufd {{.*#+}} xmm1 = xmm0[0,1,2,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_eltc_v8i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastss (%rdi), %ymm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %ins = insertelement <8 x i32> undef, i32 %x, i32 7
  ret <8 x i32> %ins
}

define <4 x i64> @load64_ins_eltc_v4i64(i64* %p) nounwind {
; SSE-LABEL: load64_ins_eltc_v4i64:
; SSE:       # %bb.0:
; SSE-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    pshufd {{.*#+}} xmm1 = xmm0[0,1,0,1]
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_eltc_v4i64:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastsd (%rdi), %ymm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %ins = insertelement <4 x i64> undef, i64 %x, i32 3
  ret <4 x i64> %ins
}

define <8 x float> @load32_ins_eltc_v8f32(float* %p) nounwind {
; SSE-LABEL: load32_ins_eltc_v8f32:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    movsldup {{.*#+}} xmm1 = xmm0[0,0,2,2]
; SSE-NEXT:    retq
;
; AVX-LABEL: load32_ins_eltc_v8f32:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastss (%rdi), %ymm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %ins = insertelement <8 x float> undef, float %x, i32 5
  ret <8 x float> %ins
}

define <4 x double> @load64_ins_eltc_v4f64(double* %p) nounwind {
; SSE-LABEL: load64_ins_eltc_v4f64:
; SSE:       # %bb.0:
; SSE-NEXT:    movddup {{.*#+}} xmm1 = mem[0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: load64_ins_eltc_v4f64:
; AVX:       # %bb.0:
; AVX-NEXT:    vbroadcastsd (%rdi), %ymm0
; AVX-NEXT:    retq
  %x = load double, double* %p
  %ins = insertelement <4 x double> undef, double %x, i32 3
  ret <4 x double> %ins
}

