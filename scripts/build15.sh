source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

rm -rf prebuiltlibs/art/adbconnection/libadbconnection
rm -rf prebuiltlibs/art/compiler/libart-compiler
rm -rf prebuiltlibs/art/compiler/libartd-compiler
rm -rf prebuiltlibs/art/dalvikvm/dalvikvm
rm -rf prebuiltlibs/art/dex2oat/dex2oat
rm -rf prebuiltlibs/art/dex2oat/dex2oatd
rm -rf prebuiltlibs/art/dex2oat/libart-dex2oat
rm -rf prebuiltlibs/art/dex2oat/libartd-dex2oat
rm -rf prebuiltlibs/art/dex2oat/libdex2oatd_static
rm -rf prebuiltlibs/art/dexdump/dexdump
rm -rf prebuiltlibs/art/dexlayout/libart-dexlayout
rm -rf prebuiltlibs/art/dexlayout/libartd-dexlayout
rm -rf prebuiltlibs/art/dexlist/dexlist
rm -rf prebuiltlibs/art/dexoptanalyzer/dexoptanalyzer
rm -rf prebuiltlibs/art/disassembler/libart-disassembler
rm -rf prebuiltlibs/art/disassembler/libartd-disassembler
rm -rf prebuiltlibs/art/dt_fd_forward/libdt_fd_forward
rm -rf prebuiltlibs/art/libartbase/libartbase
rm -rf prebuiltlibs/art/libartbase/libartbased
rm -rf prebuiltlibs/art/libartpalette/libartpalette
rm -rf prebuiltlibs/art/libdexfile/libdexfile
rm -rf prebuiltlibs/art/libdexfile/libdexfile_support
rm -rf prebuiltlibs/art/libdexfile/libdexfile_support_static
rm -rf prebuiltlibs/art/libdexfile/libdexfiled
rm -rf prebuiltlibs/art/libelffile/libelffile
rm -rf prebuiltlibs/art/libelffile/libelffiled
rm -rf prebuiltlibs/art/libnativebridge/libnativebridge
rm -rf prebuiltlibs/art/libnativebridge/libnativebridge_lazy
rm -rf prebuiltlibs/art/libnativeloader/libnativeloader
rm -rf prebuiltlibs/art/libnativeloader/libnativeloader_lazy
rm -rf prebuiltlibs/art/libprofile/libprofile
rm -rf prebuiltlibs/art/libprofile/libprofiled
rm -rf prebuiltlibs/art/oatdump/liboatdump_static
rm -rf prebuiltlibs/art/oatdump/oatdump
rm -rf prebuiltlibs/art/odrefresh/libodrstatslog
rm -rf prebuiltlibs/art/odrefresh/odrefresh
rm -rf prebuiltlibs/art/openjdkjvm/libopenjdkjvm
rm -rf prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti
rm -rf prebuiltlibs/art/perfetto_hprof/libperfetto_hprof
rm -rf prebuiltlibs/art/profman/libprofman_static
rm -rf prebuiltlibs/art/profman/profman
rm -rf prebuiltlibs/art/runtime/libart
rm -rf prebuiltlibs/art/runtime/libartd
rm -rf prebuiltlibs/art/runtime/libstatslog_art
rm -rf prebuiltlibs/art/sigchainlib/libsigchain
rm -rf prebuiltlibs/art/sigchainlib/libsigchain_fake
rm -rf prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s
rm -rf prebuiltlibs/art/tools/hiddenapi/hiddenapi
rm -rf prebuiltlibs/art/tools/veridex/veridex

rm -rf prebuiltlibs/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0
rm -rf prebuiltlibs/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/audio/4.0/android.hardware.audio@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/5.0/android.hardware.audio@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/6.0/android.hardware.audio@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/7.0/android.hardware.audio@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0
rm -rf prebuiltlibs/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example
rm -rf prebuiltlibs/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session
rm -rf prebuiltlibs/hardware/interfaces/boot/1.0/android.hardware.boot@1.0
rm -rf prebuiltlibs/hardware/interfaces/boot/1.1/android.hardware.boot@1.1
rm -rf prebuiltlibs/hardware/interfaces/boot/1.1/default/boot_control/libboot_control
rm -rf prebuiltlibs/hardware/interfaces/boot/1.2/android.hardware.boot@1.2
rm -rf prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-impl
rm -rf prebuiltlibs/hardware/interfaces/boot/1.2/default/android.hardware.boot@1.2-service
rm -rf prebuiltlibs/hardware/interfaces/broadcastradio/1.0/android.hardware.broadcastradio@1.0
rm -rf prebuiltlibs/hardware/interfaces/broadcastradio/1.1/android.hardware.broadcastradio@1.1
rm -rf prebuiltlibs/hardware/interfaces/broadcastradio/common/utils1x/android.hardware.broadcastradio@common-utils-1x-lib
rm -rf prebuiltlibs/hardware/interfaces/camera/common/1.0/android.hardware.camera.common@1.0
rm -rf prebuiltlibs/hardware/interfaces/camera/common/1.0/default/android.hardware.camera.common@1.0-helper
rm -rf prebuiltlibs/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7
rm -rf prebuiltlibs/hardware/interfaces/cas/1.0/android.hardware.cas@1.0
rm -rf prebuiltlibs/hardware/interfaces/cas/1.1/android.hardware.cas@1.1
rm -rf prebuiltlibs/hardware/interfaces/cas/1.2/android.hardware.cas@1.2
rm -rf prebuiltlibs/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service
rm -rf prebuiltlibs/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0
rm -rf prebuiltlibs/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1
rm -rf prebuiltlibs/hardware/interfaces/configstore/utils/android.hardware.configstore-utils
rm -rf prebuiltlibs/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0
rm -rf prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib
rm -rf prebuiltlibs/hardware/interfaces/contexthub/1.0/android.hardware.contexthub@1.0
rm -rf prebuiltlibs/hardware/interfaces/contexthub/1.1/android.hardware.contexthub@1.1
rm -rf prebuiltlibs/hardware/interfaces/contexthub/1.2/android.hardware.contexthub@1.2
rm -rf prebuiltlibs/hardware/interfaces/contexthub/1.2/default/android.hardware.contexthub@1.2-service.mock
rm -rf prebuiltlibs/hardware/interfaces/drm/1.0/android.hardware.drm@1.0
rm -rf prebuiltlibs/hardware/interfaces/drm/1.1/android.hardware.drm@1.1
rm -rf prebuiltlibs/hardware/interfaces/drm/1.2/android.hardware.drm@1.2
rm -rf prebuiltlibs/hardware/interfaces/drm/1.3/android.hardware.drm@1.3
rm -rf prebuiltlibs/hardware/interfaces/drm/1.4/android.hardware.drm@1.4
rm -rf prebuiltlibs/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0
rm -rf prebuiltlibs/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1
rm -rf prebuiltlibs/hardware/interfaces/dumpstate/1.1/default/android.hardware.dumpstate@1.1-service.example
rm -rf prebuiltlibs/hardware/interfaces/fastboot/1.0/android.hardware.fastboot@1.0
rm -rf prebuiltlibs/hardware/interfaces/fastboot/1.1/android.hardware.fastboot@1.1
rm -rf prebuiltlibs/hardware/interfaces/fastboot/1.1/default/android.hardware.fastboot@1.1-impl-mock
rm -rf prebuiltlibs/hardware/interfaces/gatekeeper/1.0/android.hardware.gatekeeper@1.0
rm -rf prebuiltlibs/hardware/interfaces/gatekeeper/1.0/software/android.hardware.gatekeeper@1.0-service.software
rm -rf prebuiltlibs/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example
rm -rf prebuiltlibs/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib
rm -rf prebuiltlibs/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0
rm -rf prebuiltlibs/hardware/interfaces/health/1.0/android.hardware.health@1.0
rm -rf prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/android.hardware.health@2.0
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/default/android.hardware.health@2.0-impl-default
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault
rm -rf prebuiltlibs/hardware/interfaces/health/2.1/android.hardware.health@2.1
rm -rf prebuiltlibs/hardware/interfaces/health/2.1/default/android.hardware.health@2.1-service
rm -rf prebuiltlibs/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0
rm -rf prebuiltlibs/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/health/utils/libhealth2impl/libhealth2impl
rm -rf prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example
rm -rf prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib
rm -rf prebuiltlibs/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0
rm -rf prebuiltlibs/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default
rm -rf prebuiltlibs/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0
rm -rf prebuiltlibs/hardware/interfaces/ir/1.0/android.hardware.ir@1.0
rm -rf prebuiltlibs/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support
rm -rf prebuiltlibs/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp
rm -rf prebuiltlibs/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/light/2.0/android.hardware.light@2.0
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example
rm -rf prebuiltlibs/hardware/interfaces/light/utils/blank_screen
rm -rf prebuiltlibs/hardware/interfaces/media/1.0/android.hardware.media@1.0
rm -rf prebuiltlibs/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2
rm -rf prebuiltlibs/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0
rm -rf prebuiltlibs/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0
rm -rf prebuiltlibs/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2
rm -rf prebuiltlibs/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example
rm -rf prebuiltlibs/hardware/interfaces/power/1.0/android.hardware.power@1.0
rm -rf prebuiltlibs/hardware/interfaces/power/1.1/android.hardware.power@1.1
rm -rf prebuiltlibs/hardware/interfaces/power/1.2/android.hardware.power@1.2
rm -rf prebuiltlibs/hardware/interfaces/power/1.3/android.hardware.power@1.3
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/default/android.hardware.power-service.example
rm -rf prebuiltlibs/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example
rm -rf prebuiltlibs/hardware/interfaces/radio/1.0/android.hardware.radio@1.0
rm -rf prebuiltlibs/hardware/interfaces/radio/1.1/android.hardware.radio@1.1
rm -rf prebuiltlibs/hardware/interfaces/radio/1.2/android.hardware.radio@1.2
rm -rf prebuiltlibs/hardware/interfaces/radio/1.3/android.hardware.radio@1.3
rm -rf prebuiltlibs/hardware/interfaces/radio/1.4/android.hardware.radio@1.4
rm -rf prebuiltlibs/hardware/interfaces/radio/1.5/android.hardware.radio@1.5
rm -rf prebuiltlibs/hardware/interfaces/radio/1.6/android.hardware.radio@1.6
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3
rm -rf prebuiltlibs/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl
rm -rf prebuiltlibs/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0
rm -rf prebuiltlibs/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust
rm -rf prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust
rm -rf prebuiltlibs/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0
rm -rf prebuiltlibs/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert
rm -rf prebuiltlibs/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0
rm -rf prebuiltlibs/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1
rm -rf prebuiltlibs/hardware/interfaces/sensors/2.1/default/android.hardware.sensors@2.1-service.mock
rm -rf prebuiltlibs/hardware/interfaces/sensors/common/default/2.X/android.hardware.sensors@2.X-shared-impl
rm -rf prebuiltlibs/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0
rm -rf prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core
rm -rf prebuiltlibs/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0
rm -rf prebuiltlibs/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1
rm -rf prebuiltlibs/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0
rm -rf prebuiltlibs/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0
rm -rf prebuiltlibs/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock
rm -rf prebuiltlibs/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0
rm -rf prebuiltlibs/hardware/interfaces/usb/1.0/android.hardware.usb@1.0
rm -rf prebuiltlibs/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl
rm -rf prebuiltlibs/hardware/interfaces/vr/1.0/android.hardware.vr@1.0
rm -rf prebuiltlibs/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example
rm -rf prebuiltlibs/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant@1.0
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant@1.1
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant@1.2
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant@1.3
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant@1.4

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/av/camera/ndk/libcamera2ndk/android_x86_64_shared/libcamera2ndk.so \
  out/soong/.intermediates/frameworks/av/camera/ndk/libcamera2ndk/android_x86_x86_64_shared/libcamera2ndk.so \
  out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_shared_cfi_com.android.media/libmediatranscoding.so \
  out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_static_cfi_com.android.media/libmediatranscoding.a \
  out/soong/.intermediates/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_shared_com.android.media/libmediatranscodingservice.so \
  out/soong/.intermediates/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_static_com.android.media/libmediatranscodingservice.a \
  out/soong/.intermediates/frameworks/av/services/mediatranscoding/mediatranscoding/android_x86_64_com.android.media/mediatranscoding \
  out/soong/.intermediates/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_64_shared_cfi/libstagefright_http_support.so \
  out/soong/.intermediates/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_x86_64_shared_cfi/libstagefright_http_support.so \
  

