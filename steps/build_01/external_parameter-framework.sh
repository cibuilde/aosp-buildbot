set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform bionic
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/parameter-framework
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

echo "building libparameter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libparameter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libparameter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libparameter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libparameter^android_x86_64_static

echo "building libparameter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libparameter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libparameter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libparameter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libparameter^android_x86_x86_64_static

echo "building libpfw_utility^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpfw_utility,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libpfw_utility^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libpfw_utility^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libpfw_utility^android_x86_64_static

echo "building libpfw_utility^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpfw_utility,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libpfw_utility^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libpfw_utility^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libpfw_utility^android_x86_x86_64_static

echo "building libremote-processor^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libremote-processor,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libremote-processor^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libremote-processor^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libremote-processor^android_x86_64_static

echo "building libremote-processor^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libremote-processor,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libremote-processor^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/parameter-framework/libremote-processor^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/parameter-framework/libremote-processor^android_x86_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_parameter-framework.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/parameter-framework/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_icu.tar.xz -C $GITHUB_WORKSPACE/aosp/external/icu/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libxml2.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_parameter-framework.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_parameter-framework.tar.xz -C $GITHUB_WORKSPACE/aosp/external/parameter-framework/ .
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