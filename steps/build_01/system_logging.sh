set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform external/zstd
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building liblog^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static

echo "building liblog^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static

echo "building liblog^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static

echo "building liblog^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_apex10000

echo "building liblog^android_x86_64_static_cfi_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_64_static_cfi_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_64_static_cfi_lto-thin.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static_cfi_lto-thin

echo "building liblog^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static

echo "building liblog^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_x86_64_static_apex10000

echo "building liblog^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_static

echo "building liblog^linux_glibc_x86_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_static

echo "building liblog_ndk_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblog_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblog_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog_ndk_headers^

echo "building liblogd^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogd,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogd^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/logging/logd/liblogd^android_x86_64_static_cfi

echo "building liblogwrap^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static

echo "building liblogwrap^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static

echo "building liblogwrap^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja liblogwrap,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/liblogwrap^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_x86_64_static

echo "building logcatd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja logcatd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logcatd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logcatd^android_x86_64

echo "building logpersist.start^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja logpersist.start,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logpersist.start^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logcat/logpersist.start^android_x86_64

echo "building logtagd.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja logtagd.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/logging/logtagd.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/logging/logd/logtagd.rc^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_logging.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/logging/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  echo "Compressing art -> art.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  echo "Compressing bionic -> bionic.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.xz" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zstd.tar.xz" ]; then
  echo "Compressing external/zstd -> external_zstd.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zstd.tar.xz -C $GITHUB_WORKSPACE/aosp/external/zstd/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  echo "Compressing system/logging -> system_logging.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  echo "Compressing system/media -> system_media.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
