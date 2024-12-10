set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_sparse cts libs/json
clone_depth_platform external/dng_sdk
clone_depth_platform external/expat
clone_depth_platform external/freetype
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/sfntly
clone_depth_platform external/skia
clone_depth_platform external/vulkan-headers
clone_depth_platform external/webp
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building libskia^android_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libskia,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/skia/libskia^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/skia/libskia^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/skia/libskia^android_x86_64_static_lto-thin

echo "building libskia^android_x86_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libskia,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/skia/libskia^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/skia/libskia^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/skia/libskia^android_x86_x86_64_static_lto-thin

echo "building libskia_renderengine^android_x86_64_static_lto-thin"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libskia_renderengine,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/skia/libskia_renderengine^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/skia/libskia_renderengine^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/skia/libskia_renderengine^android_x86_64_static_lto-thin

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_skia.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/skia/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.xz -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dng_sdk.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_dng_sdk.tar.xz -C $GITHUB_WORKSPACE/aosp/external/dng_sdk/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_expat.tar.xz -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_freetype.tar.xz -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sfntly.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_sfntly.tar.xz -C $GITHUB_WORKSPACE/aosp/external/sfntly/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_skia.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_skia.tar.xz -C $GITHUB_WORKSPACE/aosp/external/skia/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.xz -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_webp.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_webp.tar.xz -C $GITHUB_WORKSPACE/aosp/external/webp/ .
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