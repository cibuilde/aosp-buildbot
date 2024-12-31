set -e

echo "entering external/clang"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/clang
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/llvm
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/Support/libLLVMSupport^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/lib/TableGen/libLLVMTableGen^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-attributes^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/llvm-gen-intrinsics^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/ .

echo "building clang-gen-arm-neon^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-arm-neon,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-arm-neon^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-arm-neon^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-arm-neon^

echo "building clang-gen-attributes^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-attributes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-attributes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-attributes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-attributes^

echo "building clang-gen-checkers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-checkers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-checkers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-checkers^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-checkers^

echo "building clang-gen-comment-commands^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-comment-commands,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-commands^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-comment-commands^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-commands^

echo "building clang-gen-comment-html-named-character-references^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-comment-html-named-character-references,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-html-named-character-references^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-comment-html-named-character-references^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-html-named-character-references^

echo "building clang-gen-comment-nodes^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-comment-nodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-nodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-comment-nodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-nodes^

echo "building clang-gen-declnodes^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-declnodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-declnodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-declnodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-declnodes^

echo "building clang-gen-diagnostics^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-diagnostics,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-diagnostics^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-diagnostics^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-diagnostics^

echo "building clang-gen-html-tags^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-html-tags,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-html-tags^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-html-tags^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-html-tags^

echo "building clang-gen-options^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-options,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-options^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-options^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-options^

echo "building clang-gen-statnodes^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-gen-statnodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-statnodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-gen-statnodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-statnodes^

echo "building clang-tblgen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja clang-tblgen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/utils/TableGen/clang-tblgen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/clang/clang-tblgen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/clang/utils/TableGen/clang-tblgen^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_clang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/clang/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_clang.tar.zst --clobber

du -ah -d1 external_clang*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
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
