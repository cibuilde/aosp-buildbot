set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/libLLVMARMCodeGen^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Analysis/libLLVMAnalysis^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/AsmParser/libLLVMAsmParser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/libLLVMCodeGen^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IRReader/libLLVMIRReader^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LTO/libLLVMLTO^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/libLLVMLibDriver^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Linker/libLLVMLinker^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCParser/libLLVMMCParser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/libLLVMMC^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Object/libLLVMObject^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Option/libLLVMOption^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/libLLVMProfileData^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/libLLVMTarget^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/libLLVMX86CodeGen^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/IPO/libLLVMipo^android_x86_64_static/ .

echo "building libLLVM_android^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libLLVM_android,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/libLLVM_android^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/llvm/libLLVM_android^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/llvm/libLLVM_android^android_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/llvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_llvm.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp