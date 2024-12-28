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
clone_depth_platform bootable/recovery
clone_sparse cts libs/json
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcppbor
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libexif
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/NeuralNetworks
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/keymaster
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/tools/xsdc
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio@1.5_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio@1.6_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/config/audio_policy_configuration_V7_0_enums^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .

echo "building android.hardware.atrace@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.atrace@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.atrace@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio.common@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio.common@5.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@5.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@5.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@5.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@6.0-util,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_64_static

echo "building android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@6.0-util,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio.common@6.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@6.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@6.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@6.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio.common@7.0-enums^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@7.0-enums,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_64_static

echo "building android.hardware.audio.common@7.0-enums^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@7.0-enums,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@7.0-enums^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums^android_x86_x86_64_static

echo "building android.hardware.audio.common@7.0-util^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@7.0-util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@7.0-util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_64_static

echo "building android.hardware.audio.common@7.0-util^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.common@7.0-util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.common@7.0-util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util^android_x86_x86_64_static

echo "building android.hardware.audio.effect@6.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.effect@6.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio.effect@6.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio@6.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio@6.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio@6.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_64_static

echo "building android.hardware.audio@6.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio@6.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/6.0/android.hardware.audio@6.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.audio@7.0-util^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio@7.0-util,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio@7.0-util^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_64_static

echo "building android.hardware.audio@7.0-util^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.audio@7.0-util,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.audio@7.0-util^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util^android_x86_x86_64_static

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.authsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.authsecret@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.authsecret@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.authsecret@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.automotive.occupant_awareness-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.common-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.face-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.face@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.fingerprint-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.fingerprint@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.biometrics.fingerprint@2.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2^android_vendor.31_x86_64_static

echo "building android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth.audio@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth.audio@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth.audio@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth.audio@2.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.bluetooth@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.bluetooth@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.bluetooth@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.boot@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.boot@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.0/android.hardware.boot@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.boot@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.boot@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/android.hardware.boot@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.boot@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.boot@1.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.boot@1.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.2/android.hardware.boot@1.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.common@1.0-helper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.common@1.0-helper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_64_static

echo "building android.hardware.camera.common@1.0-helper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.common@1.0-helper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.common@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.common@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.common@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.common@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.3,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.4,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.5^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.5,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.5^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.5,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.6^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.6,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.6^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.6,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.device@3.7^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.7,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.7^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_64_static

echo "building android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.device@3.7,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_64_static

echo "building android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_64_static

echo "building android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.3,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_64_static

echo "building android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.4,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.5,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_64_static

echo "building android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.5,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.6,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_64_static

echo "building android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.metadata@3.6,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.provider@2.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_64_static

echo "building android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.4,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.provider@2.5^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.5,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_64_static

echo "building android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.5,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.provider@2.6^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.6,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_64_static

echo "building android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.6,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6^android_vendor.31_x86_x86_64_static

echo "building android.hardware.camera.provider@2.7^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.7,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_64_static

echo "building android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.camera.provider@2.7,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7^android_vendor.31_x86_x86_64_static

echo "building android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.cas.native@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.cas@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.cas@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.cas@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.cas@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.1/android.hardware.cas@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.cas@1.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.cas@1.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/cas/1.2/android.hardware.cas@1.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec

echo "building android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.common-V2-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common-V2-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common.fmq-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.common.fmq-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.configstore@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.configstore@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.configstore@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.configstore@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.configstore@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.configstore@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.configstore@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.configstore@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_64_static

echo "building android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.confirmationui-support-lib,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib^android_vendor.31_x86_x86_64_static

echo "building android.hardware.contexthub@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.contexthub@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.contexthub@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.contexthub@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.contexthub@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.contexthub@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.contexthub@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.contexthub@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.contexthub@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.drm@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.drm@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.drm@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.drm@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.drm@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.drm@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.drm@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.drm@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.drm@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.drm@1.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.drm@1.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.drm@1.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_vendor.31_x86_64_static

echo "building android.hardware.drm@1.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.drm@1.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.drm@1.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_vendor.31_x86_64_static