mkdir -p prebuiltlibs/frameworks/av/camera/ndk/libcamera2ndk/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/camera/ndk/libcamera2ndk/android_x86_64_shared/libcamera2ndk.so prebuiltlibs/frameworks/av/camera/ndk/libcamera2ndk/android_x86_64_shared/libcamera2ndk.so
mkdir -p prebuiltlibs/frameworks/av/camera/ndk/libcamera2ndk/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/camera/ndk/libcamera2ndk/android_x86_x86_64_shared/libcamera2ndk.so prebuiltlibs/frameworks/av/camera/ndk/libcamera2ndk/android_x86_x86_64_shared/libcamera2ndk.so
mkdir -p prebuiltlibs/frameworks/av/camera/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/camera/ndk/include/ prebuiltlibs/frameworks/av/camera/ndk/include
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_shared_cfi_com.android.media/libmediatranscoding.so prebuiltlibs/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_shared_cfi_com.android.media/libmediatranscoding.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_static_cfi_com.android.media/libmediatranscoding.a prebuiltlibs/frameworks/av/media/libmediatranscoding/libmediatranscoding/android_x86_64_static_cfi_com.android.media/libmediatranscoding.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediatranscoding/include/ prebuiltlibs/frameworks/av/media/libmediatranscoding/include
mkdir -p prebuiltlibs/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_shared_com.android.media/ && mv out/soong/.intermediates/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_shared_com.android.media/libmediatranscodingservice.so prebuiltlibs/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_shared_com.android.media/libmediatranscodingservice.so
mkdir -p prebuiltlibs/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_static_com.android.media/ && mv out/soong/.intermediates/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_static_com.android.media/libmediatranscodingservice.a prebuiltlibs/frameworks/av/services/mediatranscoding/libmediatranscodingservice/android_x86_64_static_com.android.media/libmediatranscodingservice.a
mkdir -p prebuiltlibs/frameworks/av/services/mediatranscoding/mediatranscoding/android_x86_64_com.android.media/ && mv out/soong/.intermediates/frameworks/av/services/mediatranscoding/mediatranscoding/android_x86_64_com.android.media/mediatranscoding prebuiltlibs/frameworks/av/services/mediatranscoding/mediatranscoding/android_x86_64_com.android.media/mediatranscoding
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_64_shared_cfi/libstagefright_http_support.so prebuiltlibs/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_64_shared_cfi/libstagefright_http_support.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_x86_64_shared_cfi/libstagefright_http_support.so prebuiltlibs/frameworks/av/media/libstagefright/http/libstagefright_http_support/android_x86_x86_64_shared_cfi/libstagefright_http_support.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/http/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/http/ prebuiltlibs/frameworks/av/media/libstagefright/http/

