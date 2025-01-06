
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/llvm"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-intrinsics^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/IR/llvm-gen-core^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/LibDriver/llvm-gen-libdriver^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/Support/libLLVMSupport^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/TableGen/libLLVMTableGen^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/Target/ARM/llvm-gen-arm^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/Target/X86/llvm-gen-x86^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/ .

echo "building llvm-gen-attributes^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-attributes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-attributes^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-attributes^.output $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^ $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^/addition_copy_files.output

echo "building llvm-gen-intrinsics^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-intrinsics,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-intrinsics^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-intrinsics^.output $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^ $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^/addition_copy_files.output

echo "building libLLVMAnalysis^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAnalysis,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Analysis/libLLVMAnalysis^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAnalysis^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Analysis/libLLVMAnalysis^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAnalysis^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Analysis/libLLVMAnalysis^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Analysis/libLLVMAnalysis^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAsmParser^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAsmParser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/AsmParser/libLLVMAsmParser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAsmParser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/AsmParser/libLLVMAsmParser^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAsmParser^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/AsmParser/libLLVMAsmParser^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/AsmParser/libLLVMAsmParser^android_x86_64_static/addition_copy_files.output

echo "building libLLVMBitReader^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMBitReader,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitReader^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitReader^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_64_static/addition_copy_files.output

echo "building libLLVMBitReader^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMBitReader,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitReader^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitReader^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_x86_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMBitWriter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitWriter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMBitWriter^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter^android_x86_64_static/addition_copy_files.output

echo "building libLLVMCodeGen^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMCodeGen,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/libLLVMCodeGen^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCodeGen^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/libLLVMCodeGen^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCodeGen^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/libLLVMCodeGen^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/libLLVMCodeGen^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAsmPrinter^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAsmPrinter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAsmPrinter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAsmPrinter^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter^android_x86_64_static/addition_copy_files.output

echo "building libLLVMGlobalISel^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMGlobalISel,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMGlobalISel^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMGlobalISel^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel^android_x86_64_static/addition_copy_files.output

echo "building libLLVMSelectionDAG^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMSelectionDAG,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMSelectionDAG^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMSelectionDAG^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG^android_x86_64_static/addition_copy_files.output

echo "building libLLVMDebugInfoCodeView^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMDebugInfoCodeView,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoCodeView^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoCodeView^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView^android_x86_64_static/addition_copy_files.output

echo "building libLLVMDebugInfoDWARF^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMDebugInfoDWARF,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoDWARF^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoDWARF^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF^android_x86_64_static/addition_copy_files.output

echo "building libLLVMDebugInfoPDB^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMDebugInfoPDB,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoPDB^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMDebugInfoPDB^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB^android_x86_64_static/addition_copy_files.output

echo "building libLLVMSymbolize^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMSymbolize,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMSymbolize^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMSymbolize^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize^android_x86_64_static/addition_copy_files.output

echo "building libLLVMExecutionEngine^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMExecutionEngine,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMExecutionEngine^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMExecutionEngine^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine^android_x86_64_static/addition_copy_files.output

echo "building libLLVMMCJIT^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMMCJIT,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCJIT^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCJIT^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT^android_x86_64_static/addition_copy_files.output

echo "building libLLVMOrcJIT^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMOrcJIT,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMOrcJIT^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMOrcJIT^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT^android_x86_64_static/addition_copy_files.output

echo "building libLLVMRuntimeDyld^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMRuntimeDyld,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMRuntimeDyld^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMRuntimeDyld^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld^android_x86_64_static/addition_copy_files.output

echo "building libLLVMCore^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMCore,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCore^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCore^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_64_static/addition_copy_files.output

echo "building libLLVMCore^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMCore,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCore^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMCore^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_x86_x86_64_static/addition_copy_files.output

echo "building llvm-gen-core^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-core,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-core^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-core^.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^ $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^/addition_copy_files.output

echo "building libLLVMIRReader^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMIRReader,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IRReader/libLLVMIRReader^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMIRReader^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IRReader/libLLVMIRReader^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMIRReader^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IRReader/libLLVMIRReader^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IRReader/libLLVMIRReader^android_x86_64_static/addition_copy_files.output

echo "building libLLVMLTO^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMLTO,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LTO/libLLVMLTO^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLTO^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LTO/libLLVMLTO^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLTO^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LTO/libLLVMLTO^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LTO/libLLVMLTO^android_x86_64_static/addition_copy_files.output

echo "building libLLVMLibDriver^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMLibDriver,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/libLLVMLibDriver^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLibDriver^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/libLLVMLibDriver^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLibDriver^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/libLLVMLibDriver^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/libLLVMLibDriver^android_x86_64_static/addition_copy_files.output

echo "building llvm-gen-libdriver^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-libdriver,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-libdriver^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-libdriver^.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^ $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^/addition_copy_files.output

echo "building libLLVMLinker^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMLinker,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Linker/libLLVMLinker^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLinker^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Linker/libLLVMLinker^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMLinker^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Linker/libLLVMLinker^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Linker/libLLVMLinker^android_x86_64_static/addition_copy_files.output

echo "building libLLVMMC^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMMC,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/libLLVMMC^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMC^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/libLLVMMC^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMC^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/libLLVMMC^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/libLLVMMC^android_x86_64_static/addition_copy_files.output

echo "building libLLVMMCDisassembler^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMMCDisassembler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCDisassembler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCDisassembler^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler^android_x86_64_static/addition_copy_files.output

echo "building libLLVMMCParser^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMMCParser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCParser/libLLVMMCParser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCParser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCParser/libLLVMMCParser^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMMCParser^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCParser/libLLVMMCParser^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/MC/MCParser/libLLVMMCParser^android_x86_64_static/addition_copy_files.output

