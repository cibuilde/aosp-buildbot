set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_sparse cts libs/json
clone_depth_platform external/angle
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_core_enums_unified1^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_core_enums_unified1^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_core_tables_unified1^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_core_tables_unified1^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_generators_inc^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_generators_inc^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_glsl_tables_glsl1-0^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_glsl_tables_glsl1-0^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_cldebuginfo100^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_cldebuginfo100^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_debuginfo^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_debuginfo^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_vkdebuginfo100^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_language_header_vkdebuginfo100^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_opencl_tables_opencl1-0^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_opencl_tables_opencl1-0^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_debuginfo^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_debuginfo^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_nonsemantic.clspvreflection^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_nonsemantic.clspvreflection^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_nonsemantic.shader.debuginfo.100^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_nonsemantic.shader.debuginfo.100^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_opencl.debuginfo.100^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_opencl.debuginfo.100^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-gcn-shader^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-gcn-shader^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-ballot^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-ballot^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-explicit-vertex-parameter^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-explicit-vertex-parameter^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-trinary-minmax^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_vendor_tables_spv-amd-shader-trinary-minmax^android_x86_x86_64/ .

echo "building angle_translator^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja angle_translator,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_translator^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/angle_translator^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_translator^android_x86_64_static

echo "building angle_translator^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja angle_translator,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/angle_translator^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/angle_translator^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/angle_translator^android_x86_x86_64_static

echo "building third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja third_party_vulkan_deps_spirv_tools_src_spvtools,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_64_static

echo "building third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja third_party_vulkan_deps_spirv_tools_src_spvtools,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools^android_x86_x86_64_static

echo "building third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja third_party_vulkan_deps_spirv_tools_src_spvtools_val,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_64_static

echo "building third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja third_party_vulkan_deps_spirv_tools_src_spvtools_val,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/angle/third_party_vulkan_deps_spirv_tools_src_spvtools_val^android_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_angle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/angle/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_angle.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_angle.tar.zst" ]; then
  echo "Compressing external/angle -> external_angle.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_angle.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/angle/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
