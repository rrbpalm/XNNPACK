// Auto-generated file. Do not edit!
//   Template: src/qs8-gemm/4x16c4-aarch64-neondot-ld64.S.in
//   Generator: tools/xngen
//
// Copyright 2020 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.


#include <xnnpack/assembly.h>

# void xnn_qs8_gemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_ld64(
#     size_t mr,                 x0
#     size_t nc,                 x1
#     size_t kc,                 x2 / x0
#     const int8_t* restrict a,  x3
#     size_t a_stride,           x4
#     const void* restrict w,    x5
#     int8_t* restrict c,        x6
#     size_t cm_stride,          x7
#     size_t cn_stride,          [sp] -> x12
#     const union xnn_qs8_conv_minmax_params params)  [sp + 8] -> x11

# d8-d15, x19-x30 need to be preserved if used. x18 is reserved by the OS.

# Register usage
# A0  x3 v0
# A1 x15 v1
# A2 x13 v2
# A3  x4 v3
# B   x5 v4  v5  v6  v7
# C0  x6 v16 v20 v24 v28
# C1  x8 v17 v21 v25 v29
# C2  x9 v18 v22 v26 v30
# C3  x7 v19 v23 v27 v31
# unused v8 v9 v10 v11 v12 v13 v14 v15

BEGIN_FUNCTION xnn_qs8_gemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_ld64

        # Clamp A and C pointers
        CMP     x0, 2                   // if mr < 2
        ADD     x2, x2, 3               // kc = (kc + 3) & ~3
        ADD     x15, x3, x4             // a1 = a0 + a_stride
        ADD     x8, x6, x7              // c1 = c0 + cm_stride
        CSEL    x15, x3, x15, LO        //   a1 = a0
        CSEL    x8, x6,  x8, LO         //   c1 = c0
        BIC     x2, x2, 3

        ADD     x13, x15, x4            // a2 = a1 + a_stride
        ADD     x9,  x8, x7             // c2 = c1 + cm_stride
                                        // if mr <= 2
        CSEL    x13, x15, x13, LS       //   a2 = a1
        CSEL    x9,  x8,  x9, LS        //   c2 = c1

        CMP     x0, 4                   // if mr < 4
        ADD     x4, x13, x4             // a3 = a2 + a_stride
        ADD     x7,  x9, x7             // c3 = c2 + cm_stride
        CSEL    x4, x13, x4, LO         //   a3 = a2
        CSEL    x7,  x9, x7, LO         //   c3 = c2

        .p2align 3
0:
        # Load initial bias from w into accumulators
        LDP     q16, q20, [x5], 32
        MOV     v17.16b, v16.16b
        MOV     v18.16b, v16.16b
        LDP     q24, q28, [x5], 32
        MOV     v19.16b, v16.16b
        MOV     v21.16b, v20.16b
        LDR     x11, [sp, 8]            // reload params
        MOV     v22.16b, v20.16b
        MOV     v23.16b, v20.16b
        SUBS    x0, x2, 8               // k = kc - 8
        MOV     v25.16b, v24.16b
        MOV     v26.16b, v24.16b
        MOV     v27.16b, v24.16b
        MOV     v29.16b, v28.16b
        MOV     v30.16b, v28.16b
        MOV     v31.16b, v28.16b
        # Is there at least 8 bytes?
        B.LO    3f

        # Main loop - 8 bytes of A
        .p2align 3
1:
        LDR     d0,  [x3], 8
        LDR     q4,  [x5], 16
        LDR     d1, [x15], 8
        LDR     d2, [x13], 8
        LDR     d3,  [x4], 8
        LDR     q5,  [x5], 16
        SDOT    v16.4s, v4.16b,  v0.4b[0]
        SDOT    v17.4s, v4.16b,  v1.4b[0]
        LDP     q6, q7, [x5], 32
        SDOT    v18.4s, v4.16b,  v2.4b[0]
        SDOT    v19.4s, v4.16b,  v3.4b[0]
        SDOT    v20.4s, v5.16b,  v0.4b[0]
        SDOT    v21.4s, v5.16b,  v1.4b[0]
        SDOT    v22.4s, v5.16b,  v2.4b[0]
        SDOT    v23.4s, v5.16b,  v3.4b[0]
        SDOT    v24.4s, v6.16b, v0.4b[0]
        SDOT    v25.4s, v6.16b, v1.4b[0]
        LDP     q4, q5, [x5], 32
        SDOT    v26.4s, v6.16b, v2.4b[0]
        SDOT    v27.4s, v6.16b, v3.4b[0]
        SDOT    v28.4s, v7.16b, v0.4b[0]
        SDOT    v29.4s, v7.16b, v1.4b[0]
        SDOT    v30.4s, v7.16b, v2.4b[0]
        SDOT    v31.4s, v7.16b, v3.4b[0]
        SDOT    v16.4s, v4.16b,  v0.4b[1]
        SDOT    v17.4s, v4.16b,  v1.4b[1]
        LDP     q6, q7, [x5], 32
        SDOT    v18.4s, v4.16b,  v2.4b[1]
        SDOT    v19.4s, v4.16b,  v3.4b[1]
        SDOT    v20.4s, v5.16b,  v0.4b[1]
        SDOT    v21.4s, v5.16b,  v1.4b[1]
        SDOT    v22.4s, v5.16b,  v2.4b[1]
        SDOT    v23.4s, v5.16b,  v3.4b[1]
        SDOT    v24.4s, v6.16b,  v0.4b[1]
        SDOT    v25.4s, v6.16b,  v1.4b[1]
        SDOT    v26.4s, v6.16b,  v2.4b[1]
        SDOT    v27.4s, v6.16b,  v3.4b[1]
        SDOT    v28.4s, v7.16b,  v0.4b[1]
        SDOT    v29.4s, v7.16b,  v1.4b[1]
        SDOT    v30.4s, v7.16b,  v2.4b[1]
        SUBS    x0, x0, 8
        SDOT    v31.4s, v7.16b,  v3.4b[1]
        B.HS    1b

        # Is there a remainder?- 4 bytes of A
        TBNZ    x0, 2, 3f

