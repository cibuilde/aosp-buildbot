set -e

echo "entering packages/modules/NeuralNetworks"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/eigen
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/tensorflow
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/NeuralNetworks
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building libneuralnetworks_ndk_headers^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libneuralnetworks_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/libneuralnetworks_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks_ndk_headers^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/libneuralnetworks_ndk_headers^.output $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks_ndk_headers^ $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/runtime/libneuralnetworks_ndk_headers^/addition_copy_files.output

echo "building neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja neuralnetworks_sample_sl_driver_prebuilt,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/driver/sample_shim/neuralnetworks_sample_sl_driver_prebuilt^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building philox_random^android_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja philox_random,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/philox_random^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/philox_random^android_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_64_static_apex30/addition_copy_files.output

echo "building philox_random^android_x86_x86_64_static_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja philox_random,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/philox_random^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_x86_64_static_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/modules/NeuralNetworks/philox_random^android_x86_x86_64_static_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_x86_64_static_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_x86_64_static_apex30/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_modules_NeuralNetworks.tar.zst --clobber

du -ah -d1 packages_modules_NeuralNetworks*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_eigen.tar.zst" ]; then
  echo "Compressing external/eigen -> external_eigen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_eigen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/eigen/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst" ]; then
  echo "Compressing external/tensorflow -> external_tensorflow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tensorflow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tensorflow/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi

rm -rf aosp
