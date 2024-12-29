set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcppbor
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/libhidl
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl-gen^linux_glibc_x86_64/ .

echo "building libvibratorexampleimpl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libvibratorexampleimpl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libvibratorexampleimpl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl^android_vendor.31_x86_64_static

echo "building librebootescrowdefaultimpl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja librebootescrowdefaultimpl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/librebootescrowdefaultimpl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl^android_vendor.31_x86_64_static

echo "building libkeymint_support^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libkeymint_support,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libkeymint_support^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_static

echo "building libhealthloop^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libhealthloop,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libhealthloop^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_x86_64_static

echo "building libhealthloop^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libhealthloop,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libhealthloop^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_64_static

echo "building libhadamardutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libhadamardutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libhadamardutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils^android_vendor.31_x86_64_static

echo "building libaidlcommonsupport^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaidlcommonsupport,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libaidlcommonsupport^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_x86_64_static_apex30

echo "building libaidlcommonsupport^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaidlcommonsupport,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libaidlcommonsupport^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_64_static_apex30

echo "building libaidlcommonsupport^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaidlcommonsupport,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/libaidlcommonsupport^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_vendor.31_x86_64_static

echo "building android.hardware.wifi@1.5-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.5-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi@1.5-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.5-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi@1.5-inheritance-hierarchy^

echo "building android.hardware.wifi@1.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi@1.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi@1.4-inheritance-hierarchy^

echo "building android.hardware.wifi@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi@1.3-inheritance-hierarchy^

echo "building android.hardware.wifi@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi@1.2-inheritance-hierarchy^

echo "building android.hardware.wifi@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi@1.1-inheritance-hierarchy^

echo "building android.hardware.wifi@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0_genc++_headers^

echo "building android.hardware.wifi@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0_genc++^

echo "building android.hardware.wifi@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant@1.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant@1.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant@1.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant@1.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant@1.4-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant@1.3-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant@1.2-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant@1.1-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant@1.0-inheritance-hierarchy^

echo "building android.hardware.wifi.supplicant-V1.4-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant-V1.4-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant-V1.4-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant-V1.4-java_gen_java^

echo "building android.hardware.wifi.supplicant-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant-V1.3-java_gen_java^

echo "building android.hardware.wifi.supplicant-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant-V1.2-java_gen_java^

echo "building android.hardware.wifi.supplicant-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant-V1.1-java_gen_java^

echo "building android.hardware.wifi.supplicant-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.supplicant-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.supplicant-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant-V1.0-java_gen_java^

echo "building android.hardware.wifi.offload@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.offload@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/offload/1.0/android.hardware.wifi.offload@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.offload@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/offload/1.0/android.hardware.wifi.offload@1.0-inheritance-hierarchy^

echo "building android.hardware.wifi.hostapd@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd@1.3-inheritance-hierarchy^

echo "building android.hardware.wifi.hostapd@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd@1.2-inheritance-hierarchy^

echo "building android.hardware.wifi.hostapd@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd@1.1-inheritance-hierarchy^

echo "building android.hardware.wifi.hostapd@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd@1.0-inheritance-hierarchy^

echo "building android.hardware.wifi.hostapd-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd-V1.3-java_gen_java^

echo "building android.hardware.wifi.hostapd-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd-V1.2-java_gen_java^

echo "building android.hardware.wifi.hostapd-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd-V1.1-java_gen_java^

echo "building android.hardware.wifi.hostapd-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi.hostapd-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi.hostapd-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd-V1.0-java_gen_java^

echo "building android.hardware.wifi-V1.5-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.5-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.5-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.5/android.hardware.wifi-V1.5-java_gen_java^

echo "building android.hardware.wifi-V1.4-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.4-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.4-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.4/android.hardware.wifi-V1.4-java_gen_java^

echo "building android.hardware.wifi-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.3/android.hardware.wifi-V1.3-java_gen_java^

echo "building android.hardware.wifi-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.2/android.hardware.wifi-V1.2-java_gen_java^

echo "building android.hardware.wifi-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.1/android.hardware.wifi-V1.1-java_gen_java^

echo "building android.hardware.wifi-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java_gen_java^

echo "building android.hardware.wifi-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.wifi-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.wifi-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/wifi/1.0/android.hardware.wifi-V1.0-java-constants_gen_java^

echo "building android.hardware.weaver@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver@1.0-inheritance-hierarchy^

echo "building android.hardware.weaver-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-api^

echo "building android.hardware.weaver-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/1.0/android.hardware.weaver-V1.0-java_gen_java^

echo "building android.hardware.weaver-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform-source^

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.vr@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vr@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vr@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0_genc++_headers^

echo "building android.hardware.vr@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vr@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vr@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0_genc++^

echo "building android.hardware.vr@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vr@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vr@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vr/1.0/android.hardware.vr@1.0-inheritance-hierarchy^

echo "building android.hardware.vibrator@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++_headers^

echo "building android.hardware.vibrator@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++^

echo "building android.hardware.vibrator@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3-inheritance-hierarchy^

echo "building android.hardware.vibrator@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++_headers^

echo "building android.hardware.vibrator@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++^

echo "building android.hardware.vibrator@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2-inheritance-hierarchy^

echo "building android.hardware.vibrator@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++_headers^

echo "building android.hardware.vibrator@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++^

echo "building android.hardware.vibrator@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1-inheritance-hierarchy^

echo "building android.hardware.vibrator@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++_headers^

echo "building android.hardware.vibrator@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++^

echo "building android.hardware.vibrator@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0-inheritance-hierarchy^

echo "building android.hardware.vibrator-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-api^

echo "building android.hardware.vibrator-V2-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^

echo "building android.hardware.vibrator-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.vibrator-V2-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-java-source^

echo "building android.hardware.vibrator-V2-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V2-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V2-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp-source^

echo "building android.hardware.vibrator-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.3/android.hardware.vibrator-V1.3-java_gen_java^

echo "building android.hardware.vibrator-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.2/android.hardware.vibrator-V1.2-java_gen_java^

echo "building android.hardware.vibrator-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.1/android.hardware.vibrator-V1.1-java_gen_java^

echo "building android.hardware.vibrator-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.vibrator-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.vibrator-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/1.0/android.hardware.vibrator-V1.0-java_gen_java^

echo "building android.hardware.usb@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb@1.3-inheritance-hierarchy^

echo "building android.hardware.usb@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb@1.2-inheritance-hierarchy^

echo "building android.hardware.usb@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb@1.1-inheritance-hierarchy^

echo "building android.hardware.usb@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++_headers^

echo "building android.hardware.usb@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++^

echo "building android.hardware.usb@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0-inheritance-hierarchy^