echo "building android.hardware.dumpstate@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.dumpstate@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.dumpstate@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.dumpstate@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gatekeeper@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss.measurement_corrections@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss.measurement_corrections@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss.visibility_control@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.gnss@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.gnss@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.gnss@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.gnss@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.gnss@common-default-lib^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.gnss@common-default-lib,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.gnss@common-default-lib^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@3.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@3.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@4.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.allocator@4.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.bufferqueue@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.media.swcodec

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common-V2-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.graphics.common@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.common@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.common@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.common@1.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.composer@2.1-resources,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.composer@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.composer@2.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.composer@2.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.composer@2.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@2.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@3.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@3.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@4.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_static

echo "building android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.graphics.mapper@4.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health.storage-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health.storage-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health.storage-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.health@1.0-convert^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@1.0-convert,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@1.0-convert^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_vendor.31_x86_64_static

echo "building android.hardware.health@1.0-convert^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@1.0-convert,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@1.0-convert^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.health@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.health@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.health@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.health@2.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.health@2.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.health@2.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.identity-V3-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.identity-V3-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.identity-libeic-hal-common,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common^android_vendor.31_x86_64_static

echo "building android.hardware.identity-libeic-library^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.identity-libeic-library,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library^android_vendor.31_x86_64_static

echo "building android.hardware.identity-support-lib^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.identity-support-lib,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.identity-support-lib^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/identity/support/android.hardware.identity-support-lib^android_vendor.31_x86_64_static

echo "building android.hardware.input.classifier@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.input.classifier@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.input.common@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.input.common@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.input.common@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.keymaster-V3-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.light-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.bufferpool@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.bufferpool@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.media.omx@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.omx@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.omx@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media.omx@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.media@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.media@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.media@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.media@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/media/1.0/android.hardware.media@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.memtrack@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.memtrack@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks-V1-ndk_platform,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform^android_x86_x86_64_static_com.android.neuralnetworks

echo "building android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.neuralnetworks@1.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3^android_vendor.31_x86_64_static

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.oemlock-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power.stats-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.power.stats-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform^android_x86_x86_64_static

echo "building android.hardware.radio.config@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio.config@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio.config@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio.config@1.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_64_static

echo "building android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.config@1.3,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.deprecated@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio.deprecated@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.0/android.hardware.radio@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.1^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.1,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.1/android.hardware.radio@1.1^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.2/android.hardware.radio@1.2^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.3^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.3,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.3/android.hardware.radio@1.3^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.4^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.4,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.4^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.4^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.4,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.4/android.hardware.radio@1.4^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.5^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.5,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.5^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.5^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.5,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.5/android.hardware.radio@1.5^android_vendor.31_x86_x86_64_static

echo "building android.hardware.radio@1.6^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.6,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.6^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_64_static

echo "building android.hardware.radio@1.6^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.radio@1.6,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/radio/1.6/android.hardware.radio@1.6^android_vendor.31_x86_x86_64_static

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.rebootescrow-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.renderscript@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.renderscript@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.renderscript@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.renderscript@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.keymint-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.keymint-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.keymint-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.keymint-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.keymint-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.keymint-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust^android_x86_64_source

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.secureclock-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.secureclock-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.secureclock-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.secureclock-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.secureclock-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust^android_x86_64_source

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.sharedsecret-V1-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform^android_x86_64_static

echo "building android.hardware.security.sharedsecret-V1-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.security.sharedsecret-V1-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust^android_x86_64_source

echo "building android.hardware.sensors@1.0-convert^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@1.0-convert,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@1.0-convert^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert^android_vendor.31_x86_64_static

echo "building android.hardware.sensors@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@1.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.sensors@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.sensors@2.1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@2.1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@2.1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_vendor.31_x86_64_static

echo "building android.hardware.sensors@2.X-shared-impl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.sensors@2.X-shared-impl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.sensors@2.X-shared-impl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl^android_vendor.31_x86_64_static

echo "building android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.soundtrigger@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.soundtrigger@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0^android_vendor.31_x86_x86_64_static

