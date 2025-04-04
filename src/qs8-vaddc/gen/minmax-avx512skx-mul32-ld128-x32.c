// Auto-generated file. Do not edit!
//   Template: src/qs8-vaddc/avx512skx-mul32-ld128.c.in
//   Generator: tools/xngen
//
// Copyright 2021 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <assert.h>

#include <immintrin.h>

#include <xnnpack/intrinsics-polyfill.h>
#include <xnnpack/vadd.h>


void xnn_qs8_vaddc_minmax_ukernel__avx512skx_mul32_ld128_x32(
    size_t n,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_add_minmax_params params[restrict XNN_MIN_ELEMENTS(1)]) XNN_DISABLE_TSAN XNN_DISABLE_MSAN
{
  const __m512i va_multiplier = _mm512_load_si512(params->avx512.a_multiplier);
  const __m512i vrounding = _mm512_load_si512(params->avx512.rounding);
  const __m128i vshift = _mm_loadu_si32(params->avx512.shift);
  const __m512i voutput_zero_point = _mm512_load_si512(params->avx512.output_zero_point);
  const __m256i voutput_min = _mm256_load_si256((const __m256i*) params->avx512.output_min);
  const __m256i voutput_max = _mm256_load_si256((const __m256i*) params->avx512.output_max);

  const __m512i vbias = _mm512_add_epi32(
    _mm512_broadcastd_epi32(_mm_cvtsi32_si128(params->avx512.b_multiplier[0] * (int32_t) *input_b)),
    _mm512_load_si512(params->avx512.bias));
  for (; n >= 32 * sizeof(int8_t); n -= 32 * sizeof(int8_t)) {
    const __m512i va0123456789ABCDEF = _mm512_cvtepi8_epi32(_mm_loadu_si128((const __m128i*) input_a));
    const __m512i vaGHIJKLMNOPQRSTUV = _mm512_cvtepi8_epi32(_mm_loadu_si128((const __m128i*) (input_a + 16)));
    input_a += 32;

    __m512i vacc0123456789ABCDEF = _mm512_add_epi32(vbias, _mm512_mullo_epi32(va0123456789ABCDEF, va_multiplier));
    __m512i vaccGHIJKLMNOPQRSTUV = _mm512_add_epi32(vbias, _mm512_mullo_epi32(vaGHIJKLMNOPQRSTUV, va_multiplier));

    vacc0123456789ABCDEF = _mm512_sra_epi32(_mm512_add_epi32(vacc0123456789ABCDEF, vrounding), vshift);
    vaccGHIJKLMNOPQRSTUV = _mm512_sra_epi32(_mm512_add_epi32(vaccGHIJKLMNOPQRSTUV, vrounding), vshift);

    __m512i vout0123GHIJ4567KLMN89ABOPQRCDEFSTUV = _mm512_adds_epi16(_mm512_packs_epi32(vacc0123456789ABCDEF, vaccGHIJKLMNOPQRSTUV), voutput_zero_point);

    __m256i vout0123456789ABCDEFGHIJKLMNOPQRSTUV = _mm256_permutevar8x32_epi32(_mm256_packs_epi16(_mm512_castsi512_si256(vout0123GHIJ4567KLMN89ABOPQRCDEFSTUV), _mm512_extracti32x8_epi32(vout0123GHIJ4567KLMN89ABOPQRCDEFSTUV, 1)), _mm256_set_epi32(7, 3, 5, 1, 6, 2, 4, 0));

    vout0123456789ABCDEFGHIJKLMNOPQRSTUV = _mm256_max_epi8(vout0123456789ABCDEFGHIJKLMNOPQRSTUV, voutput_min);

    vout0123456789ABCDEFGHIJKLMNOPQRSTUV = _mm256_min_epi8(vout0123456789ABCDEFGHIJKLMNOPQRSTUV, voutput_max);

    _mm256_storeu_si256((__m256i*) output, vout0123456789ABCDEFGHIJKLMNOPQRSTUV);
    output += 32;
  }
  if XNN_UNLIKELY(n != 0) {
    do {
      const __m512i va0123456789ABCDEF = _mm512_cvtepi8_epi32(_mm_loadu_si128((const __m128i*) input_a));
      input_a += 16;

      __m512i vacc0123456789ABCDEF = _mm512_add_epi32(vbias, _mm512_mullo_epi32(va0123456789ABCDEF, va_multiplier));

      vacc0123456789ABCDEF = _mm512_sra_epi32(_mm512_add_epi32(vacc0123456789ABCDEF, vrounding), vshift);

      __m256i vout012389AB4567CDEF = _mm256_adds_epi16(_mm256_packs_epi32(_mm512_castsi512_si256(vacc0123456789ABCDEF), _mm512_extracti32x8_epi32(vacc0123456789ABCDEF, 1)), _mm512_castsi512_si256(voutput_zero_point));
      __m128i vout0123456789ABCDEF = _mm_shuffle_epi32(_mm_packs_epi16(_mm256_castsi256_si128(vout012389AB4567CDEF), _mm256_extracti128_si256(vout012389AB4567CDEF, 1)), _MM_SHUFFLE(3, 1, 2, 0));
      vout0123456789ABCDEF = _mm_max_epi8(vout0123456789ABCDEF, _mm256_castsi256_si128(voutput_min));
      vout0123456789ABCDEF = _mm_min_epi8(vout0123456789ABCDEF, _mm256_castsi256_si128(voutput_max));

      if XNN_LIKELY(n >= (16 * sizeof(int8_t))) {
        _mm_storeu_si128((__m128i*) output, vout0123456789ABCDEF);
        output += 16;
        n -= 16 * sizeof(int8_t);
      } else {
        const __mmask16 vmask = _cvtu32_mask16((uint32_t) ((UINT32_C(1) << n) - UINT32_C(1)));
        _mm_mask_storeu_epi8(output, vmask, vout0123456789ABCDEF);
        n = 0;
      }
    } while (n != 0);
  }
}