echo "building android.hardware.usb.gadget@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget@1.2-inheritance-hierarchy^

echo "building android.hardware.usb.gadget@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget@1.1-inheritance-hierarchy^

echo "building android.hardware.usb.gadget@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0_genc++_headers^

echo "building android.hardware.usb.gadget@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0_genc++^

echo "building android.hardware.usb.gadget@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0-inheritance-hierarchy^

echo "building android.hardware.usb.gadget-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget-V1.2-java_gen_java^

echo "building android.hardware.usb.gadget-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget-V1.1-java_gen_java^

echo "building android.hardware.usb.gadget-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb.gadget-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb.gadget-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget-V1.0-java_gen_java^

echo "building android.hardware.usb-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.3/android.hardware.usb-V1.3-java_gen_java^

echo "building android.hardware.usb-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java_gen_java^

echo "building android.hardware.usb-V1.2-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.2-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.2-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.2/android.hardware.usb-V1.2-java-constants_gen_java^

echo "building android.hardware.usb-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java_gen_java^

echo "building android.hardware.usb-V1.1-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.1-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.1-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.1/android.hardware.usb-V1.1-java-constants_gen_java^

echo "building android.hardware.usb-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java_gen_java^

echo "building android.hardware.usb-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.usb-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.usb-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb-V1.0-java-constants_gen_java^

echo "building android.hardware.tv.tuner@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.tuner@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.tuner@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner@1.1-inheritance-hierarchy^

echo "building android.hardware.tv.tuner@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.tuner@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.tuner@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner@1.0-inheritance-hierarchy^

echo "building android.hardware.tv.tuner-V1.1-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.tuner-V1.1-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.tuner-V1.1-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner-V1.1-java-constants_gen_java^

echo "building android.hardware.tv.tuner-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.tuner-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.tuner-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner-V1.0-java-constants_gen_java^

echo "building android.hardware.tv.input@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.input@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.input@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0_genc++_headers^

echo "building android.hardware.tv.input@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.input@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.input@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0_genc++^

echo "building android.hardware.tv.input@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.input@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.input@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0-inheritance-hierarchy^

echo "building android.hardware.tv.input-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.input-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.input-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/input/1.0/android.hardware.tv.input-V1.0-java-constants_gen_java^

echo "building android.hardware.tv.cec@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.cec@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.cec@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec@1.1-inheritance-hierarchy^

echo "building android.hardware.tv.cec@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.cec@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.cec@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec@1.0-inheritance-hierarchy^

echo "building android.hardware.tv.cec-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.cec-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.cec-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec-V1.1-java_gen_java^

echo "building android.hardware.tv.cec-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tv.cec-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tv.cec-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec-V1.0-java_gen_java^

echo "building android.hardware.thermal@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++_headers^

echo "building android.hardware.thermal@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++^

echo "building android.hardware.thermal@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0-inheritance-hierarchy^

echo "building android.hardware.thermal@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal@1.1-inheritance-hierarchy^

echo "building android.hardware.thermal@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++_headers^

echo "building android.hardware.thermal@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++^

echo "building android.hardware.thermal@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0-inheritance-hierarchy^

echo "building android.hardware.thermal-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal-V2.0-java_gen_java^

echo "building android.hardware.thermal-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.1/android.hardware.thermal-V1.1-java_gen_java^

echo "building android.hardware.thermal-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java_gen_java^

echo "building android.hardware.thermal-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.thermal-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.thermal-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal-V1.0-java-constants_gen_java^

echo "building android.hardware.tetheroffload.control@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.control@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.control@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control@1.1-inheritance-hierarchy^

echo "building android.hardware.tetheroffload.control@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.control@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.control@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control@1.0-inheritance-hierarchy^

echo "building android.hardware.tetheroffload.control-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.control-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.control-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control-V1.1-java_gen_java^

echo "building android.hardware.tetheroffload.control-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.control-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.control-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control-V1.0-java_gen_java^

echo "building android.hardware.tetheroffload.config@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.config@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.config@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config@1.0-inheritance-hierarchy^

echo "building android.hardware.tetheroffload.config-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tetheroffload.config-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tetheroffload.config-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config-V1.0-java_gen_java^

echo "building android.hardware.tests.trie@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.trie@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/trie/1.0/android.hardware.tests.trie@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.trie@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/trie/1.0/android.hardware.tests.trie@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.safeunion@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.safeunion@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/safeunion/1.0/android.hardware.tests.safeunion@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.safeunion@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/safeunion/1.0/android.hardware.tests.safeunion@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/safeunion/cpp/1.0/android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/safeunion/cpp/1.0/android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.multithread@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.multithread@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/multithread/1.0/android.hardware.tests.multithread@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.multithread@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/multithread/1.0/android.hardware.tests.multithread@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.msgq@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.msgq@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/msgq/1.0/android.hardware.tests.msgq@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.msgq@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/msgq/1.0/android.hardware.tests.msgq@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.memory@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.memory@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/memory/2.0/android.hardware.tests.memory@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.memory@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/memory/2.0/android.hardware.tests.memory@2.0-inheritance-hierarchy^

echo "building android.hardware.tests.memory@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.memory@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/memory/1.0/android.hardware.tests.memory@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.memory@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/memory/1.0/android.hardware.tests.memory@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/libhwbinder/1.0/android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/libhwbinder/1.0/android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.lazy@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1_genc++_headers^

echo "building android.hardware.tests.lazy@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1_genc++^

echo "building android.hardware.tests.lazy@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1-inheritance-hierarchy^

echo "building android.hardware.tests.lazy@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0_genc++_headers^

echo "building android.hardware.tests.lazy@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0_genc++^

echo "building android.hardware.tests.lazy@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.lazy@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.lazy@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.inheritance@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.inheritance@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/inheritance/1.0/android.hardware.tests.inheritance@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.inheritance@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/inheritance/1.0/android.hardware.tests.inheritance@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.hash@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.hash@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/hash/1.0/android.hardware.tests.hash@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.hash@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/hash/1.0/android.hardware.tests.hash@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.foo@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.foo@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/foo/1.0/android.hardware.tests.foo@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.foo@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/foo/1.0/android.hardware.tests.foo@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.extension.light@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.extension.light@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/extension/light/2.0/android.hardware.tests.extension.light@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.extension.light@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/extension/light/2.0/android.hardware.tests.extension.light@2.0-inheritance-hierarchy^

echo "building android.hardware.tests.expression@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.expression@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/expression/1.0/android.hardware.tests.expression@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.expression@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/expression/1.0/android.hardware.tests.expression@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.baz@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.baz@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/baz/1.0/android.hardware.tests.baz@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.baz@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/baz/1.0/android.hardware.tests.baz@1.0-inheritance-hierarchy^

