//===- SyntheticCountsUtils.h - utilities for count propagation--*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines utilities for synthetic counts propagation.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_ANALYSIS_SYNTHETIC_COUNTS_UTILS_H
#define LLVM_ANALYSIS_SYNTHETIC_COUNTS_UTILS_H

#include "llvm/ADT/STLExtras.h"
#include "llvm/Analysis/CallGraph.h"
#include "llvm/Support/ScaledNumber.h"

namespace llvm {

class CallGraph;
class Function;

/// Class with methods to propagate synthetic entry counts.
///
/// This class is templated on the type of the call graph and designed to work
/// with the traditional per-module callgraph and the summary callgraphs used in
/// ThinLTO. This contains only static methods and alias templates.
template <typename CallGraphType> class SyntheticCountsUtils {
public:
  using Scaled64 = ScaledNumber<uint64_t>;
  using CGT = CallGraphTraits<CallGraphType>;
  using NodeRef = typename CGT::NodeRef;
  using EdgeRef = typename CGT::EdgeRef;
  using SccTy = std::vector<NodeRef>;

  using GetRelBBFreqTy = function_ref<Optional<Scaled64>(EdgeRef)>;
  using GetCountTy = function_ref<uint64_t(NodeRef)>;
  using AddCountTy = function_ref<void(NodeRef, uint64_t)>;

  static void propagate(const CallGraphType &CG, GetRelBBFreqTy GetRelBBFreq,
                        GetCountTy GetCount, AddCountTy AddCount);

private:
  static void propagateFromSCC(const SccTy &SCC, GetRelBBFreqTy GetRelBBFreq,
                               GetCountTy GetCount, AddCountTy AddCount);
};
} // namespace llvm

#endif
