set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/native
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers^/ .

echo "building android.hidl.allocator@1.0^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.allocator@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.allocator@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_64_static

echo "building android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.allocator@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hidl.memory.token@1.0^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.memory.token@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.memory.token@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_64_static

echo "building android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.memory.token@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hidl.memory@1.0^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.memory@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.memory@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_64_static

echo "building android.hidl.memory@1.0^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.memory@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hidl.safe_union@1.0^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.safe_union@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.safe_union@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_64_static

echo "building android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.safe_union@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hidl.token@1.0-utils^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.token@1.0-utils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.token@1.0-utils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_static

echo "building android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.token@1.0-utils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_static

echo "building android.hidl.token@1.0^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.token@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.token@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_64_static

echo "building android.hidl.token@1.0^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hidl.token@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/android.hidl.token@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_vendor.31_x86_x86_64_static

echo "building libhidlmemory^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libhidlmemory,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/libhidlmemory^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_static

echo "building libhidlmemory^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libhidlmemory,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/libhidl/libhidlmemory^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/libhidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_libhidl.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
