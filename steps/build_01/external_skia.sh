set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_sparse cts libs/json
clone_depth_platform external/dng_sdk
clone_depth_platform external/expat
clone_depth_platform external/freetype
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libjpeg-turbo
clone_depth_platform external/libpng
clone_depth_platform external/piex
clone_depth_platform external/sfntly
clone_depth_platform external/skia
clone_depth_platform external/vulkan-headers
clone_depth_platform external/webp
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
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

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_skia.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/skia/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_skia.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.zst -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.zst -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dng_sdk.tar.zst" ]; then
  echo "Compressing external/dng_sdk -> external_dng_sdk.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_dng_sdk.tar.zst -C $GITHUB_WORKSPACE/aosp/external/dng_sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_expat.tar.zst -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.zst" ]; then
  echo "Compressing external/freetype -> external_freetype.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_freetype.tar.zst -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst" ]; then
  echo "Compressing external/libjpeg-turbo -> external_libjpeg-turbo.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libjpeg-turbo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libpng.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_piex.tar.zst" ]; then
  echo "Compressing external/piex -> external_piex.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_piex.tar.zst -C $GITHUB_WORKSPACE/aosp/external/piex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sfntly.tar.zst" ]; then
  echo "Compressing external/sfntly -> external_sfntly.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_sfntly.tar.zst -C $GITHUB_WORKSPACE/aosp/external/sfntly/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_skia.tar.zst" ]; then
  echo "Compressing external/skia -> external_skia.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_skia.tar.zst -C $GITHUB_WORKSPACE/aosp/external/skia/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_webp.tar.zst" ]; then
  echo "Compressing external/webp -> external_webp.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_webp.tar.zst -C $GITHUB_WORKSPACE/aosp/external/webp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