echo "building android.hardware.tests.bar@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.tests.bar@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/bar/1.0/android.hardware.tests.bar@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.tests.bar@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/tests/bar/1.0/android.hardware.tests.bar@1.0-inheritance-hierarchy^

echo "building android.hardware.soundtrigger@2.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger@2.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger@2.3-inheritance-hierarchy^

echo "building android.hardware.soundtrigger@2.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger@2.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger@2.2-inheritance-hierarchy^

echo "building android.hardware.soundtrigger@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger@2.1-inheritance-hierarchy^

echo "building android.hardware.soundtrigger@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++_headers^

echo "building android.hardware.soundtrigger@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++^

echo "building android.hardware.soundtrigger@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0-inheritance-hierarchy^

echo "building android.hardware.soundtrigger-V2.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger-V2.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger-V2.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger-V2.3-java_gen_java^

echo "building android.hardware.soundtrigger-V2.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger-V2.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger-V2.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger-V2.2-java_gen_java^

echo "building android.hardware.soundtrigger-V2.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger-V2.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger-V2.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger-V2.1-java_gen_java^

echo "building android.hardware.soundtrigger-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.soundtrigger-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.soundtrigger-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger-V2.0-java_gen_java^

echo "building android.hardware.sensors@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++_headers^

echo "building android.hardware.sensors@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++^

echo "building android.hardware.sensors@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1-inheritance-hierarchy^

echo "building android.hardware.sensors@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++_headers^

echo "building android.hardware.sensors@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++^

echo "building android.hardware.sensors@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0-inheritance-hierarchy^

echo "building android.hardware.sensors@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^

echo "building android.hardware.sensors@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++^

echo "building android.hardware.sensors@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.sensors@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.sensors@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0-inheritance-hierarchy^

echo "building android.hardware.security.sharedsecret-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-api^

echo "building android.hardware.security.sharedsecret-V1-rust-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-rust-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust-source^

echo "building android.hardware.security.sharedsecret-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source

echo "building android.hardware.security.sharedsecret-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform-source^

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.secureclock-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-api^

echo "building android.hardware.security.secureclock-V1-rust-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-rust-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust-source^

echo "building android.hardware.security.secureclock-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_source

echo "building android.hardware.security.secureclock-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform-source^

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.secureclock-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-java-source^

echo "building android.hardware.security.secureclock-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.secureclock-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.secureclock-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp-source^

echo "building android.hardware.security.keymint-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-api^

echo "building android.hardware.security.keymint-V1-rust-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-rust-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust-source^

echo "building android.hardware.security.keymint-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_source

echo "building android.hardware.security.keymint-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform-source^

echo "building android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.keymint-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-java-source^

echo "building android.hardware.security.keymint-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.security.keymint-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.security.keymint-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp-source^

echo "building android.hardware.secure_element@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element@1.2-inheritance-hierarchy^

echo "building android.hardware.secure_element@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element@1.1-inheritance-hierarchy^

echo "building android.hardware.secure_element@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0_genc++_headers^

echo "building android.hardware.secure_element@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0_genc++^

echo "building android.hardware.secure_element@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0-inheritance-hierarchy^

echo "building android.hardware.secure_element-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.2/android.hardware.secure_element-V1.2-java_gen_java^

echo "building android.hardware.secure_element-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.1/android.hardware.secure_element-V1.1-java_gen_java^

echo "building android.hardware.secure_element-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.secure_element-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.secure_element-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/secure_element/1.0/android.hardware.secure_element-V1.0-java_gen_java^

echo "building android.hardware.renderscript@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.renderscript@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.renderscript@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++_headers^

echo "building android.hardware.renderscript@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.renderscript@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.renderscript@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++^

echo "building android.hardware.renderscript@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.renderscript@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.renderscript@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0-inheritance-hierarchy^

echo "building android.hardware.rebootescrow-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.rebootescrow-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.rebootescrow-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-api^

echo "building android.hardware.rebootescrow-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.rebootescrow-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform-source^

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.rebootescrow-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.rebootescrow-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.rebootescrow-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-java-source^

echo "building android.hardware.radio@1.6_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.6_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.6_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++_headers^

echo "building android.hardware.radio@1.6_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.6_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.6_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++^

echo "building android.hardware.radio@1.6-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.6-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.6-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6-inheritance-hierarchy^

echo "building android.hardware.radio@1.5_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.5_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.5_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++_headers^

echo "building android.hardware.radio@1.5_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.5_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.5_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++^

echo "building android.hardware.radio@1.5-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.5-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.5-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5-inheritance-hierarchy^

echo "building android.hardware.radio@1.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++_headers^

echo "building android.hardware.radio@1.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++^

echo "building android.hardware.radio@1.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4-inheritance-hierarchy^

echo "building android.hardware.radio@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++_headers^

echo "building android.hardware.radio@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++^

echo "building android.hardware.radio@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3-inheritance-hierarchy^

echo "building android.hardware.radio@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++_headers^

echo "building android.hardware.radio@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++^

echo "building android.hardware.radio@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2-inheritance-hierarchy^

echo "building android.hardware.radio@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++_headers^

echo "building android.hardware.radio@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++^

echo "building android.hardware.radio@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1-inheritance-hierarchy^

echo "building android.hardware.radio@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++_headers^

echo "building android.hardware.radio@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++^

echo "building android.hardware.radio@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0-inheritance-hierarchy^

echo "building android.hardware.radio.deprecated@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.deprecated@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.deprecated@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++_headers^

echo "building android.hardware.radio.deprecated@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.deprecated@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.deprecated@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++^

echo "building android.hardware.radio.deprecated@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.deprecated@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.deprecated@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0-inheritance-hierarchy^

echo "building android.hardware.radio.deprecated-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.deprecated-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.deprecated-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated-V1.0-java_gen_java^

echo "building android.hardware.radio.config@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++_headers^

echo "building android.hardware.radio.config@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++^

echo "building android.hardware.radio.config@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3-inheritance-hierarchy^

echo "building android.hardware.radio.config@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++_headers^

echo "building android.hardware.radio.config@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++^

echo "building android.hardware.radio.config@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2-inheritance-hierarchy^

echo "building android.hardware.radio.config@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++_headers^

echo "building android.hardware.radio.config@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++^

echo "building android.hardware.radio.config@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1-inheritance-hierarchy^

echo "building android.hardware.radio.config@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++_headers^

echo "building android.hardware.radio.config@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++^

echo "building android.hardware.radio.config@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0-inheritance-hierarchy^

echo "building android.hardware.radio.config-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config-V1.3-java_gen_java^

echo "building android.hardware.radio.config-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config-V1.2-java_gen_java^

