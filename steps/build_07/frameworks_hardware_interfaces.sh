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
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-api^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building android.frameworks.bufferhub@1.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.bufferhub@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_static

echo "building android.frameworks.bufferhub@1.0^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.bufferhub@1.0,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.bufferhub@1.0^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_static

echo "building android.frameworks.cameraservice.common@2.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.common@2.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_static

echo "building android.frameworks.cameraservice.device@2.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.device@2.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_static

echo "building android.frameworks.cameraservice.device@2.1^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.device@2.1,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_static

echo "building android.frameworks.cameraservice.service@2.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.service@2.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_static

echo "building android.frameworks.cameraservice.service@2.1^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.service@2.1,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_static

echo "building android.frameworks.cameraservice.service@2.2^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.cameraservice.service@2.2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_static

echo "building android.frameworks.displayservice@1.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.displayservice@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_static

echo "building android.frameworks.schedulerservice@1.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.schedulerservice@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_static

echo "building android.frameworks.schedulerservice@1.0^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.schedulerservice@1.0,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_static

echo "building android.frameworks.sensorservice@1.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.sensorservice@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_static

echo "building android.frameworks.sensorservice@1.0^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.sensorservice@1.0,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.sensorservice@1.0^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_static

echo "building android.frameworks.stats-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.stats-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^

echo "building android.frameworks.stats@1.0^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.stats@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_static

echo "building android.frameworks.stats@1.0^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.frameworks.stats@1.0,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 frameworks_hardware_interfaces.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
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