2:
        # Apply params - preshift, scale, postshift, bias and clamp
        LD1R    {v0.4s}, [x11], 4
        SSHL    v16.4s, v16.4s, v0.4s   // shift to upper bits
        SSHL    v17.4s, v17.4s, v0.4s
        SSHL    v18.4s, v18.4s, v0.4s
        SSHL    v19.4s, v19.4s, v0.4s
        SSHL    v20.4s, v20.4s, v0.4s
        SSHL    v21.4s, v21.4s, v0.4s
        SSHL    v22.4s, v22.4s, v0.4s
        SSHL    v23.4s, v23.4s, v0.4s
        LD1R    {v1.4s}, [x11], 4
        SSHL    v24.4s, v24.4s, v0.4s
        SSHL    v25.4s, v25.4s, v0.4s
        SSHL    v26.4s, v26.4s, v0.4s
        SSHL    v27.4s, v27.4s, v0.4s
        SSHL    v28.4s, v28.4s, v0.4s
        SSHL    v29.4s, v29.4s, v0.4s
        SSHL    v30.4s, v30.4s, v0.4s
        SSHL    v31.4s, v31.4s, v0.4s
        LD1R    {v2.4s}, [x11], 4
        SQDMULH v16.4s, v16.4s, v1.4s   // scale without rounding
        SQDMULH v17.4s, v17.4s, v1.4s
        SQDMULH v18.4s, v18.4s, v1.4s
        SQDMULH v19.4s, v19.4s, v1.4s
        SQDMULH v20.4s, v20.4s, v1.4s
        SQDMULH v21.4s, v21.4s, v1.4s
        SQDMULH v22.4s, v22.4s, v1.4s
        SQDMULH v23.4s, v23.4s, v1.4s
        SQDMULH v24.4s, v24.4s, v1.4s
        SQDMULH v25.4s, v25.4s, v1.4s
        SQDMULH v26.4s, v26.4s, v1.4s
        SQDMULH v27.4s, v27.4s, v1.4s
        SQDMULH v28.4s, v28.4s, v1.4s
        SQDMULH v29.4s, v29.4s, v1.4s
        SQDMULH v30.4s, v30.4s, v1.4s
        SQDMULH v31.4s, v31.4s, v1.4s
        SRSHL   v16.4s, v16.4s, v2.4s   // signed rounding shift left
        SRSHL   v17.4s, v17.4s, v2.4s
        SRSHL   v18.4s, v18.4s, v2.4s
        SRSHL   v19.4s, v19.4s, v2.4s
        SRSHL   v20.4s, v20.4s, v2.4s
        SRSHL   v21.4s, v21.4s, v2.4s
        SRSHL   v22.4s, v22.4s, v2.4s
        SRSHL   v23.4s, v23.4s, v2.4s
        SRSHL   v24.4s, v24.4s, v2.4s
        SRSHL   v25.4s, v25.4s, v2.4s
        SRSHL   v26.4s, v26.4s, v2.4s
        SRSHL   v27.4s, v27.4s, v2.4s
        SRSHL   v28.4s, v28.4s, v2.4s
        SRSHL   v29.4s, v29.4s, v2.4s
        SRSHL   v30.4s, v30.4s, v2.4s
        SRSHL   v31.4s, v31.4s, v2.4s

        SQXTN   v16.4h, v16.4s
        SQXTN   v17.4h, v17.4s
        SQXTN   v18.4h, v18.4s
        SQXTN   v19.4h, v19.4s
        SQXTN   v24.4h, v24.4s
        SQXTN   v25.4h, v25.4s
        SQXTN   v26.4h, v26.4s
        SQXTN   v27.4h, v27.4s
        LD1R    {v2.8h}, [x11], 2       // add bias

        SQXTN2  v16.8h, v20.4s
        SQXTN2  v17.8h, v21.4s
        SQXTN2  v18.8h, v22.4s
        SQXTN2  v19.8h, v23.4s
        SQXTN2  v24.8h, v28.4s
        SQXTN2  v25.8h, v29.4s
        SQXTN2  v26.8h, v30.4s
        SQXTN2  v27.8h, v31.4s

        SQADD   v16.8h, v16.8h, v2.8h
        SQADD   v17.8h, v17.8h, v2.8h
        SQADD   v18.8h, v18.8h, v2.8h
        SQADD   v19.8h, v19.8h, v2.8h
        SQADD   v24.8h, v24.8h, v2.8h
        SQADD   v25.8h, v25.8h, v2.8h
        SQADD   v26.8h, v26.8h, v2.8h
        SQADD   v27.8h, v27.8h, v2.8h
        LD1R    {v0.16b}, [x11], 1      // clamp min value

        SQXTN   v4.8b, v16.8h
        SQXTN   v5.8b, v17.8h
        SQXTN   v6.8b, v18.8h
        SQXTN   v7.8b, v19.8h
        LD1R    {v1.16b}, [x11]         // clamp max value
        SQXTN2  v4.16b, v24.8h
        SQXTN2  v5.16b, v25.8h
        SQXTN2  v6.16b, v26.8h
        SQXTN2  v7.16b, v27.8h
        LDR     x12, [sp]               // cn_stride

        SMAX    v4.16b, v4.16b, v0.16b
        SMAX    v5.16b, v5.16b, v0.16b
        SMAX    v6.16b, v6.16b, v0.16b
        SMAX    v7.16b, v7.16b, v0.16b
        SUBS    x1, x1, 16
        SMIN    v4.16b, v4.16b, v1.16b
        SMIN    v5.16b, v5.16b, v1.16b
        SMIN    v6.16b, v6.16b, v1.16b
        SMIN    v7.16b, v7.16b, v1.16b
        B.LO    4f

        # Store full 4 x 16
        ST1     {v4.16b}, [x6], x12
        SUB     x3,  x3, x2             // a0 -= kc
        ST1     {v5.16b}, [x8], x12
        SUB     x15, x15, x2            // a1 -= kc
        ST1     {v6.16b}, [x9], x12
        SUB     x13, x13, x2            // a2 -= kc
        ST1     {v7.16b}, [x7], x12
        SUB     x4,  x4, x2             // a3 -= kc
        B.NE    0b
        RET

        # Remainder- 4 bytes of A
        .p2align 3