echo "building android.hardware.radio.config-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config-V1.1-java_gen_java^

echo "building android.hardware.radio.config-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio.config-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio.config-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config-V1.0-java_gen_java^

echo "building android.hardware.radio-V1.6-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.6-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.6-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio-V1.6-java_gen_java^

echo "building android.hardware.radio-V1.5-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.5-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.5-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio-V1.5-java_gen_java^

echo "building android.hardware.radio-V1.4-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.4-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.4-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio-V1.4-java_gen_java^

echo "building android.hardware.radio-V1.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio-V1.3-java_gen_java^

echo "building android.hardware.radio-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio-V1.2-java_gen_java^

echo "building android.hardware.radio-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio-V1.1-java_gen_java^

echo "building android.hardware.radio-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.radio-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.radio-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio-V1.0-java_gen_java^

echo "building android.hardware.power@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3_genc++_headers^

echo "building android.hardware.power@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3_genc++^

echo "building android.hardware.power@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.3/android.hardware.power@1.3-inheritance-hierarchy^

echo "building android.hardware.power@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2_genc++_headers^

echo "building android.hardware.power@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2_genc++^

echo "building android.hardware.power@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.2/android.hardware.power@1.2-inheritance-hierarchy^

echo "building android.hardware.power@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++_headers^

echo "building android.hardware.power@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++^

echo "building android.hardware.power@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.1/android.hardware.power@1.1-inheritance-hierarchy^

echo "building android.hardware.power@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++_headers^

echo "building android.hardware.power@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++^

echo "building android.hardware.power@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power@1.0-inheritance-hierarchy^

echo "building android.hardware.power.stats@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0_genc++_headers^

echo "building android.hardware.power.stats@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0_genc++^

echo "building android.hardware.power.stats@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0-inheritance-hierarchy^

echo "building android.hardware.power.stats-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-api^

echo "building android.hardware.power.stats-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform-source^

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.power.stats-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-java-source^

echo "building android.hardware.power.stats-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power.stats-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power.stats-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp-source^

echo "building android.hardware.power-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-api^

echo "building android.hardware.power-V2-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V2-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V2-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform-source^

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.power-V2-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V2-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V2-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp-source^

echo "building android.hardware.power-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/1.0/android.hardware.power-V1.0-java_gen_java^

echo "building android.hardware.power-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-java-source^

echo "building android.hardware.power-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.power-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.power-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp-source^

echo "building android.hardware.oemlock@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock@1.0-inheritance-hierarchy^

echo "building android.hardware.oemlock-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-api^

echo "building android.hardware.oemlock-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/1.0/android.hardware.oemlock-V1.0-java_gen_java^

echo "building android.hardware.oemlock-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform-source^

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.nfc@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2_genc++_headers^

echo "building android.hardware.nfc@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2_genc++^

echo "building android.hardware.nfc@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2-inheritance-hierarchy^

echo "building android.hardware.nfc@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1_genc++_headers^

echo "building android.hardware.nfc@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1_genc++^

echo "building android.hardware.nfc@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1-inheritance-hierarchy^

echo "building android.hardware.nfc@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0_genc++_headers^

echo "building android.hardware.nfc@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0_genc++^

echo "building android.hardware.nfc@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.nfc@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.nfc@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0-inheritance-hierarchy^

echo "building android.hardware.neuralnetworks@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++_headers^

echo "building android.hardware.neuralnetworks@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++^

echo "building android.hardware.neuralnetworks@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3-inheritance-hierarchy^

echo "building android.hardware.neuralnetworks@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++_headers^

echo "building android.hardware.neuralnetworks@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++^

echo "building android.hardware.neuralnetworks@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2-inheritance-hierarchy^

echo "building android.hardware.neuralnetworks@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++_headers^

echo "building android.hardware.neuralnetworks@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++^

echo "building android.hardware.neuralnetworks@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1-inheritance-hierarchy^

echo "building android.hardware.neuralnetworks@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++_headers^

echo "building android.hardware.neuralnetworks@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++^

echo "building android.hardware.neuralnetworks@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0-inheritance-hierarchy^

echo "building android.hardware.neuralnetworks-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-api^

echo "building android.hardware.neuralnetworks-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform-source^

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.memtrack@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++_headers^

echo "building android.hardware.memtrack@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++^

echo "building android.hardware.memtrack@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0-inheritance-hierarchy^

echo "building android.hardware.memtrack-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-api^

echo "building android.hardware.memtrack-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.media@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^

echo "building android.hardware.media@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++^

echo "building android.hardware.media.omx@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.omx@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.omx@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^

echo "building android.hardware.media.omx@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.omx@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.omx@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++^

echo "building android.hardware.media.omx@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.omx@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.omx@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0-inheritance-hierarchy^

echo "building android.hardware.media.c2@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^

echo "building android.hardware.media.c2@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++^

echo "building android.hardware.media.c2@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2-inheritance-hierarchy^

echo "building android.hardware.media.c2@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^

echo "building android.hardware.media.c2@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++^

echo "building android.hardware.media.c2@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1-inheritance-hierarchy^

echo "building android.hardware.media.c2@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^

echo "building android.hardware.media.c2@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++^

echo "building android.hardware.media.c2@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.c2@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.c2@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0-inheritance-hierarchy^

echo "building android.hardware.media.bufferpool@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.bufferpool@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.bufferpool@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^

echo "building android.hardware.media.bufferpool@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.bufferpool@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.bufferpool@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++^

echo "building android.hardware.media.bufferpool@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.bufferpool@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.bufferpool@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0-inheritance-hierarchy^

echo "building android.hardware.media.bufferpool@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.media.bufferpool@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/1.0/android.hardware.media.bufferpool@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.media.bufferpool@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/1.0/android.hardware.media.bufferpool@1.0-inheritance-hierarchy^

echo "building android.hardware.light@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++_headers^

echo "building android.hardware.light@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0_genc++^

echo "building android.hardware.light@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light@2.0-inheritance-hierarchy^

echo "building android.hardware.light-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-api^

echo "building android.hardware.light-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/2.0/android.hardware.light-V2.0-java_gen_java^

echo "building android.hardware.light-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform-source^

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.light-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-java-source^

echo "building android.hardware.light-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.light-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.light-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp-source^

echo "building android.hardware.keymaster@4.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1_genc++_headers^

echo "building android.hardware.keymaster@4.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1_genc++^

echo "building android.hardware.keymaster@4.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1-inheritance-hierarchy^

echo "building android.hardware.keymaster@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0_genc++_headers^

echo "building android.hardware.keymaster@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0_genc++^

echo "building android.hardware.keymaster@4.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@4.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@4.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0-inheritance-hierarchy^

echo "building android.hardware.keymaster@3.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@3.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@3.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++_headers^

