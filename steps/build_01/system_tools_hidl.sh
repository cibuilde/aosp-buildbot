set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/hidl

echo "building libhidl-gen-hash^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-hash,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hashing/libhidl-gen-hash^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-hash^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hashing/libhidl-gen-hash^android_x86_64_static

echo "building libhidl-gen-hash^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-hash,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hashing/libhidl-gen-hash^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-hash^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/hashing/libhidl-gen-hash^linux_glibc_x86_64_static

echo "building libhidl-gen-host-utils^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-host-utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/host_utils/libhidl-gen-host-utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-host-utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/host_utils/libhidl-gen-host-utils^linux_glibc_x86_64_static

echo "building libhidl-gen-utils^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_recovery_x86_64_static

echo "building libhidl-gen-utils^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_x86_64_static

echo "building libhidl-gen-utils^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-utils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-utils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^android_x86_x86_64_static

echo "building libhidl-gen-utils^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen-utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen-utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_static

echo "building libhidl-gen^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libhidl-gen,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/tools/hidl/libhidl-gen^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/libhidl-gen^linux_glibc_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_tools_hidl.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  echo "Compressing bionic -> bionic.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.xz" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.xz -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  echo "Compressing system/core -> system_core.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.xz" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  echo "Compressing system/logging -> system_logging.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  echo "Compressing system/media -> system_media.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.xz" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.xz -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
