set -e

echo "entering hardware/interfaces"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .

echo "building android.hardware.health-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.health-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.health-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants^android_common

echo "building android.hardware.thermal-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.thermal-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.thermal-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants^android_common

echo "building android.hardware.tv.input-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.tv.input-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.tv.input-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants^android_common

echo "building android.hardware.tv.tuner-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.tv.tuner-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.tv.tuner-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants^android_common

echo "building android.hardware.tv.tuner-V1.1-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.tv.tuner-V1.1-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.tv.tuner-V1.1-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants^android_common

echo "building android.hardware.usb-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.usb-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.usb-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants^android_common

echo "building android.hardware.usb-V1.1-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.usb-V1.1-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.usb-V1.1-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants^android_common

echo "building android.hardware.usb-V1.2-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.usb-V1.2-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.usb-V1.2-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java-constants^android_common

echo "building android.hardware.wifi-V1.0-java-constants^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.wifi-V1.0-java-constants,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.wifi-V1.0-java-constants^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants^android_common

echo "building android.hardware.wifi-V1.0-java-constants^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_13.ninja android.hardware.wifi-V1.0-java-constants,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_13/hardware/interfaces/android.hardware.wifi-V1.0-java-constants^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants^android_common_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_13 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