echo "building android.hardware.thermal@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.thermal@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.thermal@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.thermal@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.thermal@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.thermal@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0^android_vendor.31_x86_64_static

echo "building android.hardware.usb@1.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.usb@1.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.usb@1.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/usb/1.0/android.hardware.usb@1.0^android_vendor.31_x86_64_static

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.vibrator-V2-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building android.hardware.vibrator-V2-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.vibrator-V2-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_static

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_64_static

echo "building android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja android.hardware.weaver-V1-ndk_platform,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform^android_vendor.31_x86_x86_64_static

echo "building libaidlcommonsupport^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaidlcommonsupport,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libaidlcommonsupport^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_vendor.31_x86_64_static

echo "building libaidlcommonsupport^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaidlcommonsupport,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libaidlcommonsupport^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_64_static_apex30

echo "building libaidlcommonsupport^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaidlcommonsupport,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libaidlcommonsupport^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/common/support/libaidlcommonsupport^android_x86_x86_64_static_apex30

echo "building libboot_control^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libboot_control,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libboot_control^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_64_static

echo "building libboot_control^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libboot_control,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libboot_control^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/boot/1.1/default/boot_control/libboot_control^android_vendor.31_x86_x86_64_static

echo "building libhadamardutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhadamardutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libhadamardutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils^android_vendor.31_x86_64_static

echo "building libhealth2impl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealth2impl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libhealth2impl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl^android_vendor.31_x86_64_static

echo "building libhealth2impl^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealth2impl,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libhealth2impl^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl^android_vendor.31_x86_x86_64_static

echo "building libhealthloop^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealthloop,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libhealthloop^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_64_static

echo "building libhealthloop^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealthloop,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libhealthloop^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/utils/libhealthloop/libhealthloop^android_vendor.31_x86_x86_64_static

echo "building libkeymint_support^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libkeymint_support,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libkeymint_support^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/security/keymint/support/libkeymint_support^android_x86_64_static

echo "building librebootescrowdefaultimpl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja librebootescrowdefaultimpl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/librebootescrowdefaultimpl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl^android_vendor.31_x86_64_static

echo "building libvibratorexampleimpl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libvibratorexampleimpl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/libvibratorexampleimpl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_1_0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_1_0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_1_0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_1_1^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_1_1,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_1_1^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_1_2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_1_2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_1_2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_1_3^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_1_3,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_1_3^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_aidl^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_aidl,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_aidl^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_aidl^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_aidl,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_aidl^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_64_static_com.android.neuralnetworks

echo "building neuralnetworks_utils_hal_aidl^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_aidl,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_aidl^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl^android_x86_x86_64_static_com.android.neuralnetworks

echo "building neuralnetworks_utils_hal_common^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_common,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_common^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_common^android_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_common,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_common^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_64_static_apex30

echo "building neuralnetworks_utils_hal_common^android_x86_x86_64_static_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_common,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_common^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common^android_x86_x86_64_static_apex30

echo "building neuralnetworks_utils_hal_service^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_service,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_service^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_vendor.31_x86_64_static

echo "building neuralnetworks_utils_hal_service^android_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_service,android_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_service^android_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_64_static_com.android.neuralnetworks

echo "building neuralnetworks_utils_hal_service^android_x86_x86_64_static_com.android.neuralnetworks"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja neuralnetworks_utils_hal_service,android_x86_x86_64_static_com.android.neuralnetworks
mkdir -p $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_x86_64_static_com.android.neuralnetworks
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/hardware/interfaces/neuralnetworks_utils_hal_service^android_x86_x86_64_static_com.android.neuralnetworks.output . $GITHUB_WORKSPACE/artifacts/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service^android_x86_x86_64_static_com.android.neuralnetworks

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/hardware/interfaces/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 hardware_interfaces.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst" ]; then
  echo "Compressing bootable/recovery -> bootable_recovery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libexif.tar.zst" ]; then
  echo "Compressing external/libexif -> external_libexif.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libexif.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libexif/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_xsdc.tar.zst" ]; then
  echo "Compressing system/tools/xsdc -> system_tools_xsdc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_xsdc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/xsdc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
