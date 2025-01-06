
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for hardware/interfaces"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcppbor
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcppbor/libcppbor_external^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_portable^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libsoft_attestation_cert^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libpuresoftkeymasterdevice^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libcppcose_rkp^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/keymaster/libkeymaster_messages^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .

echo "building android.hardware.audio.common@7.0-enums^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.audio.common@7.0-enums,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_shared/addition_copy_files.output

echo "building android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.audio.common@7.0-enums,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_shared/addition_copy_files.output

echo "building android.hardware.authsecret-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.authsecret-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.authsecret-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.authsecret-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.biometrics.face-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.biometrics.face-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.biometrics.fingerprint-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.identity-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.identity-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.identity-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.identity-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.lights-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.lights-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.lights-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.lights-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.memtrack-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.memtrack-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.memtrack-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.memtrack-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.oemlock-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.oemlock-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.oemlock-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.oemlock-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.power-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.power-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.power-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.power-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/default/android.hardware.power-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.power.stats-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.power.stats-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.power.stats-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.power.stats-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.rebootescrow-service.default^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.rebootescrow-service.default,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.vibrator-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.vibrator-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.vibrator-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.vibrator-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example^android_vendor.31_x86_64/addition_copy_files.output

echo "building android.hardware.weaver-service.example^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.hardware.weaver-service.example,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.weaver-service.example^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/hardware/interfaces/android.hardware.weaver-service.example^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example^android_vendor.31_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst" ]; then
  echo "Compressing external/libcppbor -> external_libcppbor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcppbor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcppbor/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_keymaster.tar.zst" ]; then
  echo "Compressing system/keymaster -> system_keymaster.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_keymaster.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/keymaster/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
