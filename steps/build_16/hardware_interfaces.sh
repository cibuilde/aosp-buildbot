
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

echo "Preparing for hardware/interfaces"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform hardware/interfaces
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/libhidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/hwbinder.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java_gen_java^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base-V1.0-java^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union-V1.0-java^android_common/ .

echo "building android.hardware.authsecret-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.authsecret-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.authsecret-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.authsecret-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.face-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.biometrics.face-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.face-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.face-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.fingerprint-V2.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.biometrics.fingerprint-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.fingerprint-V2.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.biometrics.fingerprint-V2.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java^android_common/addition_copy_files.output

echo "building android.hardware.biometrics.fingerprint-V2.3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.biometrics.fingerprint-V2.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java^android_common/addition_copy_files.output

echo "building android.hardware.boot-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.boot-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.boot-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.boot-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.boot-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.boot-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.boot-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.broadcastradio-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.broadcastradio-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.broadcastradio-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.broadcastradio-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.cas-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.cas-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.cas-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.cas-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.cas-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.cas-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.cas-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.configstore-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.configstore-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.configstore-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.configstore-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.configstore-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.configstore-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.configstore-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.configstore-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.contexthub-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.contexthub-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.contexthub-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.contexthub-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.contexthub-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.contexthub-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.contexthub-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.dumpstate-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.dumpstate-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.dumpstate-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.dumpstate-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.dumpstate-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.dumpstate-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.dumpstate-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.dumpstate-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss-V2.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss-V2.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss.measurement_corrections-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss.measurement_corrections-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss.measurement_corrections-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss.measurement_corrections-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.gnss.visibility_control-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.gnss.visibility_control-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.visibility_control-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.gnss.visibility_control-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.health-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.health-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.health-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.health-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.health-V2.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.health-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.health-V2.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java^android_common/addition_copy_files.output

echo "building android.hardware.light-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.light-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.light-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.light-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.oemlock-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.oemlock-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.oemlock-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.oemlock-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.power-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.power-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.power-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.power-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.4-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.4-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.4-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.4-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.5-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.5-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.5-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.5-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java^android_common/addition_copy_files.output

echo "building android.hardware.radio-V1.6-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio-V1.6-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.6-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio-V1.6-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.0-java-shallow^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.0-java-shallow,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java-shallow^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.0-java-shallow^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java-shallow^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.0-java-shallow^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java-shallow^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java-shallow^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.1-java-shallow^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.1-java-shallow,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java-shallow^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.1-java-shallow^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java-shallow^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.1-java-shallow^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java-shallow^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java-shallow^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.2-java-shallow^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.2-java-shallow,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java-shallow^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.2-java-shallow^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java-shallow^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.2-java-shallow^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java-shallow^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java-shallow^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.radio.config-V1.3-java-shallow^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.config-V1.3-java-shallow,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java-shallow^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.3-java-shallow^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java-shallow^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.config-V1.3-java-shallow^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java-shallow^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java-shallow^android_common/addition_copy_files.output

echo "building android.hardware.radio.deprecated-V1.0-java-shallow^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.radio.deprecated-V1.0-java-shallow,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java-shallow^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.deprecated-V1.0-java-shallow^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java-shallow^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.radio.deprecated-V1.0-java-shallow^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java-shallow^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java-shallow^android_common/addition_copy_files.output

echo "building android.hardware.secure_element-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.secure_element-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.secure_element-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.secure_element-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.secure_element-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.secure_element-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.secure_element-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.soundtrigger-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.soundtrigger-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.soundtrigger-V2.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.soundtrigger-V2.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java^android_common/addition_copy_files.output

echo "building android.hardware.soundtrigger-V2.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.soundtrigger-V2.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java^android_common/addition_copy_files.output

echo "building android.hardware.soundtrigger-V2.3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.soundtrigger-V2.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.soundtrigger-V2.3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java^android_common/addition_copy_files.output

echo "building android.hardware.tetheroffload.config-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.tetheroffload.config-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.tetheroffload.control-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.tetheroffload.control-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.tetheroffload.control-V1.1-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.tetheroffload.control-V1.1-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.thermal-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.thermal-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.thermal-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.thermal-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.thermal-V2.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.thermal-V2.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V2.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.thermal-V2.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java^android_common/addition_copy_files.output

echo "building android.hardware.tv.cec-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.tv.cec-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tv.cec-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tv.cec-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.tv.cec-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.tv.cec-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tv.cec-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.tv.cec-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.usb-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.usb-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.usb-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.usb-V1.3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb-V1.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb-V1.3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java^android_common/addition_copy_files.output

echo "building android.hardware.usb.gadget-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb.gadget-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.usb.gadget-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb.gadget-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.usb.gadget-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.usb.gadget-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.usb.gadget-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.vibrator-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.vibrator-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.vibrator-V1.1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.vibrator-V1.1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.1-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java^android_common/addition_copy_files.output

echo "building android.hardware.vibrator-V1.2-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.vibrator-V1.2-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.2-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.2-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java^android_common/addition_copy_files.output

echo "building android.hardware.vibrator-V1.3-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.vibrator-V1.3-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.3-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.vibrator-V1.3-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java^android_common/addition_copy_files.output

echo "building android.hardware.weaver-V1.0-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.weaver-V1.0-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.weaver-V1.0-java^android_common.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.weaver-V1.0-java^android_common.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java^android_common/addition_copy_files.output

echo "building android.hardware.wifi-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi-V1.1-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.1-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.1-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.1-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi-V1.2-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.2-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.2-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.2-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi-V1.3-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.3-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.3-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.3-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi-V1.4-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.4-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.4-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.4-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi-V1.5-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi-V1.5-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.5-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi-V1.5-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.hostapd-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.hostapd-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.hostapd-V1.1-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.hostapd-V1.1-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.hostapd-V1.2-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.hostapd-V1.2-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.hostapd-V1.3-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.hostapd-V1.3-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.supplicant-V1.0-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.supplicant-V1.0-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.supplicant-V1.1-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.supplicant-V1.1-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.supplicant-V1.2-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.supplicant-V1.2-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.supplicant-V1.3-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.supplicant-V1.3-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java^android_common_apex30/addition_copy_files.output

echo "building android.hardware.wifi.supplicant-V1.4-java^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja android.hardware.wifi.supplicant-V1.4-java,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_16/hardware/interfaces/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30 $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_16 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi


rm -rf aosp