echo "building libLLVMObject^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMObject,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Object/libLLVMObject^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMObject^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Object/libLLVMObject^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMObject^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Object/libLLVMObject^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Object/libLLVMObject^android_x86_64_static/addition_copy_files.output

echo "building libLLVMOption^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMOption,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Option/libLLVMOption^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMOption^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Option/libLLVMOption^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMOption^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Option/libLLVMOption^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Option/libLLVMOption^android_x86_64_static/addition_copy_files.output

echo "building libLLVMProfileData^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMProfileData,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/libLLVMProfileData^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMProfileData^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/libLLVMProfileData^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMProfileData^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/libLLVMProfileData^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/libLLVMProfileData^android_x86_64_static/addition_copy_files.output

echo "building libLLVMProfileDataCoverage^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMProfileDataCoverage,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMProfileDataCoverage^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMProfileDataCoverage^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64CodeGen^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64CodeGen,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64CodeGen^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64CodeGen^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen^android_x86_64_static/addition_copy_files.output

echo "building llvm-gen-aarch64^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-aarch64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-aarch64^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-aarch64^.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^ $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^/addition_copy_files.output

echo "building libLLVMAArch64AsmParser^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64AsmParser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64AsmParser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64AsmParser^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64Disassembler^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64Disassembler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Disassembler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Disassembler^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64AsmPrinter^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64AsmPrinter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64AsmPrinter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64AsmPrinter^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64Desc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64Desc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Desc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Desc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64Info^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64Info,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Info^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Info^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info^android_x86_64_static/addition_copy_files.output

echo "building libLLVMAArch64Utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMAArch64Utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMAArch64Utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils^android_x86_64_static/addition_copy_files.output

echo "building libLLVMARMCodeGen^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMCodeGen,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/libLLVMARMCodeGen^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMCodeGen^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/libLLVMARMCodeGen^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMCodeGen^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/libLLVMARMCodeGen^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/libLLVMARMCodeGen^android_x86_64_static/addition_copy_files.output

echo "building llvm-gen-arm^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-arm,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-arm^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-arm^.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^ $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^/addition_copy_files.output

echo "building libLLVMARMAsmParser^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMAsmParser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMAsmParser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMAsmParser^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser^android_x86_64_static/addition_copy_files.output

echo "building libLLVMARMDisassembler^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMDisassembler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMDisassembler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMDisassembler^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler^android_x86_64_static/addition_copy_files.output

echo "building libLLVMARMAsmPrinter^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMAsmPrinter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMAsmPrinter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMAsmPrinter^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter^android_x86_64_static/addition_copy_files.output

echo "building libLLVMARMDesc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMDesc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMDesc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMDesc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc^android_x86_64_static/addition_copy_files.output

echo "building libLLVMARMInfo^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMARMInfo,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMInfo^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMARMInfo^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo^android_x86_64_static/addition_copy_files.output

echo "building libLLVMTarget^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMTarget,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/libLLVMTarget^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTarget^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/libLLVMTarget^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTarget^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/libLLVMTarget^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/libLLVMTarget^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86CodeGen^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86CodeGen,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/libLLVMX86CodeGen^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86CodeGen^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/libLLVMX86CodeGen^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86CodeGen^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/libLLVMX86CodeGen^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/libLLVMX86CodeGen^android_x86_64_static/addition_copy_files.output

echo "building llvm-gen-x86^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-gen-x86,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-x86^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-gen-x86^.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^ $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^/addition_copy_files.output

echo "building libLLVMX86AsmParser^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86AsmParser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86AsmParser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86AsmParser^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86Disassembler^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86Disassembler,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Disassembler^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Disassembler^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86AsmPrinter^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86AsmPrinter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86AsmPrinter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86AsmPrinter^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86Desc^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86Desc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Desc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Desc^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86Info^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86Info,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Info^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Info^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info^android_x86_64_static/addition_copy_files.output

echo "building libLLVMX86Utils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMX86Utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMX86Utils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils^android_x86_64_static/addition_copy_files.output

echo "building libLLVMipo^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMipo,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/IPO/libLLVMipo^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMipo^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/IPO/libLLVMipo^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMipo^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/IPO/libLLVMipo^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/IPO/libLLVMipo^android_x86_64_static/addition_copy_files.output

echo "building libLLVMInstCombine^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMInstCombine,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMInstCombine^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMInstCombine^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine^android_x86_64_static/addition_copy_files.output

echo "building libLLVMInstrumentation^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMInstrumentation,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMInstrumentation^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMInstrumentation^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation^android_x86_64_static/addition_copy_files.output

echo "building libLLVMTransformObjCARC^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMTransformObjCARC,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTransformObjCARC^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTransformObjCARC^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC^android_x86_64_static/addition_copy_files.output

echo "building libLLVMScalarOpts^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMScalarOpts,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMScalarOpts^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMScalarOpts^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts^android_x86_64_static/addition_copy_files.output

echo "building libLLVMTransformUtils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMTransformUtils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTransformUtils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMTransformUtils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils^android_x86_64_static/addition_copy_files.output

echo "building libLLVMVectorize^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libLLVMVectorize,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMVectorize^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/libLLVMVectorize^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize^android_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize^android_x86_64_static/addition_copy_files.output

echo "building llvm-tblgen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja llvm-tblgen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-tblgen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/llvm/llvm-tblgen^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/llvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_llvm.tar.zst --clobber

du -ah -d1 external_llvm*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
