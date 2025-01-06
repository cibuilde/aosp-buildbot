
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

echo "Preparing for frameworks/compile/slang"

clone_depth_platform bionic
clone_depth_platform external/clang
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_depth_platform frameworks/av
clone_depth_platform frameworks/compile/libbcc
clone_depth_platform frameworks/compile/slang
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-options^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-checkers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-comment-commands^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-comment-html-named-character-references^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-html-tags^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-comment-nodes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-diagnostics^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-declnodes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-statnodes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-gen-arm-neon^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/clang/clang-version^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-intrinsics^/ .

echo "building libslang^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libslang,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/libslang^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libslang^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/libslang^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libslang^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/libslang^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/libslang^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_2_9^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_2_9,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_2_9^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_2_9^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9/libLLVMBitWriter_2_9^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_2_9_func,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_2_9_func/libLLVMBitWriter_2_9_func^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_3_2^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_3_2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_3_2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_3_2^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_3_2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_3_2^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_3_2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^android_x86_x86_64_static/addition_copy_files.output

echo "building libLLVMBitWriter_3_2^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libLLVMBitWriter_3_2,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libLLVMBitWriter_3_2^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/BitWriter_3_2/libLLVMBitWriter_3_2^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libStripUnkAttr^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libStripUnkAttr,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libStripUnkAttr^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libStripUnkAttr,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libStripUnkAttr^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libStripUnkAttr,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_64_static/addition_copy_files.output

echo "building libStripUnkAttr^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libStripUnkAttr,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^android_x86_x86_64_static/addition_copy_files.output

echo "building libStripUnkAttr^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libStripUnkAttr,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/slang/libStripUnkAttr^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/StripUnkAttr/libStripUnkAttr^linux_glibc_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_compile_slang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 frameworks_compile_slang.tar.zst --clobber

du -ah -d1 frameworks_compile_slang*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_clang.tar.zst" ]; then
  echo "Compressing external/clang -> external_clang.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_clang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/clang/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_compile_libbcc.tar.zst" ]; then
  echo "Compressing frameworks/compile/libbcc -> frameworks_compile_libbcc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_compile_libbcc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/compile/libbcc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_compile_slang.tar.zst" ]; then
  echo "Compressing frameworks/compile/slang -> frameworks_compile_slang.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_compile_slang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/compile/slang/ .
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
