// Auto-generated file. Do not edit!
//   Template: src/qs8-igemm/4x16c4-aarch64-neondot-cortex-a55.S.in
//   Generator: tools/xngen
//
// Copyright 2020 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.


#include <xnnpack/assembly.h>

# void xnn_qs8_igemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_cortex_a55(
#     size_t mr,                 x0
#     size_t nc,                 x1
#     size_t kc,                 x2 / x0
#     size_t ks,                 x3 / x9
#     const int8_t**restrict a,  x4
#     const int8_t* restrict w,  x5
#     int8_t* restrict c,        x6
#     size_t cm_stride,          x7
#     size_t cn_stride,                  [sp] -> (x0)
#     size_t a_offset,                   [sp + 8] -> x8
#     const float* zero,                 [sp + 16] -> x12
#     const union xnn_qs8_conv_minmax_params params [sp + 24] -> (x11)

# d8-d15, x19-x30 need to be preserved if used. x18 is reserved by the OS.

# Register usage
# A0  x13  v0  v4
# A1  x14  v1  v5
# A2  x15  v2  v6
# A3  x10  v3  v7
# B    x5  v8  v9 v10 v11
# C0   x6 v16 v20 v24 v28
# C1  x16 v17 v21 v25 v29
# C2  x17 v18 v22 v26 v30
# C3   x7 v19 v23 v27 v31
# unused v12 v13 v14 v15

# x11 temp for Cortex-A55 loads

BEGIN_FUNCTION xnn_qs8_igemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_cortex_a55

        # Clamp C pointers
        CMP     x0, 2                   // if mr < 2
        LDR     x8, [sp, 8]             // Load a_offset
        ADD     x16, x6, x7             // c1 = c0 + cm_stride
        LDP     x12, x11, [sp, 16]      // Load zero, params pointer
        CSEL    x16, x6,  x16, LO       //   c1 = c0
        ADD     x2, x2, 3               // kc = (kc + 3) & ~3
        STP     d8,  d9, [sp, -32]!     // Save d8-d11 on stack

        ADD     x17, x16, x7            // c2 = c1 + cm_stride
        STP     d10, d11, [sp, 16]
                                        // if mr <= 2
        CSEL    x17, x16, x17, LS       //   c2 = c1
        BIC     x2, x2, 3

        CMP     x0, 4                   // if mr < 4
        ADD     x7,  x17, x7            // c3 = c2 + cm_stride
        CSEL    x7,  x17, x7, LO        //   c3 = c2

        .p2align 3
0:
        # Load initial bias from w into accumulators
        LDP     q16, q20, [x5], 32
        MOV     v17.16b, v16.16b
        MOV     v18.16b, v16.16b
        LDP     q24, q28, [x5], 32
        MOV     v19.16b, v16.16b
        MOV     v21.16b, v20.16b
        MOV     v22.16b, v20.16b
        MOV     v23.16b, v20.16b
        MOV     v25.16b, v24.16b
        MOV     v26.16b, v24.16b
        MOV     v27.16b, v24.16b
        MOV     v29.16b, v28.16b
        MOV     v30.16b, v28.16b
        MOV     v31.16b, v28.16b
        MOV     x9, x3                  // p = ks

        .p2align 3
1:
        # Load next 4 A pointers
        LDP     x13, x14, [x4], 16
        LDP     x15, x10, [x4], 16

        CMP     x13, x12                // if a0 == zero
        ADD     x13, x13, x8            // a0 += a_offset
        CSEL    x13, x12, x13, EQ       //   a0 = zero, else += a0 + a_offset
        CMP     x14, x12                // if a1 == zero
        ADD     x14, x14, x8            // a1 += a_offset
        CSEL    x14, x12, x14, EQ       //   a1 = zero, else += a1 + a_offset
        CMP     x15, x12                // if a2 == zero
        ADD     x15, x15, x8            // a2 += a_offset
        CSEL    x15, x12, x15, EQ       //   a2 = zero, else += a2 + a_offset
        CMP     x10, x12                // if a3 == zero
        ADD     x10, x10, x8            // a3 += a_offset
        CSEL    x10, x12, x10, EQ       //   a3 = zero, else += a3 + a_offset

        # Is there at least 16 bytes for prologue/epilogue?
        SUBS    x0, x2, 16              // k = kc - 16
        B.LO    5f

        # prologue - read A and B values for block 0 and 1
        LDR     d0, [x13], 8
        LDR     q8,  [x5], 16
        LDR     d1, [x14], 8
        LDR     d2, [x15], 8
        LDR     d3, [x10], 8
        SUBS    x0, x0, 16              // is there 16 for main loop?
        LDR     d9,  [x5], 8
        LDR     x11,  [x5], 8
        # Is there at least 16 bytes for main loop?
        B.LO    3f

        # Main loop - 16 bytes of A in 4 groups.
        # 4 row of 4 vectors wide = 16 sdot instructions for 4 channels
        # 4 LD64 for A
        # 4 LD128 for W. = 2 LD64 + INS.
        # for each 4 sdot, 1 LD64 for A, 2 LD64 for W + INS.

        .p2align 3