echo "building android.hardware.keymaster@3.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@3.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@3.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++^

echo "building android.hardware.keymaster@3.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster@3.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster@3.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0-inheritance-hierarchy^

echo "building android.hardware.keymaster-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-api^

echo "building android.hardware.keymaster-V3-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-V3-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform-source^

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.keymaster-V3-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-V3-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-V3-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-java-source^

echo "building android.hardware.keymaster-V3-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.keymaster-V3-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.keymaster-V3-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp-source^

echo "building android.hardware.ir@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.ir@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.ir@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0_genc++_headers^

echo "building android.hardware.ir@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.ir@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.ir@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0_genc++^

echo "building android.hardware.ir@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.ir@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.ir@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ir/1.0/android.hardware.ir@1.0-inheritance-hierarchy^

echo "building android.hardware.input.common@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.input.common@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.input.common@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^

echo "building android.hardware.input.common@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.input.common@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.input.common@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++^

echo "building android.hardware.input.classifier@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.input.classifier@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.input.classifier@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^

echo "building android.hardware.input.classifier@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.input.classifier@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.input.classifier@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++^

echo "building android.hardware.input.classifier@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.input.classifier@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.input.classifier@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0-inheritance-hierarchy^

echo "building android.hardware.identity-libeic-library^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-libeic-library,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static

echo "building android.hardware.identity-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-api^

echo "building android.hardware.identity-V3-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-V3-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-V3-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform-source^

echo "building android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-libeic-hal-common,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static

echo "building android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-V3-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-V3-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.identity-V3-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.identity-V3-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.identity-V3-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp-source^

echo "building android.hardware.health@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^

echo "building android.hardware.health@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++^

echo "building android.hardware.health@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1-inheritance-hierarchy^

echo "building android.hardware.health@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^

echo "building android.hardware.health@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++^

echo "building android.hardware.health@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0-inheritance-hierarchy^

echo "building android.hardware.health@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^

echo "building android.hardware.health@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++^

echo "building android.hardware.health.storage@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0_genc++_headers^

echo "building android.hardware.health.storage@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0_genc++^

echo "building android.hardware.health.storage@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0-inheritance-hierarchy^

echo "building android.hardware.health.storage-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-api^

echo "building android.hardware.health.storage-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform-source^

echo "building android.hardware.health.storage-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.health-V2.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health-V2.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health-V2.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health-V2.1-java_gen_java^

echo "building android.hardware.health-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health-V2.0-java_gen_java^

echo "building android.hardware.health-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java_gen_java^

echo "building android.hardware.health-V1.0-java-constants_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.health-V1.0-java-constants_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.health-V1.0-java-constants_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health-V1.0-java-constants_gen_java^

echo "building android.hardware.graphics.mapper@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^

echo "building android.hardware.graphics.mapper@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++^

echo "building android.hardware.graphics.mapper@4.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@4.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@4.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0-inheritance-hierarchy^

echo "building android.hardware.graphics.mapper@3.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@3.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@3.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^

echo "building android.hardware.graphics.mapper@3.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@3.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@3.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++^

echo "building android.hardware.graphics.mapper@3.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@3.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@3.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0-inheritance-hierarchy^

echo "building android.hardware.graphics.mapper@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++_headers^

echo "building android.hardware.graphics.mapper@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++^

echo "building android.hardware.graphics.mapper@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1-inheritance-hierarchy^

echo "building android.hardware.graphics.mapper@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^

echo "building android.hardware.graphics.mapper@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++^

echo "building android.hardware.graphics.mapper@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.mapper@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.mapper@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0-inheritance-hierarchy^

echo "building android.hardware.graphics.composer@2.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^

echo "building android.hardware.graphics.composer@2.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++^

echo "building android.hardware.graphics.composer@2.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4-inheritance-hierarchy^

echo "building android.hardware.graphics.composer@2.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^

echo "building android.hardware.graphics.composer@2.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++^

echo "building android.hardware.graphics.composer@2.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3-inheritance-hierarchy^

echo "building android.hardware.graphics.composer@2.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^

echo "building android.hardware.graphics.composer@2.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++^

echo "building android.hardware.graphics.composer@2.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2-inheritance-hierarchy^

echo "building android.hardware.graphics.composer@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^

echo "building android.hardware.graphics.composer@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++^

echo "building android.hardware.graphics.composer@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.composer@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.composer@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1-inheritance-hierarchy^

echo "building android.hardware.graphics.common@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^

echo "building android.hardware.graphics.common@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++^

echo "building android.hardware.graphics.common@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^

echo "building android.hardware.graphics.common@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++^

echo "building android.hardware.graphics.common@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^

echo "building android.hardware.graphics.common@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++^

echo "building android.hardware.graphics.common-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-api^

echo "building android.hardware.graphics.common-V2-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.common-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.bufferqueue@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^

echo "building android.hardware.graphics.bufferqueue@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++^

echo "building android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy^

echo "building android.hardware.graphics.bufferqueue@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^

echo "building android.hardware.graphics.bufferqueue@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++^

echo "building android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy^

echo "building android.hardware.graphics.allocator@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++_headers^

echo "building android.hardware.graphics.allocator@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++^

echo "building android.hardware.graphics.allocator@4.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@4.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@4.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0-inheritance-hierarchy^

echo "building android.hardware.graphics.allocator@3.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@3.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@3.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++_headers^

echo "building android.hardware.graphics.allocator@3.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@3.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@3.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++^

echo "building android.hardware.graphics.allocator@3.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@3.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@3.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0-inheritance-hierarchy^

echo "building android.hardware.graphics.allocator@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^

echo "building android.hardware.graphics.allocator@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++^

echo "building android.hardware.graphics.allocator@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.graphics.allocator@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.graphics.allocator@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0-inheritance-hierarchy^

echo "building android.hardware.gnss@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++_headers^

echo "building android.hardware.gnss@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++^

echo "building android.hardware.gnss@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1-inheritance-hierarchy^

echo "building android.hardware.gnss@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++_headers^

echo "building android.hardware.gnss@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++^

echo "building android.hardware.gnss@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0-inheritance-hierarchy^

echo "building android.hardware.gnss@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++_headers^

echo "building android.hardware.gnss@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++^

echo "building android.hardware.gnss@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1-inheritance-hierarchy^

echo "building android.hardware.gnss@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++_headers^

echo "building android.hardware.gnss@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++^

echo "building android.hardware.gnss@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0-inheritance-hierarchy^

echo "building android.hardware.gnss.visibility_control@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.visibility_control@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.visibility_control@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++_headers^

echo "building android.hardware.gnss.visibility_control@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.visibility_control@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.visibility_control@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++^

echo "building android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy^

