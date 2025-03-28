#!/bin/sh
# Copyright 2020 Google LLC
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

################################### Scalar ###################################
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x9-minmax-gemmlowp-scalar.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x9-minmax-gemmlowp-scalar.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x9-minmax-gemmlowp-scalar.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up1x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up2x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up4x9-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x9-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up1x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up2x9-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up4x9-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up1x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up2x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up4x9-minmax-fp32-scalar-magic.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x9-minmax-fp32-scalar-magic.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up1x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up2x9-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up4x9-minmax-fp32-scalar-magic.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x25-minmax-gemmlowp-scalar.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x25-minmax-gemmlowp-scalar.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D VARIANT=      -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x25-minmax-gemmlowp-scalar.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up1x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up2x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up4x25-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x25-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up1x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up2x25-minmax-fp32-scalar-lrint.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=LRINT -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up4x25-minmax-fp32-scalar-lrint.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up1x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up2x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up4x25-minmax-fp32-scalar-magic.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up1x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up2x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up4x25-minmax-fp32-scalar-magic.c

tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=1 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up1x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=2 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up2x25-minmax-fp32-scalar-magic.c
tools/xngen src/qs8-dwconv/unipass-scalar.c.in -D CHANNEL_TILE=4 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D VARIANT=MAGIC -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up4x25-minmax-fp32-scalar-magic.c

################################## ARM NEON ##################################
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neon-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neon-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neon-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neon-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neonv8-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neonv8-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neonv8-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neonv8-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=0 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x9-minmax-rndnu-neon-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=0 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x9-minmax-rndnu-neon-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=1 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x9-minmax-rndnu-neon-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=1 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x9-minmax-rndnu-neon-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neon-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neon-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neon-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neon-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neonv8-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=0 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neonv8-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neonv8-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32  -D DATATYPE=QC8 -D MLA=1 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neonv8-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=0 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x25-minmax-rndnu-neon-mul8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=0 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x25-minmax-rndnu-neon-mul8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=1 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x25-minmax-rndnu-neon-mla8.c
tools/xngen src/qs8-dwconv/unipass-neon-mul8.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU -D DATATYPE=QS8 -D MLA=1 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x25-minmax-rndnu-neon-mla8.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up24x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up32x9-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up24x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up32x9-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up8x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up16x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up24x9-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up32x9-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up24x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up32x9-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up8x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up16x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up24x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up32x9-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up8x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up16x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up24x9-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up32x9-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up32x9-minmax-gemmlowp-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU    -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x9-minmax-rndnu-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=RNDNU    -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x9-minmax-rndnu-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up24x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=0 -o src/qc8-dwconv/gen/up32x25-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up24x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up32x25-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up8x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up16x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up24x25-minmax-fp32-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=0 -o src/qu8-dwconv/gen/up32x25-minmax-fp32-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up24x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -D ARMV8=1 -o src/qc8-dwconv/gen/up32x25-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up8x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up16x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up24x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -D ARMV8=1 -o src/qs8-dwconv/gen/up32x25-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up8x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up16x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up24x25-minmax-fp32-neonv8-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -D ARMV8=1 -o src/qu8-dwconv/gen/up32x25-minmax-fp32-neonv8-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up32x25-minmax-gemmlowp-neon-mul16.c

tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU    -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up8x25-minmax-rndnu-neon-mul16.c
tools/xngen src/qs8-dwconv/unipass-neon-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=RNDNU    -D DATATYPE=QS8 -D ARMV8=0 -o src/qs8-dwconv/gen/up16x25-minmax-rndnu-neon-mul16.c

################################## WAsm SIMD ##################################
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up8x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up16x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up24x9-minmax-fp32-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up8x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up16x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up24x9-minmax-fp32-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up8x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up16x9-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up24x9-minmax-fp32-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=GEMMLOWP -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up8x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up16x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QC8 -o src/qc8-dwconv/gen/up24x25-minmax-fp32-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up8x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up16x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QS8 -o src/qs8-dwconv/gen/up24x25-minmax-fp32-wasmsimd-mul16.c

tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up8x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up16x25-minmax-fp32-wasmsimd-mul16.c
tools/xngen src/qs8-dwconv/unipass-wasmsimd-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D REQUANTIZATION=FP32     -D DATATYPE=QU8 -o src/qu8-dwconv/gen/up24x25-minmax-fp32-wasmsimd-mul16.c

################################### x86 SSE ###################################
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=2 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-sse2-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=2 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-sse2-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-ssse3-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-ssse3-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-ssse3-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-ssse3-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-ssse3-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=3 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-ssse3-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-sse41-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-sse41-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-avx-mul16.c
tools/xngen src/qs8-dwconv/unipass-sse-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-avx-mul16.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-sse41-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=0 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-sse41-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-avx-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=0 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-avx-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-xop-mul32.c

tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-xop-mul32.c
tools/xngen src/qs8-dwconv/unipass-sse-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D SSE=4 -D AVX=1 -D XOP=1 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-xop-mul32.c

################################### x86 AVX2 ##################################
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x9-minmax-gemmlowp-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x9-minmax-fp32-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x9-minmax-fp32-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x25-minmax-gemmlowp-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x25-minmax-fp32-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-avx2-mul16.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul16.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x25-minmax-fp32-avx2-mul16.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x9-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x9-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x9-minmax-gemmlowp-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x9-minmax-fp32-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x9-minmax-fp32-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=9  -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up32x9-minmax-fp32-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up8x25-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up24x25-minmax-gemmlowp-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x25-minmax-gemmlowp-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up8x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up24x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x25-minmax-fp32-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up8x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=24 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up24x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x25-minmax-fp32-avx2-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=8  -D KERNEL_TILE=25 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up8x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-avx2-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx2-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up32x25-minmax-fp32-avx2-mul32.c

################################## x86 AVX512 #################################
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x9-minmax-gemmlowp-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x9-minmax-gemmlowp-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x9-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x9-minmax-fp32-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x9-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x9-minmax-fp32-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=9  -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x9-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=9  -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up32x9-minmax-fp32-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up16x25-minmax-gemmlowp-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=GEMMLOWP -o src/qs8-dwconv/gen/up32x25-minmax-gemmlowp-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up16x25-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QC8 -D REQUANTIZATION=FP32     -o src/qc8-dwconv/gen/up32x25-minmax-fp32-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up16x25-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QS8 -D REQUANTIZATION=FP32     -o src/qs8-dwconv/gen/up32x25-minmax-fp32-avx512skx-mul32.c

tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=16 -D KERNEL_TILE=25 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up16x25-minmax-fp32-avx512skx-mul32.c
tools/xngen src/qs8-dwconv/unipass-avx512skx-mul32.c.in -D CHANNEL_TILE=32 -D KERNEL_TILE=25 -D DATATYPE=QU8 -D REQUANTIZATION=FP32     -o src/qu8-dwconv/gen/up32x25-minmax-fp32-avx512skx-mul32.c

################################## Unit tests #################################
tools/generate-dwconv-test.py --spec test/qc8-dwconv-minmax-fp32.yaml --output test/qc8-dwconv-minmax-fp32.cc
tools/generate-dwconv-test.py --spec test/qs8-dwconv-minmax-fp32.yaml --output test/qs8-dwconv-minmax-fp32.cc
tools/generate-dwconv-test.py --spec test/qu8-dwconv-minmax-fp32.yaml --output test/qu8-dwconv-minmax-fp32.cc

tools/generate-dwconv-test.py --spec test/qs8-dwconv-minmax-gemmlowp.yaml --output test/qs8-dwconv-minmax-gemmlowp.cc

tools/generate-dwconv-test.py --spec test/qs8-dwconv-minmax-rndnu.yaml --output test/qs8-dwconv-minmax-rndnu.cc
