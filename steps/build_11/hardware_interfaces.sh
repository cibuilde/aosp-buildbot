set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.biometrics.common-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_shared

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_shared

echo "building libhwc2onfbadapter^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libhwc2onfbadapter,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/hardware/interfaces/libhwc2onfbadapter^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter^android_vendor.31_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
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

rm -rf aosp