2:
        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v0.4b[0]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v1.4b[0]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v3.4b[0]
        LDR     d4,  [x13], 8

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v0.4b[0]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v1.4b[0]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v3.4b[0]
        LDR     d5, [x14], 8

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v0.4b[0]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v1.4b[0]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v3.4b[0]
        LDR     d6, [x15], 8

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v0.4b[0]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v1.4b[0]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v3.4b[0]
        LDR     d7,  [x10], 8

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v0.4b[1]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v1.4b[1]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v3.4b[1]

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v0.4b[1]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v1.4b[1]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v3.4b[1]

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v0.4b[1]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v1.4b[1]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v3.4b[1]

        # BLOCK 4
        SDOT    v28.4s, v11.16b, v0.4b[1]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v1.4b[1]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v3.4b[1]

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v4.4b[0]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v5.4b[0]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v7.4b[0]
        LDR     d0,  [x13], 8

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v4.4b[0]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v5.4b[0]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v7.4b[0]
        LDR     d1, [x14], 8

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v4.4b[0]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v5.4b[0]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v7.4b[0]
        LDR     d2, [x15], 8

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v4.4b[0]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v5.4b[0]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v7.4b[0]
        LDR     d3,  [x10], 8

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v4.4b[1]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v5.4b[1]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v7.4b[1]

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v4.4b[1]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v5.4b[1]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v7.4b[1]

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v4.4b[1]
        LDR     d8,  [x5], 8            // First B values for block 0 and 1
        SDOT    v25.4s, v10.16b, v5.4b[1]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v7.4b[1]
        SUBS    x0, x0, 16

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v4.4b[1]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v5.4b[1]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v7.4b[1]
        B.HS    2b

        # Epilogue.  Same as main loop but no preloads in final group
3:
        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v0.4b[0]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v1.4b[0]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v3.4b[0]
        LDR     d4,  [x13], 8

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v0.4b[0]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v1.4b[0]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v3.4b[0]
        LDR     d5, [x14], 8

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v0.4b[0]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v1.4b[0]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v3.4b[0]
        LDR     d6, [x15], 8

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v0.4b[0]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v1.4b[0]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v2.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v3.4b[0]
        LDR     d7,  [x10], 8

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v0.4b[1]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v1.4b[1]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v3.4b[1]

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v0.4b[1]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v1.4b[1]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v3.4b[1]

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v0.4b[1]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v1.4b[1]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v3.4b[1]

        # BLOCK 4
        SDOT    v28.4s, v11.16b, v0.4b[1]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v1.4b[1]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v2.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v3.4b[1]

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v4.4b[0]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v5.4b[0]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v7.4b[0]

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v4.4b[0]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v5.4b[0]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v7.4b[0]

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v4.4b[0]
        LDR     d8,  [x5], 8
        SDOT    v25.4s, v10.16b, v5.4b[0]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v27.4s, v10.16b, v7.4b[0]

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v4.4b[0]
        LDR     d9,  [x5], 8
        SDOT    v29.4s, v11.16b, v5.4b[0]
        INS     v8.d[1], x11
        SDOT    v30.4s, v11.16b, v6.4b[0]
        LDR     x11,  [x5], 8
        SDOT    v31.4s, v11.16b, v7.4b[0]

        # BLOCK 0
        SDOT    v16.4s,  v8.16b, v4.4b[1]
        LDR     d10,  [x5], 8
        SDOT    v17.4s,  v8.16b, v5.4b[1]
        INS     v9.d[1], x11
        SDOT    v18.4s,  v8.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v19.4s,  v8.16b, v7.4b[1]

        # BLOCK 1
        SDOT    v20.4s,  v9.16b, v4.4b[1]
        LDR     d11,  [x5], 8
        SDOT    v21.4s,  v9.16b, v5.4b[1]
        INS     v10.d[1], x11
        SDOT    v22.4s,  v9.16b, v6.4b[1]
        LDR     x11,  [x5], 8
        SDOT    v23.4s,  v9.16b, v7.4b[1]

        # BLOCK 2
        SDOT    v24.4s, v10.16b, v4.4b[1]
        SDOT    v25.4s, v10.16b, v5.4b[1]
        INS     v11.d[1], x11
        SDOT    v26.4s, v10.16b, v6.4b[1]
        SDOT    v27.4s, v10.16b, v7.4b[1]
        AND     x0, x2, 15              // kc remainder 0 to 12

        # BLOCK 3
        SDOT    v28.4s, v11.16b, v4.4b[1]
        SDOT    v29.4s, v11.16b, v5.4b[1]
        LDR     x11, [sp, 56]            // reload params pointer
        SDOT    v30.4s, v11.16b, v6.4b[1]
        SDOT    v31.4s, v11.16b, v7.4b[1]

        # Is there a remainder?- 4 to 12 bytes of A
        CBNZ    x0, 6f

        .p2align 3