printf "cc_prebuilt_library_shared {\n  name: \"libcamera2ndk\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libgui\",\"libutils\",\"libandroid_runtime\",\"libcamera_client\",\"libstagefright_foundation\",\"libcutils\",\"libcamera_metadata\",\"libmediandk\",\"libnativewindow\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libnativewindow\"],\n  version_script: \"libcamera2ndk.map.txt\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcamera2ndk.so\"],\n}\n" >> prebuiltlibs/frameworks/av/camera/ndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediatranscoding\",\n  min_sdk_version: \"29\",\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  shared_libs: [\"libandroid#31\",\"libbinder_ndk\",\"libcutils\",\"liblog\",\"libutils\",\"libmediatranscoder\",\"libmediandk\",\"libstatssocket#30\"],\n  export_shared_lib_headers: [\"libmediandk\"],\n  export_include_dirs: [\"include\"],\n  static_libs: [\"mediatranscoding_aidl_interface-ndk_platform\",\"resourceobserver_aidl_interface-V1-ndk_platform\",\"libstatslog_media\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediatranscoding.a\"],\n  },\n  shared: {\n    srcs: [\"libmediatranscoding.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediatranscoding/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediatranscodingservice\",\n  min_sdk_version: \"29\",\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  shared_libs: [\"libandroid#31\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"liblog\",\"libmediatranscoding\",\"libutils\"],\n  export_shared_lib_headers: [\"libmediatranscoding\"],\n  static_libs: [\"mediatranscoding_aidl_interface-ndk_platform\"],\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediatranscodingservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmediatranscodingservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/mediatranscoding/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mediatranscoding\",\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"libutils\",\"liblog\",\"libbase\",\"libmediatranscoding\",\"libmediatranscodingservice\"],\n  min_sdk_version: \"29\",\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediatranscoding\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediatranscoding/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstagefright_http_support\",\n  shared_libs: [\"liblog\",\"libutils\",\"libandroid_runtime\",\"libmedia\"],\n  export_include_dirs: [\".\"],\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_http_support.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/http/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-15
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-15.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-15.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_64_shared/librtp_jni.so \
  out/soong/.intermediates/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_x86_64_shared/librtp_jni.so \
  