echo "building android.hardware.gnss.visibility_control-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.visibility_control-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.visibility_control-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control-V1.0-java_gen_java^

echo "building android.hardware.gnss.measurement_corrections@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^

echo "building android.hardware.gnss.measurement_corrections@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++^

echo "building android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy^

echo "building android.hardware.gnss.measurement_corrections@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^

echo "building android.hardware.gnss.measurement_corrections@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++^

echo "building android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy^

echo "building android.hardware.gnss.measurement_corrections-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections-V1.1-java_gen_java^

echo "building android.hardware.gnss.measurement_corrections-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss.measurement_corrections-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss.measurement_corrections-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections-V1.0-java_gen_java^

echo "building android.hardware.gnss-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-api^

echo "building android.hardware.gnss-V2.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V2.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V2.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss-V2.1-java_gen_java^

echo "building android.hardware.gnss-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss-V2.0-java_gen_java^

echo "building android.hardware.gnss-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss-V1.1-java_gen_java^

echo "building android.hardware.gnss-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss-V1.0-java_gen_java^

echo "building android.hardware.gnss-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform-source^

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.gnss-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-java-source^

echo "building android.hardware.gnss-V1-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gnss-V1-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gnss-V1-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp-source^

echo "building android.hardware.gatekeeper@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gatekeeper@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gatekeeper@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++_headers^

echo "building android.hardware.gatekeeper@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gatekeeper@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gatekeeper@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++^

echo "building android.hardware.gatekeeper@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.gatekeeper@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.gatekeeper@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0-inheritance-hierarchy^

echo "building android.hardware.fastboot@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1_genc++_headers^

echo "building android.hardware.fastboot@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1_genc++^

echo "building android.hardware.fastboot@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1-inheritance-hierarchy^

echo "building android.hardware.fastboot@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0_genc++_headers^

echo "building android.hardware.fastboot@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0_genc++^

echo "building android.hardware.fastboot@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.fastboot@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.fastboot@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0-inheritance-hierarchy^

echo "building android.hardware.dumpstate@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++_headers^

echo "building android.hardware.dumpstate@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++^

echo "building android.hardware.dumpstate@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1-inheritance-hierarchy^

echo "building android.hardware.dumpstate@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++_headers^

echo "building android.hardware.dumpstate@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++^

echo "building android.hardware.dumpstate@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0-inheritance-hierarchy^

echo "building android.hardware.dumpstate-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate-V1.1-java_gen_java^

echo "building android.hardware.dumpstate-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.dumpstate-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.dumpstate-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate-V1.0-java_gen_java^

echo "building android.hardware.drm@1.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++_headers^

echo "building android.hardware.drm@1.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++^

echo "building android.hardware.drm@1.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4-inheritance-hierarchy^

echo "building android.hardware.drm@1.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++_headers^

echo "building android.hardware.drm@1.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++^

echo "building android.hardware.drm@1.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3-inheritance-hierarchy^

echo "building android.hardware.drm@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++_headers^

echo "building android.hardware.drm@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++^

echo "building android.hardware.drm@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2-inheritance-hierarchy^

echo "building android.hardware.drm@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++_headers^

echo "building android.hardware.drm@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++^

echo "building android.hardware.drm@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1-inheritance-hierarchy^

echo "building android.hardware.drm@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers^

echo "building android.hardware.drm@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++^

echo "building android.hardware.drm@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.drm@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.drm@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0-inheritance-hierarchy^

echo "building android.hardware.contexthub@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++_headers^

echo "building android.hardware.contexthub@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++^

echo "building android.hardware.contexthub@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2-inheritance-hierarchy^

echo "building android.hardware.contexthub@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++_headers^

echo "building android.hardware.contexthub@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++^

echo "building android.hardware.contexthub@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1-inheritance-hierarchy^

echo "building android.hardware.contexthub@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++_headers^

echo "building android.hardware.contexthub@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++^

echo "building android.hardware.contexthub@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0-inheritance-hierarchy^

echo "building android.hardware.contexthub-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub-V1.2-java_gen_java^

echo "building android.hardware.contexthub-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub-V1.1-java_gen_java^

echo "building android.hardware.contexthub-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.contexthub-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.contexthub-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub-V1.0-java_gen_java^

echo "building android.hardware.confirmationui@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.confirmationui@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.confirmationui@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0_genc++_headers^

echo "building android.hardware.confirmationui@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.confirmationui@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.confirmationui@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0_genc++^

echo "building android.hardware.confirmationui@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.confirmationui@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.confirmationui@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0-inheritance-hierarchy^

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static

echo "building android.hardware.configstore@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^

echo "building android.hardware.configstore@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++^

echo "building android.hardware.configstore@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1-inheritance-hierarchy^

echo "building android.hardware.configstore@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^

echo "building android.hardware.configstore@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++^

echo "building android.hardware.configstore@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0-inheritance-hierarchy^

echo "building android.hardware.configstore-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore-V1.1-java_gen_java^

echo "building android.hardware.configstore-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.configstore-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.configstore-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore-V1.0-java_gen_java^

echo "building android.hardware.common.fmq-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common.fmq-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common.fmq-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-api^

echo "building android.hardware.common.fmq-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common.fmq-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common.fmq-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform-source^

echo "building android.hardware.common-V2-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^

echo "building android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common.fmq-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common.fmq-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.common-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-api^

echo "building android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.common-V2-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.common-V2-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.common-V2-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.common-V2-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-java-source^

echo "building android.hardware.cas@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++_headers^

echo "building android.hardware.cas@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++^

echo "building android.hardware.cas@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2-inheritance-hierarchy^

echo "building android.hardware.cas@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++_headers^

echo "building android.hardware.cas@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++^

echo "building android.hardware.cas@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1-inheritance-hierarchy^

echo "building android.hardware.cas@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^

echo "building android.hardware.cas@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++^

echo "building android.hardware.cas@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0-inheritance-hierarchy^

echo "building android.hardware.cas.native@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas.native@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas.native@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^

echo "building android.hardware.cas.native@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas.native@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas.native@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++^

echo "building android.hardware.cas.native@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas.native@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas.native@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0-inheritance-hierarchy^

echo "building android.hardware.cas-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas-V1.2-java_gen_java^

echo "building android.hardware.cas-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas-V1.1-java_gen_java^

echo "building android.hardware.cas-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.cas-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.cas-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas-V1.0-java_gen_java^

echo "building android.hardware.camera.provider@2.7_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.7_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.7_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++_headers^

echo "building android.hardware.camera.provider@2.7_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.7_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.7_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++^

echo "building android.hardware.camera.provider@2.7-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.7-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.7-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7-inheritance-hierarchy^

echo "building android.hardware.camera.provider@2.6_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.6_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.6_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++_headers^

