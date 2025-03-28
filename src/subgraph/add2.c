// Copyright 2020 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <math.h>
#include <stddef.h>
#include <stdint.h>

#include <xnnpack.h>
#include <xnnpack/log.h>
#include <xnnpack/params.h>
#include <xnnpack/subgraph.h>


enum xnn_status xnn_define_add2(
  xnn_subgraph_t subgraph,
  float output_min,
  float output_max,
  uint32_t input1_id,
  uint32_t input2_id,
  uint32_t output_id,
  uint32_t flags)
{
  if ((xnn_params.init_flags & XNN_INIT_FLAG_XNNPACK) == 0) {
    xnn_log_error("failed to define %s operator: XNNPACK is not initialized",
      xnn_node_type_to_string(xnn_node_type_add2));
    return xnn_status_uninitialized;
  }

  if (isnan(output_min)) {
    xnn_log_error(
      "failed to define %s operator with NaN output lower bound: lower bound must be non-NaN",
      xnn_node_type_to_string(xnn_node_type_add2));
    return xnn_status_invalid_parameter;
  }

  if (isnan(output_max)) {
    xnn_log_error(
      "failed to define %s operator with NaN output upper bound: upper bound must be non-NaN",
      xnn_node_type_to_string(xnn_node_type_add2));
    return xnn_status_invalid_parameter;
  }

  if (output_min >= output_max) {
    xnn_log_error(
      "failed to define %s operator with [%.7g, %.7g] output range: lower bound must be below upper bound",
      xnn_node_type_to_string(xnn_node_type_add2), output_min, output_max);
    return xnn_status_invalid_parameter;
  }

  if (input1_id >= subgraph->num_values) {
    xnn_log_error(
      "failed to define %s operator with the first input ID #%" PRIu32 ": invalid Value ID",
      xnn_node_type_to_string(xnn_node_type_add2), input1_id);
    return xnn_status_invalid_parameter;
  }

  const struct xnn_value* input1_value = &subgraph->values[input1_id];
  if (input1_value->type != xnn_value_type_dense_tensor) {
    xnn_log_error(
      "failed to define %s operator with the first input ID #%" PRIu32 ": unsupported Value type %d (expected dense tensor)",
      xnn_node_type_to_string(xnn_node_type_add2), input1_id, input1_value->type);
    return xnn_status_invalid_parameter;
  }

  switch (input1_value->datatype) {
    case xnn_datatype_fp32:
#ifndef XNN_NO_QS8_OPERATORS
    case xnn_datatype_qint8:
#endif  // !defined(XNN_NO_QS8_OPERATORS)
#ifndef XNN_NO_QU8_OPERATORS
    case xnn_datatype_quint8:
#endif  // !defined(XNN_NO_QU8_OPERATORS)
      break;
    default:
      xnn_log_error(
        "failed to define %s operator with the first input ID #%" PRIu32 ": unsupported Value datatype %s (%d)",
        xnn_node_type_to_string(xnn_node_type_add2), input1_id,
        xnn_datatype_to_string(input1_value->datatype), input1_value->datatype);
      return xnn_status_invalid_parameter;
  }

  if (input2_id >= subgraph->num_values) {
    xnn_log_error(
      "failed to define %s operator with the second input ID #%" PRIu32 ": invalid Value ID",
      xnn_node_type_to_string(xnn_node_type_add2), input2_id);
    return xnn_status_invalid_parameter;
  }

  const struct xnn_value* input2_value = &subgraph->values[input2_id];
  if (input2_value->type != xnn_value_type_dense_tensor) {
    xnn_log_error(
      "failed to define %s operator with the second input ID #%" PRIu32 ": unsupported Value type %d (expected dense tensor)",
      xnn_node_type_to_string(xnn_node_type_add2), input2_id, input2_value->type);
    return xnn_status_invalid_parameter;
  }

  switch (input2_value->datatype) {
    case xnn_datatype_fp32:
#ifndef XNN_NO_QS8_OPERATORS
    case xnn_datatype_qint8:
#endif  // !defined(XNN_NO_QS8_OPERATORS)
#ifndef XNN_NO_QU8_OPERATORS
    case xnn_datatype_quint8:
#endif  // !defined(XNN_NO_QU8_OPERATORS)
      break;
    default:
      xnn_log_error(
        "failed to define %s operator with the second input ID #%" PRIu32 ": unsupported Value datatype %s (%d)",
        xnn_node_type_to_string(xnn_node_type_add2), input2_id,
        xnn_datatype_to_string(input2_value->datatype), input2_value->datatype);
      return xnn_status_invalid_parameter;
  }

  if (output_id >= subgraph->num_values) {
    xnn_log_error(
      "failed to define %s operator with output ID #%" PRIu32 ": invalid Value ID",
      xnn_node_type_to_string(xnn_node_type_add2), output_id);
    return xnn_status_invalid_parameter;
  }

  const struct xnn_value* output_value = &subgraph->values[output_id];
  if (output_value->type != xnn_value_type_dense_tensor) {
    xnn_log_error(
      "failed to define %s operator with output ID #%" PRIu32 ": unsupported Value type %d (expected dense tensor)",
      xnn_node_type_to_string(xnn_node_type_add2), output_id, output_value->type);
    return xnn_status_invalid_parameter;
  }

  switch (output_value->datatype) {
    case xnn_datatype_fp32:
#ifndef XNN_NO_QS8_OPERATORS
    case xnn_datatype_qint8:
#endif  // !defined(XNN_NO_QS8_OPERATORS)
#ifndef XNN_NO_QU8_OPERATORS
    case xnn_datatype_quint8:
#endif  // !defined(XNN_NO_QU8_OPERATORS)
      break;
    default:
      xnn_log_error(
        "failed to define %s operator with output ID #%" PRIu32 ": unsupported Value datatype %s (%d)",
        xnn_node_type_to_string(xnn_node_type_add2), output_id,
        xnn_datatype_to_string(output_value->datatype), output_value->datatype);
      return xnn_status_invalid_parameter;
  }

  if (input1_value->datatype != input2_value->datatype ||
      input1_value->datatype != output_value->datatype)
  {
    xnn_log_error(
      "failed to define %s operator with input IDs #%" PRIu32 " and #%" PRIu32 " and output ID #%" PRIu32
      ": mismatching datatypes across the first input (%s), the second input (%s), and output (%s)",
      xnn_node_type_to_string(xnn_node_type_add2), input1_id, input2_id, output_id,
      xnn_datatype_to_string(input1_value->datatype),
      xnn_datatype_to_string(input2_value->datatype),
      xnn_datatype_to_string(output_value->datatype));
    return xnn_status_invalid_parameter;
  }

  struct xnn_node* node = xnn_subgraph_new_node(subgraph);
  if (node == NULL) {
    return xnn_status_out_of_memory;
  }

  node->type = xnn_node_type_add2;
  node->activation.output_min = output_min;
  node->activation.output_max = output_max;
  node->num_inputs = 2;
  node->inputs[0] = input1_id;
  node->inputs[1] = input2_id;
  node->num_outputs = 1;
  node->outputs[0] = output_id;
  node->flags = flags;

  return xnn_status_success;
}
