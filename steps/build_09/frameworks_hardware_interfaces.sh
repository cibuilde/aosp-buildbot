
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/hardware/interfaces"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libhidl
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .

echo "building android.frameworks.cameraservice.common@2.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.common@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.common@2.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/common/2.0/android.frameworks.cameraservice.common@2.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.device@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.cameraservice.device@2.1^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.device@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.device@2.1^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.service@2.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.1^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.service@2.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.1^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.cameraservice.service@2.2^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.cameraservice.service@2.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.cameraservice.service@2.2^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.displayservice@1.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.displayservice@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.displayservice@1.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.schedulerservice@1.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.schedulerservice@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.schedulerservice@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.stats@1.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.stats@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.stats@1.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.stats@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats@1.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.stats-V1-ndk_platform^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.stats-V1-ndk_platform,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared/addition_copy_files.output

echo "building android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja android.frameworks.stats-V1-ndk_platform,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/hardware/interfaces/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 frameworks_hardware_interfaces.tar.zst --clobber

du -ah -d1 frameworks_hardware_interfaces*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
