set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

echo "building libhwbinder-impl-internal^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_recovery_x86_64_static

echo "building libhwbinder-impl-internal^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static

echo "building libhwbinder-impl-internal^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex29

echo "building libhwbinder-impl-internal^android_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_apex30

echo "building libhwbinder-impl-internal^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_64_static_cfi_apex29

echo "building libhwbinder-impl-internal^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static

echo "building libhwbinder-impl-internal^android_x86_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhwbinder-impl-internal,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/libhwbinder/libhwbinder-impl-internal^android_x86_x86_64_static_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_libhwbinder.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libhwbinder/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