echo "building android.hardware.camera.provider@2.6_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.6_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.6_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++^

echo "building android.hardware.camera.provider@2.6-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.6-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.6-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6-inheritance-hierarchy^

echo "building android.hardware.camera.provider@2.5_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.5_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.5_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++_headers^

echo "building android.hardware.camera.provider@2.5_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.5_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.5_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++^

echo "building android.hardware.camera.provider@2.5-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.5-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.5-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5-inheritance-hierarchy^

echo "building android.hardware.camera.provider@2.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++_headers^

echo "building android.hardware.camera.provider@2.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++^

echo "building android.hardware.camera.provider@2.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.provider@2.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.provider@2.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4-inheritance-hierarchy^

echo "building android.hardware.camera.metadata@3.6_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.6_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.6_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++_headers^

echo "building android.hardware.camera.metadata@3.6_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.6_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.6_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++^

echo "building android.hardware.camera.metadata@3.5_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.5_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.5_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++_headers^

echo "building android.hardware.camera.metadata@3.5_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.5_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.5_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++^

echo "building android.hardware.camera.metadata@3.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++_headers^

echo "building android.hardware.camera.metadata@3.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++^

echo "building android.hardware.camera.metadata@3.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++_headers^

echo "building android.hardware.camera.metadata@3.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++^

echo "building android.hardware.camera.metadata@3.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++_headers^

echo "building android.hardware.camera.metadata@3.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.metadata@3.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.metadata@3.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++^

echo "building android.hardware.camera.device@3.7_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.7_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.7_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++_headers^

echo "building android.hardware.camera.device@3.7_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.7_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.7_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++^

echo "building android.hardware.camera.device@3.7-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.7-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.7-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7-inheritance-hierarchy^

echo "building android.hardware.camera.device@3.6_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.6_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.6_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++_headers^

echo "building android.hardware.camera.device@3.6_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.6_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.6_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++^

echo "building android.hardware.camera.device@3.6-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.6-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.6-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6-inheritance-hierarchy^

echo "building android.hardware.camera.device@3.5_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.5_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.5_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++_headers^

echo "building android.hardware.camera.device@3.5_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.5_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.5_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++^

echo "building android.hardware.camera.device@3.5-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.5-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.5-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5-inheritance-hierarchy^

echo "building android.hardware.camera.device@3.4_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.4_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.4_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++_headers^

echo "building android.hardware.camera.device@3.4_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.4_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.4_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++^

echo "building android.hardware.camera.device@3.4-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.4-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.4-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4-inheritance-hierarchy^

echo "building android.hardware.camera.device@3.3_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.3_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.3_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++_headers^

echo "building android.hardware.camera.device@3.3_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.3_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.3_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++^

echo "building android.hardware.camera.device@3.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3-inheritance-hierarchy^

echo "building android.hardware.camera.device@3.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++_headers^

echo "building android.hardware.camera.device@3.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++^

echo "building android.hardware.camera.device@3.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@3.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@3.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2-inheritance-hierarchy^

echo "building android.hardware.camera.device@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++_headers^

echo "building android.hardware.camera.device@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++^

echo "building android.hardware.camera.device@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.device@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.device@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0-inheritance-hierarchy^

echo "building android.hardware.camera.common@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.common@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.common@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++_headers^

echo "building android.hardware.camera.common@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.camera.common@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.camera.common@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++^

echo "building android.hardware.broadcastradio@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio@2.0-inheritance-hierarchy^

echo "building android.hardware.broadcastradio@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1_genc++_headers^

echo "building android.hardware.broadcastradio@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1_genc++^

echo "building android.hardware.broadcastradio@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1-inheritance-hierarchy^

echo "building android.hardware.broadcastradio@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0_genc++_headers^

echo "building android.hardware.broadcastradio@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0_genc++^

echo "building android.hardware.broadcastradio@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0-inheritance-hierarchy^

echo "building android.hardware.broadcastradio-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.broadcastradio-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.broadcastradio-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio-V2.0-java_gen_java^

echo "building android.hardware.boot@1.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++_headers^

echo "building android.hardware.boot@1.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++^

echo "building android.hardware.boot@1.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2-inheritance-hierarchy^

echo "building android.hardware.boot@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^

echo "building android.hardware.boot@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++^

echo "building android.hardware.boot@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1-inheritance-hierarchy^

echo "building android.hardware.boot@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^

echo "building android.hardware.boot@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++^

echo "building android.hardware.boot@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0-inheritance-hierarchy^

echo "building android.hardware.boot-V1.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot-V1.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot-V1.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot-V1.2-java_gen_java^

echo "building android.hardware.boot-V1.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot-V1.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot-V1.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot-V1.1-java_gen_java^

echo "building android.hardware.boot-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.boot-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.boot-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot-V1.0-java_gen_java^

echo "building android.hardware.bluetooth@1.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++_headers^

echo "building android.hardware.bluetooth@1.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++^

echo "building android.hardware.bluetooth@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1-inheritance-hierarchy^

echo "building android.hardware.bluetooth@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++_headers^

echo "building android.hardware.bluetooth@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++^

echo "building android.hardware.bluetooth@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0-inheritance-hierarchy^

echo "building android.hardware.bluetooth.audio@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++_headers^

echo "building android.hardware.bluetooth.audio@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++^

echo "building android.hardware.bluetooth.audio@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1-inheritance-hierarchy^

echo "building android.hardware.bluetooth.audio@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++_headers^

echo "building android.hardware.bluetooth.audio@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++^

echo "building android.hardware.bluetooth.audio@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.audio@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.audio@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0-inheritance-hierarchy^

echo "building android.hardware.bluetooth.a2dp@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.a2dp@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.a2dp@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0_genc++_headers^

echo "building android.hardware.bluetooth.a2dp@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.a2dp@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.a2dp@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0_genc++^

echo "building android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy^

echo "building android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy^

echo "building android.hardware.biometrics.fingerprint@2.2_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.2_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++_headers^

echo "building android.hardware.biometrics.fingerprint@2.2_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.2_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++^

echo "building android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy^

echo "building android.hardware.biometrics.fingerprint@2.1_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.1_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++_headers^

echo "building android.hardware.biometrics.fingerprint@2.1_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.1_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++^

echo "building android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy^

echo "building android.hardware.biometrics.fingerprint-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-api^

echo "building android.hardware.biometrics.fingerprint-V2.3-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V2.3-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.3-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint-V2.3-java_gen_java^

echo "building android.hardware.biometrics.fingerprint-V2.2-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V2.2-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.2-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint-V2.2-java_gen_java^

echo "building android.hardware.biometrics.fingerprint-V2.1-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V2.1-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V2.1-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint-V2.1-java_gen_java^