4:
        # ks loop
        SUBS    x9, x9, 32              // ks -= MR * sizeof(int8_t*)
        B.HI    1b

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
        SUB     x11, x11, 15              // rewind params pointer
        SMAX    v4.16b, v4.16b, v0.16b
        SMAX    v5.16b, v5.16b, v0.16b
        LDR     x0, [sp, 32]            // cn_stride
        SMAX    v6.16b, v6.16b, v0.16b
        SMAX    v7.16b, v7.16b, v0.16b
        SUBS    x1, x1, 16
        SMIN    v4.16b, v4.16b, v1.16b
        SMIN    v5.16b, v5.16b, v1.16b
        SMIN    v6.16b, v6.16b, v1.16b
        SMIN    v7.16b, v7.16b, v1.16b
        B.LO    7f

        # Store full 4 x 16
        ST1     {v7.16b},  [x7], x0
        ST1     {v6.16b}, [x17], x0
        ST1     {v5.16b}, [x16], x0
        ST1     {v4.16b},  [x6], x0

        SUB     x4, x4, x3              // a -= ks

        # nc loop
        B.HI    0b

        # Restore d8-d15 from stack
        LDP     d10, d11, [sp, 16]
        LDP     d8,  d9, [sp], 32
        RET

        # Remainder- 4 to 12 bytes of A
        # Although C4, its safe to read 16 bytes.
        .p2align 3
5:
        AND     x0, x2, 15              // kc remainder 4 to 12
