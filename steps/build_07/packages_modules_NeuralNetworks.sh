set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/NeuralNetworks
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_27

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_28

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_29

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_30

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_31

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_REL

echo "building libneuralnetworks.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_64_sdk_shared_current

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_27

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_28

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_29

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_30

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_31

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks.ndk^android_x86_x86_64_sdk_shared_current

echo "building libneuralnetworks_packageinfo^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks_packageinfo,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks_packageinfo^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_64_shared_current

echo "building libneuralnetworks_packageinfo^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libneuralnetworks_packageinfo,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/libneuralnetworks_packageinfo^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/packageinfo/libneuralnetworks_packageinfo^android_x86_x86_64_shared_current

echo "building neuralnetworks_types^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja neuralnetworks_types,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/neuralnetworks_types^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_64_static_apex30

echo "building neuralnetworks_types^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja neuralnetworks_types,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/modules/NeuralNetworks/neuralnetworks_types^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_x86_64_static_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_modules_NeuralNetworks.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst" ]; then
  echo "Compressing packages/modules/NeuralNetworks -> packages_modules_NeuralNetworks.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/NeuralNetworks/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
