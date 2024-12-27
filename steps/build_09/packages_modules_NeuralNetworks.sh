set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/eigen
clone_depth_platform external/fmtlib
clone_depth_platform external/gemmlowp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libtextclassifier
clone_depth_platform external/ruy
clone_depth_platform external/tensorflow
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
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

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/kernels/libtflite_kernel_utils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/kernels/libtflite_kernel_utils^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/tensorflow/tensorflow/lite/kernels/libtflite_kernel_utils^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_64_static_com.android.neuralnetworks/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_x86_64_static_com.android.neuralnetworks/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_64_static_com.android.neuralnetworks/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_x86_64_static_com.android.neuralnetworks/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/neuralnetworks_types^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/random/philox_random^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .

echo "building libneuralnetworks_common^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libneuralnetworks_common,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/NeuralNetworks/libneuralnetworks_common^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_vendor.31_x86_64_static

echo "building libneuralnetworks_common^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libneuralnetworks_common,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/NeuralNetworks/libneuralnetworks_common^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_x86_64_static_com.android.neuralnetworks

echo "building libneuralnetworks_common^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libneuralnetworks_common,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/NeuralNetworks/libneuralnetworks_common^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/common/libneuralnetworks_common^android_x86_x86_64_static_com.android.neuralnetworks

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_NeuralNetworks.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/NeuralNetworks/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 packages_modules_NeuralNetworks.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_eigen.tar.zst" ]; then
  echo "Compressing external/eigen -> external_eigen.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_eigen.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/eigen/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gemmlowp.tar.zst" ]; then
  echo "Compressing external/gemmlowp -> external_gemmlowp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gemmlowp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gemmlowp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst" ]; then
  echo "Compressing external/libtextclassifier -> external_libtextclassifier.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libtextclassifier.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libtextclassifier/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_ruy.tar.zst" ]; then
  echo "Compressing external/ruy -> external_ruy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_ruy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/ruy/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
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