echo "building android.hardware.biometrics.fingerprint-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform-source^

echo "building android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.fingerprint-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.fingerprint-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-java-source^

echo "building android.hardware.biometrics.face@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++_headers^

echo "building android.hardware.biometrics.face@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++^

echo "building android.hardware.biometrics.face@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0-inheritance-hierarchy^

echo "building android.hardware.biometrics.face-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-api^

echo "building android.hardware.biometrics.face-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face-V1.0-java_gen_java^

echo "building android.hardware.biometrics.face-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform-source^

echo "building android.hardware.biometrics.face-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-java-source^

echo "building android.hardware.biometrics.common-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.common-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.common-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-api^

echo "building android.hardware.biometrics.common-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.common-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.common-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform-source^

echo "building android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.face-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.common-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.common-V1-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.biometrics.common-V1-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.biometrics.common-V1-java-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-java-source^

echo "building android.hardware.automotive.vehicle@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.vehicle@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/vehicle/2.0/android.hardware.automotive.vehicle@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.vehicle@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/vehicle/2.0/android.hardware.automotive.vehicle@2.0-inheritance-hierarchy^

echo "building android.hardware.automotive.sv@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.sv@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/sv/1.0/android.hardware.automotive.sv@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.sv@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/sv/1.0/android.hardware.automotive.sv@1.0-inheritance-hierarchy^

echo "building android.hardware.automotive.occupant_awareness-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.occupant_awareness-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.occupant_awareness-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-api^

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform-source^

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.automotive.evs@1.1-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.evs@1.1-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/evs/1.1/android.hardware.automotive.evs@1.1-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.evs@1.1-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/evs/1.1/android.hardware.automotive.evs@1.1-inheritance-hierarchy^

echo "building android.hardware.automotive.evs@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.evs@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/evs/1.0/android.hardware.automotive.evs@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.evs@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/evs/1.0/android.hardware.automotive.evs@1.0-inheritance-hierarchy^

echo "building android.hardware.automotive.can@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.can@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/can/1.0/android.hardware.automotive.can@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.can@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/can/1.0/android.hardware.automotive.can@1.0-inheritance-hierarchy^

echo "building android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/audiocontrol/2.0/android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/audiocontrol/2.0/android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy^

echo "building android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/audiocontrol/1.0/android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/audiocontrol/1.0/android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy^

echo "building android.hardware.authsecret@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++_headers^

echo "building android.hardware.authsecret@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++^

echo "building android.hardware.authsecret@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0-inheritance-hierarchy^

echo "building android.hardware.authsecret-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret-api^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-api^

echo "building android.hardware.authsecret-V1.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret-V1.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret-V1.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret-V1.0-java_gen_java^

echo "building android.hardware.authsecret-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform-source^

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.audio@7.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@7.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@7.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++_headers^

echo "building android.hardware.audio@7.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@7.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@7.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++^

echo "building android.hardware.audio@7.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@7.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@7.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/7.0/android.hardware.audio@7.0-inheritance-hierarchy^

echo "building android.hardware.audio@6.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@6.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@6.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++_headers^

echo "building android.hardware.audio@6.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@6.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@6.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++^

echo "building android.hardware.audio@6.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@6.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@6.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0-inheritance-hierarchy^

echo "building android.hardware.audio@5.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@5.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@5.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++_headers^

echo "building android.hardware.audio@5.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@5.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@5.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0_genc++^

echo "building android.hardware.audio@5.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@5.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@5.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/5.0/android.hardware.audio@5.0-inheritance-hierarchy^

echo "building android.hardware.audio@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++_headers^

echo "building android.hardware.audio@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0_genc++^

echo "building android.hardware.audio@4.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@4.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@4.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/4.0/android.hardware.audio@4.0-inheritance-hierarchy^

echo "building android.hardware.audio@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/2.0/android.hardware.audio@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/2.0/android.hardware.audio@2.0-inheritance-hierarchy^

echo "building android.hardware.audio.effect@7.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@7.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@7.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++_headers^

echo "building android.hardware.audio.effect@7.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@7.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@7.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++^

echo "building android.hardware.audio.effect@7.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@7.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@7.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0-inheritance-hierarchy^

echo "building android.hardware.audio.effect@6.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@6.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@6.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++_headers^

echo "building android.hardware.audio.effect@6.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@6.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@6.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++^

echo "building android.hardware.audio.effect@6.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@6.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@6.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0-inheritance-hierarchy^

echo "building android.hardware.audio.effect@5.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@5.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@5.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++_headers^

echo "building android.hardware.audio.effect@5.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@5.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@5.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0_genc++^

echo "building android.hardware.audio.effect@5.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@5.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@5.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0-inheritance-hierarchy^

echo "building android.hardware.audio.effect@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++_headers^

echo "building android.hardware.audio.effect@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0_genc++^

echo "building android.hardware.audio.effect@4.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@4.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@4.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0-inheritance-hierarchy^

echo "building android.hardware.audio.effect@2.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.effect@2.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.effect@2.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0-inheritance-hierarchy^

echo "building android.hardware.audio.common@7.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@7.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@7.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++_headers^

echo "building android.hardware.audio.common@7.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@7.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@7.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++^

echo "building android.hardware.audio.common@6.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@6.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@6.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++_headers^

echo "building android.hardware.audio.common@6.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@6.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@6.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++^

echo "building android.hardware.audio.common@5.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@5.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@5.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^

echo "building android.hardware.audio.common@5.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@5.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@5.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++^

echo "building android.hardware.audio.common@4.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@4.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@4.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++_headers^

echo "building android.hardware.audio.common@4.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@4.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@4.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0_genc++^

echo "building android.hardware.audio.common@2.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@2.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@2.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers^

echo "building android.hardware.audio.common@2.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common@2.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common@2.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++^

echo "building android.hardware.audio.common-V2.0-java_gen_java^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.audio.common-V2.0-java_gen_java,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java_gen_java^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.audio.common-V2.0-java_gen_java^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common-V2.0-java_gen_java^

echo "building android.hardware.atrace@1.0_genc++_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.atrace@1.0_genc++_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.atrace@1.0_genc++_headers^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++_headers^

echo "building android.hardware.atrace@1.0_genc++^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.atrace@1.0_genc++,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.atrace@1.0_genc++^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++^

echo "building android.hardware.atrace@1.0-inheritance-hierarchy^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.hardware.atrace@1.0-inheritance-hierarchy,
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0-inheritance-hierarchy^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/hardware/interfaces/android.hardware.atrace@1.0-inheritance-hierarchy^.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0-inheritance-hierarchy^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 hardware_interfaces.tar.zst --clobber

du -ah -d1 hardware_interfaces*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
