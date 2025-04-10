// Auto-generated file. Do not edit!
//   Template: src/qs8-gemm/1x16c4-aarch64-neondot-ld32.S.in
//   Generator: tools/xngen
//
// Copyright 2020 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.


#include <xnnpack/assembly.h>

# void xnn_qs8_gemm_minmax_rndnu_ukernel_1x16c4__aarch64_neondot_ld32(
#     size_t mr,                 x0
#     size_t nc,                 x1
#     size_t kc,                 x2 / x0
#     const int8_t* restrict a,  x3
#     size_t a_stride,           (x4)
#     const void* restrict w,    x5
#     int8_t* restrict c,        x6
#     size_t cm_stride,          (x7)
#     size_t cn_stride,          [sp] -> x12
#     const union xnn_qs8_conv_minmax_params params)  [sp + 8] -> x11

# d8-d15, x19-x30 need to be preserved if used. x18 is reserved by the OS.

# Register usage
# A0  x3 v0
# B   x5 v16 v17 v18 v19
# C0  x6 v28 v29 v30 v31
# unused v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15

BEGIN_FUNCTION xnn_qs8_gemm_minmax_rndnu_ukernel_1x16c4__aarch64_neondot_ld32
0:
        # Load initial bias from w into accumulators
        ADD     x2, x2, 3               // kc = (kc + 3) & ~3
        LDP     q28, q29, [x5], 32
        BIC     x2, x2, 3
        LDP     q30, q31, [x5], 32
        MOV     x0, x2                  // k = kc.  assumes kc > 0
        LDR     x11, [sp, 8]            // params

        # Main loop - 4 bytes of A
        .p2align 3
1:
        LDR     s0,  [x3], 4
        LDR     q16, [x5], 16
        LDR     q17, [x5], 16
        LDR     q18, [x5], 16
        LDR     q19, [x5], 16
        SDOT    v28.4s, v16.16b, v0.4b[0]
        SDOT    v29.4s, v17.16b, v0.4b[0]
        SUBS    x0, x0, 4
        SDOT    v30.4s, v18.16b, v0.4b[0]
        SDOT    v31.4s, v19.16b, v0.4b[0]
        B.HI    1b

        # Apply params - preshift, scale, postshift, bias and clamp
        LD1R    {v0.4s}, [x11], 4
        SSHL    v28.4s, v28.4s, v0.4s   // shift to upper bits
        SSHL    v29.4s, v29.4s, v0.4s
        LD1R    {v1.4s}, [x11], 4
        SSHL    v30.4s, v30.4s, v0.4s
        SSHL    v31.4s, v31.4s, v0.4s
        LD1R    {v2.4s}, [x11], 4
        SQDMULH v28.4s, v28.4s, v1.4s   // scale without rounding
        SQDMULH v29.4s, v29.4s, v1.4s
        SQDMULH v30.4s, v30.4s, v1.4s
        SQDMULH v31.4s, v31.4s, v1.4s
        SRSHL   v28.4s, v28.4s, v2.4s   // signed rounding shift left
        SRSHL   v29.4s, v29.4s, v2.4s
        SRSHL   v30.4s, v30.4s, v2.4s
        SRSHL   v31.4s, v31.4s, v2.4s

        LD1R    {v2.8h}, [x11], 2       // add bias
        SQXTN   v4.4h, v28.4s
        SQXTN   v6.4h, v30.4s
        SQXTN2  v4.8h, v29.4s
        SQXTN2  v6.8h, v31.4s
        LD2R    {v0.16b, v1.16b}, [x11] // clamp to min/max
        SQADD   v4.8h, v4.8h, v2.8h
        SQADD   v6.8h, v6.8h, v2.8h
        LDR     x12, [sp]               // cn_stride
        SQXTN   v4.8b, v4.8h
        SQXTN2  v4.16b, v6.8h
        SUBS    x1, x1, 16
        SMAX    v4.16b, v4.16b, v0.16b
        SMIN    v4.16b, v4.16b, v1.16b
        B.LO    2f

        # Store full 1 x 16
        ST1     {v4.16b}, [x6], x12
        SUB     x3,  x3, x2             // a0 -= kc
        B.NE    0b
        RET

        # Store odd width
        .p2align 3
2:
        TBZ     x1, 3, 3f
        STR     d4, [x6], 8
        DUP     d4, v4.d[1]
3:
        TBZ     x1, 2, 4f
        STR     s4, [x6], 4
        DUP     s4, v4.s[1]
4:
        TBZ     x1, 1, 5f
        ST1     {v4.h}[0], [x6], 2
        DUP     h4, v4.h[1]
5:
        TBZ     x1, 0, 6f
        ST1     {v4.b}[0], [x6]
6:
        RET

END_FUNCTION xnn_qs8_gemm_minmax_rndnu_ukernel_1x16c4__aarch64_neondot_ld32

#ifdef __ELF__
.section ".note.GNU-stack","",%progbits
#endif
