set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform bionic
clone_depth_platform external/icu
clone_depth_platform external/libxml2
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building libxml2^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static

echo "building libxml2^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_apex10000

echo "building libxml2^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_apex31

echo "building libxml2^android_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_64_static_lto-thin_apex31

echo "building libxml2^android_x86_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^android_x86_x86_64_static_lto-thin_apex31

echo "building libxml2^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libxml2,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/libxml2/libxml2^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libxml2/libxml2^linux_glibc_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_libxml2.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/libxml2/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_icu.tar.xz -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libxml2.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp