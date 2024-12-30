set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_depth_platform platform/hardware/interfaces
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/art/build/boot/art-bootclasspath-fragment^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dex2oat/dex2oatd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_module_lib_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/hwbinder.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core.current.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common/ .

echo "building android.hardware.weaver-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.weaver-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.weaver-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common

echo "building android.hardware.usb-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.usb-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.usb-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common

echo "building android.hardware.usb-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.usb-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.usb-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common

echo "building android.hardware.usb-V1.2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.usb-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.usb-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common

echo "building android.hardware.usb-V1.3-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.usb-V1.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.usb-V1.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common

echo "building android.hardware.tv.cec-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.tv.cec-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.tv.cec-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common

echo "building android.hardware.tv.cec-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.tv.cec-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.tv.cec-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common

echo "building android.hardware.soundtrigger-V2.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.soundtrigger-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.soundtrigger-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common

echo "building android.hardware.soundtrigger-V2.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.soundtrigger-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.soundtrigger-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common

echo "building android.hardware.soundtrigger-V2.2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.soundtrigger-V2.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.soundtrigger-V2.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common

echo "building android.hardware.soundtrigger-V2.3-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.soundtrigger-V2.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.soundtrigger-V2.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common

echo "building android.hardware.security.secureclock-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.security.secureclock-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.security.secureclock-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java^android_common

echo "building android.hardware.security.keymint-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.security.keymint-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.security.keymint-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java^android_common

echo "building android.hardware.secure_element-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.secure_element-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.secure_element-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common

echo "building android.hardware.secure_element-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.secure_element-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.secure_element-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common

echo "building android.hardware.secure_element-V1.2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.secure_element-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.secure_element-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common

echo "building android.hardware.rebootescrow-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.rebootescrow-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.rebootescrow-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java^android_common

echo "building android.hardware.power.stats-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.power.stats-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.power.stats-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java^android_common

echo "building android.hardware.power-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.power-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.power-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common

echo "building android.hardware.power-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.power-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.power-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java^android_common

echo "building android.hardware.oemlock-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.oemlock-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.oemlock-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common

echo "building android.hardware.light-V2.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.light-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.light-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common

echo "building android.hardware.light-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.light-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.light-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-java^android_common

echo "building android.hardware.keymaster-V3-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.keymaster-V3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.keymaster-V3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java^android_common

echo "building android.hardware.health-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.health-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.health-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common

echo "building android.hardware.health-V2.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.health-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.health-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common

echo "building android.hardware.health-V2.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.health-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.health-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common

echo "building android.hardware.gnss-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.gnss-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.gnss-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java^android_common

echo "building android.hardware.dumpstate-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.dumpstate-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.dumpstate-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common

echo "building android.hardware.dumpstate-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.dumpstate-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.dumpstate-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common

echo "building android.hardware.configstore-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.configstore-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.configstore-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common

echo "building android.hardware.configstore-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.configstore-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.configstore-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common

echo "building android.hardware.common-V2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.common-V2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.common-V2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-java^android_common

echo "building android.hardware.broadcastradio-V2.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.broadcastradio-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.broadcastradio-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common

echo "building android.hardware.boot-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.boot-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.boot-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common

echo "building android.hardware.boot-V1.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.boot-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.boot-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common

echo "building android.hardware.boot-V1.2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.boot-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.boot-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common

echo "building android.hardware.biometrics.fingerprint-V2.1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.fingerprint-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common

echo "building android.hardware.biometrics.fingerprint-V2.2-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.fingerprint-V2.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common

echo "building android.hardware.biometrics.fingerprint-V2.3-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.fingerprint-V2.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common

echo "building android.hardware.biometrics.face-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.face-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.face-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common

echo "building android.hardware.biometrics.common-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.common-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.common-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java^android_common

echo "building android.hardware.biometrics.fingerprint-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.fingerprint-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java^android_common

echo "building android.hardware.biometrics.face-V1-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.biometrics.face-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.biometrics.face-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java^android_common

echo "building android.hardware.authsecret-V1.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.authsecret-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.authsecret-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common

echo "building android.hardware.audio.common-V2.0-java^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja android.hardware.audio.common-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/platform/hardware/interfaces/android.hardware.audio.common-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_31 platform_hardware_interfaces.tar.zst --clobber

du -ah -d1 platform_hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_hardware_interfaces.tar.zst" ]; then
  echo "Compressing platform/hardware/interfaces -> platform_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi

rm -rf aosp