mkdir -p prebuiltlibs/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_64_shared/librtp_jni.so prebuiltlibs/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_64_shared/librtp_jni.so
mkdir -p prebuiltlibs/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_x86_64_shared/librtp_jni.so prebuiltlibs/frameworks/opt/net/voip/src/jni/rtp/librtp_jni/android_x86_x86_64_shared/librtp_jni.so

printf "cc_prebuilt_library_shared {\n  name: \"librtp_jni\",\n  shared_libs: [\"framework-permission-aidl-cpp\",\"libandroid_runtime\",\"libaudioclient\",\"libaudiofoundation\",\"libbinder\",\"libcutils\",\"liblog\",\"libnativehelper\",\"libstagefright_amrnb_common\",\"libutils\"],\n  static_libs: [\"libgsm\",\"framework-permission-aidl-cpp\",\"libstagefright_amrnbdec\",\"libstagefright_amrnbenc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librtp_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/opt/net/voip/src/jni/rtp/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/opt/net/voip/ninja && rsync -ar out/soong/ninja/frameworks/opt/net/voip/ prebuiltlibs/frameworks/opt/net/voip/ninja/frameworks_opt_net_voip-15
touch prebuiltlibs/frameworks/opt/net/voip/ninja/.find-ignore
tar cfJ frameworks_opt_net_voip-15.tar.xz -C prebuiltlibs/frameworks/opt/net/voip/ .
ls -l frameworks_opt_net_voip-15.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/rs/libRSCacheDir/android_x86_64_shared/libRSCacheDir.so \
  out/soong/.intermediates/frameworks/rs/libRSCacheDir/android_x86_x86_64_shared/libRSCacheDir.so \
  

mkdir -p prebuiltlibs/frameworks/rs/libRSCacheDir/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSCacheDir/android_x86_64_shared/libRSCacheDir.so prebuiltlibs/frameworks/rs/libRSCacheDir/android_x86_64_shared/libRSCacheDir.so
mkdir -p prebuiltlibs/frameworks/rs/libRSCacheDir/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSCacheDir/android_x86_x86_64_shared/libRSCacheDir.so prebuiltlibs/frameworks/rs/libRSCacheDir/android_x86_x86_64_shared/libRSCacheDir.so

printf "cc_prebuilt_library_shared {\n  name: \"libRSCacheDir\",\n  shared_libs: [\"libandroid_runtime\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRSCacheDir.so\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-15
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-15.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-15.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_64_shared_apex30/libframework-connectivity-jni.so \
  out/soong/.intermediates/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_x86_64_shared_apex30/libframework-connectivity-jni.so \
  

mkdir -p prebuiltlibs/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_64_shared_apex30/ && mv out/soong/.intermediates/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_64_shared_apex30/libframework-connectivity-jni.so prebuiltlibs/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_64_shared_apex30/libframework-connectivity-jni.so
mkdir -p prebuiltlibs/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_x86_64_shared_apex30/ && mv out/soong/.intermediates/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_x86_64_shared_apex30/libframework-connectivity-jni.so prebuiltlibs/packages/modules/Connectivity/framework/libframework-connectivity-jni/android_x86_x86_64_shared_apex30/libframework-connectivity-jni.so

printf "cc_prebuilt_library_shared {\n  name: \"libframework-connectivity-jni\",\n  min_sdk_version: \"30\",\n  shared_libs: [\"libandroid\",\"liblog\",\"libnativehelper\"],\n  stl: \"none\",\n  apex_available: [\"com.android.tethering\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libframework-connectivity-jni.so\"],\n}\n" >> prebuiltlibs/packages/modules/Connectivity/framework/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/Connectivity/ninja && rsync -ar out/soong/ninja/packages/modules/Connectivity/ prebuiltlibs/packages/modules/Connectivity/ninja/packages_modules_Connectivity-15
touch prebuiltlibs/packages/modules/Connectivity/ninja/.find-ignore
tar cfJ packages_modules_Connectivity-15.tar.xz -C prebuiltlibs/packages/modules/Connectivity/ .
ls -l packages_modules_Connectivity-15.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