6:
        LDR     q0, [x13]
        LDP     q8,  q9,  [x5], 32
        LDR     q1, [x14]
        LDR     q2, [x15]
        LDR     q3, [x10]
        LDP     q10, q11, [x5], 32
        SDOT    v16.4s,  v8.16b, v0.4b[0]
        SDOT    v17.4s,  v8.16b, v1.4b[0]
        SDOT    v18.4s,  v8.16b, v2.4b[0]
        SDOT    v19.4s,  v8.16b, v3.4b[0]
        SDOT    v20.4s,  v9.16b, v0.4b[0]
        SDOT    v21.4s,  v9.16b, v1.4b[0]
        SDOT    v22.4s,  v9.16b, v2.4b[0]
        SDOT    v23.4s,  v9.16b, v3.4b[0]
        SDOT    v24.4s, v10.16b, v0.4b[0]
        SDOT    v25.4s, v10.16b, v1.4b[0]
        SDOT    v26.4s, v10.16b, v2.4b[0]
        SDOT    v27.4s, v10.16b, v3.4b[0]
        SDOT    v28.4s, v11.16b, v0.4b[0]
        SDOT    v29.4s, v11.16b, v1.4b[0]
        SDOT    v30.4s, v11.16b, v2.4b[0]
        SDOT    v31.4s, v11.16b, v3.4b[0]
        CMP     x0, 4
        B.LS    4b
        LDP     q8,  q9,  [x5], 32
        LDP     q10, q11,  [x5], 32
        SDOT    v16.4s,  v8.16b, v0.4b[1]
        SDOT    v17.4s,  v8.16b, v1.4b[1]
        SDOT    v18.4s,  v8.16b, v2.4b[1]
        SDOT    v19.4s,  v8.16b, v3.4b[1]
        SDOT    v20.4s,  v9.16b, v0.4b[1]
        SDOT    v21.4s,  v9.16b, v1.4b[1]
        SDOT    v22.4s,  v9.16b, v2.4b[1]
        SDOT    v23.4s,  v9.16b, v3.4b[1]
        SDOT    v24.4s, v10.16b, v0.4b[1]
        SDOT    v25.4s, v10.16b, v1.4b[1]
        SDOT    v26.4s, v10.16b, v2.4b[1]
        SDOT    v27.4s, v10.16b, v3.4b[1]
        SDOT    v28.4s, v11.16b, v0.4b[1]
        SDOT    v29.4s, v11.16b, v1.4b[1]
        SDOT    v30.4s, v11.16b, v2.4b[1]
        SDOT    v31.4s, v11.16b, v3.4b[1]
        CMP     x0, 8
        B.LS    4b
        LDP     q8,  q9,  [x5], 32
        LDP     q10, q11,  [x5], 32
        SDOT    v16.4s,  v8.16b, v0.4b[2]
        SDOT    v17.4s,  v8.16b, v1.4b[2]
        SDOT    v18.4s,  v8.16b, v2.4b[2]
        SDOT    v19.4s,  v8.16b, v3.4b[2]
        SDOT    v20.4s,  v9.16b, v0.4b[2]
        SDOT    v21.4s,  v9.16b, v1.4b[2]
        SDOT    v22.4s,  v9.16b, v2.4b[2]
        SDOT    v23.4s,  v9.16b, v3.4b[2]
        SDOT    v24.4s, v10.16b, v0.4b[2]
        SDOT    v25.4s, v10.16b, v1.4b[2]
        SDOT    v26.4s, v10.16b, v2.4b[2]
        SDOT    v27.4s, v10.16b, v3.4b[2]
        SDOT    v28.4s, v11.16b, v0.4b[2]
        SDOT    v29.4s, v11.16b, v1.4b[2]
        SDOT    v30.4s, v11.16b, v2.4b[2]
        SDOT    v31.4s, v11.16b, v3.4b[2]
        B       4b

        # Store odd width
        .p2align 3
7:
        TBZ     x1, 3, 8f
        STR     d7, [x7], 8
        DUP     d7, v7.d[1]
        STR     d6, [x17], 8
        DUP     d6, v6.d[1]
        STR     d5, [x16], 8
        DUP     d5, v5.d[1]
        STR     d4, [x6], 8
        DUP     d4, v4.d[1]
8:
        TBZ     x1, 2, 9f
        STR     s7, [x7], 4
        DUP     s7, v7.s[1]
        STR     s6, [x17], 4
        DUP     s6, v6.s[1]
        STR     s5, [x16], 4
        DUP     s5, v5.s[1]
        STR     s4, [x6], 4
        DUP     s4, v4.s[1]
9:
        TBZ     x1, 1, 10f
        ST1     {v7.h}[0], [x7], 2
        DUP     h7, v7.h[1]
        ST1     {v6.h}[0], [x17], 2
        DUP     h6, v6.h[1]
        ST1     {v5.h}[0], [x16], 2
        DUP     h5, v5.h[1]
        ST1     {v4.h}[0], [x6], 2
        DUP     h4, v4.h[1]
10:
        TBZ     x1, 0, 11f
        ST1     {v7.b}[0], [x7]
        ST1     {v6.b}[0], [x17]
        ST1     {v5.b}[0], [x16]
        ST1     {v4.b}[0], [x6]
11:
        # Restore d8-d15 from stack
        LDP     d10, d11, [sp, 16]
        LDP     d8,  d9, [sp], 32
        RET

END_FUNCTION xnn_qs8_igemm_minmax_rndnu_ukernel_4x16c4__aarch64_neondot_cortex_a55

#ifdef __ELF__
.section ".note.GNU-stack","",%progbits
#endif
