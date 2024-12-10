set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform external/angle
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_sparse prebuilts/ndk current
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building angle_common^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_common^android_x86_64_static

echo "building angle_common^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_common,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_common^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_common^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_common^android_x86_x86_64_static

echo "building angle_gpu_info_util^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_gpu_info_util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_gpu_info_util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_gpu_info_util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_gpu_info_util^android_x86_64_static

echo "building angle_gpu_info_util^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_gpu_info_util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_gpu_info_util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_gpu_info_util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_gpu_info_util^android_x86_x86_64_static

echo "building angle_image_util^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_image_util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_image_util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_image_util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_image_util^android_x86_64_static

echo "building angle_image_util^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_image_util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_image_util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_image_util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_image_util^android_x86_x86_64_static

echo "building angle_preprocessor^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_preprocessor,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_preprocessor^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_preprocessor^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_preprocessor^android_x86_64_static

echo "building angle_preprocessor^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja angle_preprocessor,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_preprocessor^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/angle_preprocessor^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_preprocessor^android_x86_x86_64_static

echo "building chrome_zlib^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja chrome_zlib,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/chrome_zlib^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/chrome_zlib^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/chrome_zlib^android_x86_64_static

echo "building chrome_zlib^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja chrome_zlib,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/chrome_zlib^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/chrome_zlib^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/chrome_zlib^android_x86_x86_64_static

echo "building third_party_zlib_google_compression_utils_portable^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja third_party_zlib_google_compression_utils_portable,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_64_static

echo "building third_party_zlib_google_compression_utils_portable^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja third_party_zlib_google_compression_utils_portable,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_zlib_google_compression_utils_portable^android_x86_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_angle.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/angle/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_angle.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_angle.tar.xz -C $GITHUB_WORKSPACE/aosp/external/angle/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_ndk.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/ndk/ .
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