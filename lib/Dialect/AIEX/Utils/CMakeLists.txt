#
# This file is licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
# (c) Copyright 2022 Xilinx Inc.

add_mlir_dialect_library(AIEXUtils
  AIETokenAnalysis.cpp

  ADDITIONAL_HEADER_DIRS
  ${AIE_BINARY_DIR}/include

  DEPENDS
  MLIRAIEIncGen
  MLIRAIEEnumsIncGen
  MLIRAIEInterfacesIncGen
  MLIRAIEPassIncGen
  MLIRAIEXIncGen
  MLIRAIEXEnumsIncGen
  MLIRAIEXPassIncGen

  LINK_LIBS PUBLIC
  MLIRIR
  MLIRSupport
  )
