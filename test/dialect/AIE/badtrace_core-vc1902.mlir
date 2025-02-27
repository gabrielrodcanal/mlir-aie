//===- badtrace_core-vc1902.mlir -------------------------------*- MLIR -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// (c) Copyright 2023 Advanced Micro Devices, Inc.
//
//===----------------------------------------------------------------------===//

// RUN: not aie-opt -split-input-file %s 2>&1 | FileCheck %s
// CHECK: error{{.*}} 'AIE.connect' op illegal Trace destination

AIE.device(xcvc1902) {
  %01 = AIE.tile(0, 3)
  AIE.switchbox(%01) {
    AIE.connect<Trace: 0, East: 1>
  }
}

// -----

// CHECK: error{{.*}} 'AIE.amsel' op illegal Trace destination

AIE.device(xcvc1902) {
  %02 = AIE.tile(0, 3)
  AIE.switchbox(%02) {
    %94 = AIE.amsel<0> (0)
    %95 = AIE.masterset(North : 0, %94)
    AIE.packetrules(Trace : 1) {
      AIE.rule(31, 1, %94)
    }
  }
}