3:
        LDR     s0,  [x3], 4
        LDR     q4, [x5], 16
        LDR     s1, [x15], 4
        LDR     s2, [x13], 4
        LDR     s3,  [x4], 4
        SDOT    v16.4s, v4.16b,  v0.4b[0]
        LDR     q5, [x5], 16
        SDOT    v17.4s, v4.16b,  v1.4b[0]
        SDOT    v18.4s, v4.16b,  v2.4b[0]
        SDOT    v19.4s, v4.16b,  v3.4b[0]
        SDOT    v20.4s, v5.16b,  v0.4b[0]
        LDP     q6, q7, [x5], 32
        SDOT    v21.4s, v5.16b,  v1.4b[0]
        SDOT    v22.4s, v5.16b,  v2.4b[0]
        SDOT    v23.4s, v5.16b,  v3.4b[0]
        SDOT    v24.4s, v6.16b, v0.4b[0]
        SDOT    v25.4s, v6.16b, v1.4b[0]
        SDOT    v26.4s, v6.16b, v2.4b[0]
        SDOT    v27.4s, v6.16b, v3.4b[0]
        SDOT    v28.4s, v7.16b, v0.4b[0]
        SDOT    v29.4s, v7.16b, v1.4b[0]
        SDOT    v30.4s, v7.16b, v2.4b[0]
        SDOT    v31.4s, v7.16b, v3.4b[0]
        B       2b

        # Store odd width
        .p2align 3
4:
        TBZ     x1, 3, 5f
        STR     d4, [x6], 8
        DUP     d4, v4.d[1]
        STR     d5, [x8], 8
        DUP     d5, v5.d[1]
        STR     d6, [x9], 8
        DUP     d6, v6.d[1]
        STR     d7, [x7], 8
        DUP     d7, v7.d[1]
5:
        TBZ     x1, 2, 6f
        STR     s4, [x6], 4
        DUP     s4, v4.s[1]
        STR     s5, [x8], 4
        DUP     s5, v5.s[1]
        STR     s6, [x9], 4
        DUP     s6, v6.s[1]
        STR     s7, [x7], 4
        DUP     s7, v7.s[1]
6:
        TBZ     x1, 1, 7f
        ST1     {v4.h}[0], [x6], 2
        DUP     h4, v4.h[1]
        ST1     {v5.h}[0], [x8], 2
        DUP     h5, v5.h[1]
        ST1     {v6.h}[0], [x9], 2
        DUP     h6, v6.h[1]
        ST1     {v7.h}[0], [x7], 2
        DUP     h7, v7.h[1]
7:
        TBZ     x1, 0, 8f
        ST1     {v4.b}[0], [x6]
        ST1     {v5.b}[0], [x8]
        ST1     {v6.b}[0], [x9]
        ST1     {v7.b}[0], [x7]
8:
        RET

END_FUNCTION xnn_qs8_gemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_ld64

#ifdef __ELF__
.section ".note.GNU-stack","",%progbits
#endif
