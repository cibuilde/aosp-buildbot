
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/llvm"

clone_depth_platform bionic
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-intrinsics^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/IR/llvm-gen-core^/ .

echo "building libLLVMBitReader^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMBitReader,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMBitReader^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMBitReader^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libLLVMBitReader^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMBitReader,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMBitReader^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMBitReader^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Bitcode/Reader/libLLVMBitReader^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libLLVMCore^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMCore,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMCore^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMCore^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libLLVMCore^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMCore,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMCore^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMCore^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/libLLVMCore^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libLLVMSupport^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMSupport,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMSupport^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMSupport^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libLLVMSupport^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libLLVMSupport,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMSupport^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/llvm/libLLVMSupport^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Support/libLLVMSupport^android_vendor.31_x86_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/llvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_llvm.tar.zst --clobber

du -ah -d1 external_llvm*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi


rm -rf aosp
