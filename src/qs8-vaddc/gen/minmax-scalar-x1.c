// Auto-generated file. Do not edit!
//   Template: src/qs8-vaddc/scalar.c.in
//   Generator: tools/xngen
//
// Copyright 2021 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <assert.h>

#include <xnnpack/math.h>
#include <xnnpack/vadd.h>


void xnn_qs8_vaddc_minmax_ukernel__scalar_x1(
    size_t n,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_add_minmax_params params[restrict XNN_MIN_ELEMENTS(1)]) XNN_DISABLE_TSAN
{
  const int32_t vbias = params->scalar.bias + (int32_t) *input_b * params->scalar.b_multiplier;
  const int32_t va_multiplier = params->scalar.a_multiplier;
  const int32_t vrounding = params->scalar.rounding;
  const uint32_t vshift = params->scalar.shift;
  const int32_t voutput_min_less_zero_point = params->scalar.output_min_less_zero_point;
  const int32_t voutput_max_less_zero_point = params->scalar.output_max_less_zero_point;
  const int32_t voutput_zero_point = params->scalar.output_zero_point;

  do {
    const int32_t va = *input_a++;
    const int32_t vacc = vbias + va * va_multiplier;

    int32_t vout = asr_s32(vacc + vrounding, vshift);
    vout = math_max_s32(vout, voutput_min_less_zero_point);
    vout = math_min_s32(vout, voutput_max_less_zero_point);
    *output++ = (int8_t) (vout + voutput_zero_point);

    n -= sizeof(int8_t);
  } while (n != 0);
}
