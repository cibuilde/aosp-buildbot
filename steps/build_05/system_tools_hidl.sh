
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

echo "Preparing for system/tools/hidl"

clone_depth_platform build/soong
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/hidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/automotive/display/1.0/android.frameworks.automotive.display@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.0/android.frameworks.cameraservice.device@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/device/2.1/android.frameworks.cameraservice.device@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.0/android.frameworks.cameraservice.service@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.1/android.frameworks.cameraservice.service@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/cameraservice/service/2.2/android.frameworks.cameraservice.service@2.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/vr/composer/2.0/android.frameworks.vr.composer@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderthreadstate/1.0/binderthreadstateutilstest@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/2.0/android.hardware.audio@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/4.0/android.hardware.audio@4.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/5.0/android.hardware.audio@5.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/6.0/android.hardware.audio@6.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/7.0/android.hardware.audio@7.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/2.0/android.hardware.audio.effect@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/audiocontrol/1.0/android.hardware.automotive.audiocontrol@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/audiocontrol/2.0/android.hardware.automotive.audiocontrol@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/can/1.0/android.hardware.automotive.can@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/evs/1.0/android.hardware.automotive.evs@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/evs/1.1/android.hardware.automotive.evs@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/sv/1.0/android.hardware.automotive.sv@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/automotive/vehicle/2.0/android.hardware.automotive.vehicle@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/biometrics/fingerprint/2.3/android.hardware.biometrics.fingerprint@2.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.2/android.hardware.boot@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/broadcastradio/2.0/android.hardware.broadcastradio@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.1/android.hardware.cas@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.2/android.hardware.cas@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/ir/1.0/android.hardware.ir@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/light/2.0/android.hardware.light@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/1.0/android.hardware.media.bufferpool@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/oemlock/1.0/android.hardware.oemlock@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.2/android.hardware.power@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.3/android.hardware.power@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.0/android.hardware.radio@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.1/android.hardware.radio@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.2/android.hardware.radio@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.3/android.hardware.radio@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.4/android.hardware.radio@1.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.5/android.hardware.radio@1.5-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/1.6/android.hardware.radio@1.6-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.1/android.hardware.secure_element@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/secure_element/1.2/android.hardware.secure_element@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.1/android.hardware.soundtrigger@2.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.2/android.hardware.soundtrigger@2.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/soundtrigger/2.3/android.hardware.soundtrigger@2.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/bar/1.0/android.hardware.tests.bar@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/baz/1.0/android.hardware.tests.baz@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/expression/1.0/android.hardware.tests.expression@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/extension/light/2.0/android.hardware.tests.extension.light@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/foo/1.0/android.hardware.tests.foo@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/hash/1.0/android.hardware.tests.hash@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/inheritance/1.0/android.hardware.tests.inheritance@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/libhwbinder/1.0/android.hardware.tests.libhwbinder@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/memory/1.0/android.hardware.tests.memory@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/memory/2.0/android.hardware.tests.memory@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/msgq/1.0/android.hardware.tests.msgq@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/multithread/1.0/android.hardware.tests.multithread@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/safeunion/1.0/android.hardware.tests.safeunion@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/safeunion/cpp/1.0/android.hardware.tests.safeunion.cpp@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tests/trie/1.0/android.hardware.tests.trie@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/config/1.0/android.hardware.tetheroffload.config@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/control/1.0/android.hardware.tetheroffload.control@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tetheroffload/control/1.1/android.hardware.tetheroffload.control@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/1.1/android.hardware.thermal@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.0/android.hardware.tv.cec@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/cec/1.1/android.hardware.tv.cec@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.0/android.hardware.tv.tuner@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/tv/tuner/1.1/android.hardware.tv.tuner@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.0/android.hardware.usb@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.1/android.hardware.usb@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.2/android.hardware.usb@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/1.3/android.hardware.usb@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.1/android.hardware.usb.gadget@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/usb/gadget/1.2/android.hardware.usb.gadget@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vr/1.0/android.hardware.vr@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/weaver/1.0/android.hardware.weaver@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.1/android.hardware.wifi@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.2/android.hardware.wifi@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.3/android.hardware.wifi@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.4/android.hardware.wifi@1.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/1.5/android.hardware.wifi@1.5-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.0/android.hardware.wifi.hostapd@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.1/android.hardware.wifi.hostapd@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.2/android.hardware.wifi.hostapd@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/hostapd/1.3/android.hardware.wifi.hostapd@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/offload/1.0/android.hardware.wifi.offload@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant@1.3-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant@1.4-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc/intf/nxpnfc/1.0/vendor.nxp.nxpnfc@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/nxp/nfc/intf/nxpnfc/2.0/vendor.nxp.nxpnfc@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/nxp/secure_element/intf/nxpese/1.0/vendor.nxp.nxpese@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/android.hidl.token@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/build/hidl_metadata_json^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl2aidl/test/1.0/hidl2aidl.test@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl2aidl/test/1.1/hidl2aidl.test@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl2aidl/test/1.2/hidl2aidl.test@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl2aidl/test/3.0/hidl2aidl.test@3.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/hidl2aidl/test/extension/1.2/hidl2aidl.test.extension@1.2-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/metadata/hidl_metadata_parser^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/metadata/hidl_metadata_in_cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/build_variants/1.0/hidl_test_system_ext@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/build_variants/2.0/hidl_test_product@2.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/format_test/1.0/hidl_format_test_pkg@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/vendor/1.0/hidl.tests.vendor@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/vendor/1.1/hidl.tests.vendor@1.1-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/test/vendor/android/1.0/hidl.tests.vendor.android@1.0-inheritance-hierarchy^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_static/ .

echo "building hidl_metadata_json^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja hidl_metadata_json,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/build/hidl_metadata_json^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/hidl_metadata_json^.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/build/hidl_metadata_json^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/hidl_metadata_json^.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/build/hidl_metadata_json^ $GITHUB_WORKSPACE/artifacts/system/tools/hidl/build/hidl_metadata_json^/addition_copy_files.output

echo "building libhidlmetadata^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libhidlmetadata,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidlmetadata^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidlmetadata^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libhidlmetadata^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libhidlmetadata,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidlmetadata^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidlmetadata^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/libhidlmetadata^linux_glibc_x86_64_static/addition_copy_files.output

echo "building hidl_metadata_in_cpp^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja hidl_metadata_in_cpp,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/hidl_metadata_in_cpp^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/hidl_metadata_in_cpp^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/hidl_metadata_in_cpp^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/hidl_metadata_in_cpp^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/hidl_metadata_in_cpp^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/system/tools/hidl/metadata/hidl_metadata_in_cpp^linux_glibc_x86_64/addition_copy_files.output

echo "building libhidl-gen-utils^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libhidl-gen-utils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidl-gen-utils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/tools/hidl/libhidl-gen-utils^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/tools/hidl/utils/libhidl-gen-utils^linux_glibc_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/tools/hidl/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_tools_hidl.tar.zst --clobber

du -ah -d1 system_tools_hidl*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi


rm -rf aosp
