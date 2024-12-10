set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lzma
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

echo "building libbacktrace^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libbacktrace,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libbacktrace/libbacktrace^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libbacktrace^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libbacktrace/libbacktrace^linux_glibc_x86_64_static

echo "building libunwindstack^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_recovery_x86_64_static

echo "building libunwindstack^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static

echo "building libunwindstack^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static_apex10000

echo "building libunwindstack^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_64_static_apex31

echo "building libunwindstack^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static

echo "building libunwindstack^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static_apex10000

echo "building libunwindstack^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_static_apex31

echo "building libunwindstack^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack^linux_glibc_x86_64_static

echo "building libunwindstack_no_dex^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_recovery_x86_64_static

echo "building libunwindstack_no_dex^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_vendor_ramdisk_x86_64_static

echo "building libunwindstack_no_dex^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static

echo "building libunwindstack_no_dex^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static_apex10000

echo "building libunwindstack_no_dex^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static

echo "building libunwindstack_no_dex^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libunwindstack_no_dex,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/unwinding/libunwindstack_no_dex^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static_apex10000

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_unwinding.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/unwinding/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_lzma.tar.xz -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libprocinfo.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libprocinfo.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libprocinfo/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.xz -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
rm -rf aosp