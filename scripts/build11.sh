source $GITHUB_WORKSPACE/envsetup.sh
df -h


sed -i 's/rust_prebuilt_rlib {$/rust_prebuilt_library {/' prebuiltlibs/packages/modules/Virtualization/authfs/Android.bp

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

rm -rf prebuiltlibs/external/llvm/lib/Support/libLLVMSupport
rm -rf prebuiltlibs/external/llvm/lib/TableGen/libLLVMTableGen
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/libLLVMARMCodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo
rm -rf prebuiltlibs/external/llvm/lib/Analysis/libLLVMAnalysis
rm -rf prebuiltlibs/external/llvm/lib/AsmParser/libLLVMAsmParser
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader
rm -rf prebuiltlibs/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/libLLVMCodeGen
rm -rf prebuiltlibs/external/llvm/lib/IR/libLLVMCore
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel
rm -rf prebuiltlibs/external/llvm/lib/IRReader/libLLVMIRReader
rm -rf prebuiltlibs/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation
rm -rf prebuiltlibs/external/llvm/lib/LTO/libLLVMLTO
rm -rf prebuiltlibs/external/llvm/lib/LibDriver/libLLVMLibDriver
rm -rf prebuiltlibs/external/llvm/lib/Linker/libLLVMLinker
rm -rf prebuiltlibs/external/llvm/lib/MC/libLLVMMC
rm -rf prebuiltlibs/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT
rm -rf prebuiltlibs/external/llvm/lib/MC/MCParser/libLLVMMCParser
rm -rf prebuiltlibs/external/llvm/lib/Object/libLLVMObject
rm -rf prebuiltlibs/external/llvm/lib/Option/libLLVMOption
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT
rm -rf prebuiltlibs/external/llvm/lib/ProfileData/libLLVMProfileData
rm -rf prebuiltlibs/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize
rm -rf prebuiltlibs/external/llvm/lib/Target/libLLVMTarget
rm -rf prebuiltlibs/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/libLLVMX86CodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils
rm -rf prebuiltlibs/external/llvm/lib/Transforms/IPO/libLLVMipo
rm -rf prebuiltlibs/external/llvm/libLLVM_android

rm -rf prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader
rm -rf prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl
rm -rf prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools
rm -rf prebuiltlibs/external/swiftshader/src/swiftshader_debug
rm -rf prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc
rm -rf prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug

rm -rf prebuiltlibs/hardware/interfaces/confirmationui/support/android.hardware.confirmationui-support-lib
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2onfbadapter/libhwc2onfbadapter
rm -rf prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0-enums
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/libhadamardutils
rm -rf prebuiltlibs/hardware/interfaces/health/utils/libhealthloop/libhealthloop
rm -rf prebuiltlibs/hardware/interfaces/authsecret/aidl/android.hardware.authsecret-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/authsecret/aidl/default/android.hardware.authsecret-service.example
rm -rf prebuiltlibs/hardware/interfaces/automotive/occupant_awareness/aidl/android.hardware.automotive.occupant_awareness-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/common/aidl/android.hardware.biometrics.common-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/common/support/libaidlcommonsupport
rm -rf prebuiltlibs/hardware/interfaces/common/fmq/aidl/android.hardware.common.fmq-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/android.hardware.gnss-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/health/storage/aidl/android.hardware.health.storage-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-cpp
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/android.hardware.identity-V3-cpp
rm -rf prebuiltlibs/hardware/interfaces/keymaster/aidl/android.hardware.keymaster-V3-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/aidl/android.hardware.biometrics.face-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/aidl/default/android.hardware.biometrics.face-service.example
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/android.hardware.biometrics.fingerprint-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/aidl/default/android.hardware.biometrics.fingerprint-service.example
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/android.hardware.identity-V3-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/android.hardware.light-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/android.hardware.light-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/light/aidl/default/android.hardware.lights-service.example
rm -rf prebuiltlibs/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/memtrack/aidl/default/android.hardware.memtrack-service.example
rm -rf prebuiltlibs/hardware/interfaces/oemlock/aidl/android.hardware.oemlock-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/oemlock/aidl/default/android.hardware.oemlock-service.example
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/android.hardware.power-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/power/aidl/default/android.hardware.power-service.example
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/android.hardware.power.stats-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/power/stats/aidl/default/android.hardware.power.stats-service.example
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/android.hardware.rebootescrow-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/librebootescrowdefaultimpl
rm -rf prebuiltlibs/hardware/interfaces/rebootescrow/aidl/default/android.hardware.rebootescrow-service.default
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-cpp
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/support/libkeymint_support
rm -rf prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/default/libvibratorexampleimpl
rm -rf prebuiltlibs/hardware/interfaces/vibrator/aidl/default/android.hardware.vibrator-service.example
rm -rf prebuiltlibs/hardware/interfaces/weaver/aidl/android.hardware.weaver-V1-ndk_platform
rm -rf prebuiltlibs/hardware/interfaces/weaver/aidl/default/android.hardware.weaver-service.example
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/hwc2on1adapter/libhwc2on1adapter
rm -rf prebuiltlibs/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0
rm -rf prebuiltlibs/hardware/interfaces/atrace/1.0/default/android.hardware.atrace@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/2.0/android.hardware.audio.common@2.0
rm -rf prebuiltlibs/hardware/interfaces/soundtrigger/2.0/android.hardware.soundtrigger@2.0
rm -rf prebuiltlibs/hardware/interfaces/soundtrigger/2.0/default/android.hardware.soundtrigger@2.0-core
rm -rf prebuiltlibs/hardware/interfaces/tv/input/1.0/android.hardware.tv.input@1.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/4.0/android.hardware.audio.common@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/4.0/android.hardware.audio.effect@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/4.0/android.hardware.audio@4.0
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@4.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/5.0/android.hardware.audio.common@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/5.0/android.hardware.audio.effect@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/5.0/android.hardware.audio@5.0
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@5.0-util
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/utils/libbluetooth_audio_session
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/audio/2.1/default/android.hardware.bluetooth.audio@2.1-impl
rm -rf prebuiltlibs/hardware/interfaces/audio/common/6.0/android.hardware.audio.common@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/6.0/android.hardware.audio.effect@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/6.0/android.hardware.audio@6.0
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@6.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/7.0/android.hardware.audio.common@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/android.hardware.audio.common@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/7.0/android.hardware.audio.effect@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/util/android.hardware.audio.effect@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/7.0/android.hardware.audio@7.0
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/util/android.hardware.audio@7.0-util
rm -rf prebuiltlibs/hardware/interfaces/audio/common/all-versions/default/service/android.hardware.audio.service
rm -rf prebuiltlibs/hardware/interfaces/authsecret/1.0/android.hardware.authsecret@1.0
rm -rf prebuiltlibs/hardware/interfaces/authsecret/1.0/default/android.hardware.authsecret@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/1.0/android.hardware.biometrics.face@1.0
rm -rf prebuiltlibs/hardware/interfaces/biometrics/face/1.0/default/android.hardware.biometrics.face@1.0-service.example
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.1/android.hardware.biometrics.fingerprint@2.1
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/android.hardware.biometrics.fingerprint@2.2
rm -rf prebuiltlibs/hardware/interfaces/biometrics/fingerprint/2.2/default/android.hardware.biometrics.fingerprint@2.2-service.example
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0
rm -rf prebuiltlibs/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1
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
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.2/android.hardware.camera.metadata@3.2
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.3/android.hardware.camera.metadata@3.3
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.4/android.hardware.camera.metadata@3.4
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.5/android.hardware.camera.metadata@3.5
rm -rf prebuiltlibs/hardware/interfaces/camera/metadata/3.6/android.hardware.camera.metadata@3.6
rm -rf prebuiltlibs/hardware/interfaces/cas/1.0/android.hardware.cas@1.0
rm -rf prebuiltlibs/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0
rm -rf prebuiltlibs/hardware/interfaces/cas/1.1/android.hardware.cas@1.1
rm -rf prebuiltlibs/hardware/interfaces/cas/1.2/android.hardware.cas@1.2
rm -rf prebuiltlibs/hardware/interfaces/cas/1.2/default/android.hardware.cas@1.2-service
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1
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
rm -rf prebuiltlibs/hardware/interfaces/gnss/visibility_control/1.0/android.hardware.gnss.visibility_control@1.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/1.0/android.hardware.gnss@1.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/measurement_corrections/1.0/android.hardware.gnss.measurement_corrections@1.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/1.1/android.hardware.gnss@1.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/2.0/android.hardware.gnss@2.0
rm -rf prebuiltlibs/hardware/interfaces/gnss/measurement_corrections/1.1/android.hardware.gnss.measurement_corrections@1.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/2.1/android.hardware.gnss@2.1
rm -rf prebuiltlibs/hardware/interfaces/gnss/common/utils/default/android.hardware.gnss@common-default-lib
rm -rf prebuiltlibs/hardware/interfaces/gnss/aidl/default/android.hardware.gnss-service.example
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0
rm -rf prebuiltlibs/hardware/interfaces/camera/device/1.0/android.hardware.camera.device@1.0
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.2/android.hardware.camera.device@3.2
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.4/android.hardware.camera.provider@2.4
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.5/android.hardware.camera.provider@2.5
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.3/android.hardware.camera.device@3.3
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.4/android.hardware.camera.device@3.4
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.5/android.hardware.camera.device@3.5
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.6/android.hardware.camera.device@3.6
rm -rf prebuiltlibs/hardware/interfaces/camera/device/3.7/android.hardware.camera.device@3.7
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.6/android.hardware.camera.provider@2.6
rm -rf prebuiltlibs/hardware/interfaces/camera/provider/2.7/android.hardware.camera.provider@2.7
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2
rm -rf prebuiltlibs/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.1/utils/resources/android.hardware.graphics.composer@2.1-resources
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.2/utils/resources/android.hardware.graphics.composer@2.2-resources
rm -rf prebuiltlibs/hardware/interfaces/graphics/composer/2.4/default/android.hardware.graphics.composer@2.4-service
rm -rf prebuiltlibs/hardware/interfaces/media/1.0/android.hardware.media@1.0
rm -rf prebuiltlibs/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0
rm -rf prebuiltlibs/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0
rm -rf prebuiltlibs/hardware/interfaces/health/storage/1.0/android.hardware.health.storage@1.0
rm -rf prebuiltlibs/hardware/interfaces/health/1.0/android.hardware.health@1.0
rm -rf prebuiltlibs/hardware/interfaces/health/1.0/default/android.hardware.health@1.0-convert
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/android.hardware.health@2.0
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthhalutils/libhealthhalutils
rm -rf prebuiltlibs/hardware/interfaces/health/2.0/utils/libhealthstoragedefault/libhealthstoragedefault
rm -rf prebuiltlibs/hardware/interfaces/health/2.1/android.hardware.health@2.1
rm -rf prebuiltlibs/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0
rm -rf prebuiltlibs/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0
rm -rf prebuiltlibs/hardware/interfaces/input/classifier/1.0/default/android.hardware.input.classifier@1.0-service.default
rm -rf prebuiltlibs/hardware/interfaces/ir/1.0/android.hardware.ir@1.0
rm -rf prebuiltlibs/hardware/interfaces/keymaster/3.0/android.hardware.keymaster@3.0
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.0/android.hardware.keymaster@4.0
rm -rf prebuiltlibs/hardware/interfaces/confirmationui/1.0/android.hardware.confirmationui@1.0
rm -rf prebuiltlibs/hardware/interfaces/identity/support/android.hardware.identity-support-lib
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-hal-common
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-libeic-library
rm -rf prebuiltlibs/hardware/interfaces/identity/aidl/default/android.hardware.identity-service.example
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.1/android.hardware.keymaster@4.1
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.0/support/libkeymaster4support
rm -rf prebuiltlibs/hardware/interfaces/keymaster/4.1/support/libkeymaster4_1support
rm -rf prebuiltlibs/hardware/interfaces/light/2.0/android.hardware.light@2.0
rm -rf prebuiltlibs/hardware/interfaces/light/utils/blank_screen
rm -rf prebuiltlibs/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1
rm -rf prebuiltlibs/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2
rm -rf prebuiltlibs/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/android.hardware.neuralnetworks@1.0
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.0/android.hardware.nfc@1.0
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.1/android.hardware.nfc@1.1
rm -rf prebuiltlibs/hardware/interfaces/nfc/1.2/android.hardware.nfc@1.2
rm -rf prebuiltlibs/hardware/interfaces/power/stats/1.0/android.hardware.power.stats@1.0
rm -rf prebuiltlibs/hardware/interfaces/power/1.0/android.hardware.power@1.0
rm -rf prebuiltlibs/hardware/interfaces/power/1.1/android.hardware.power@1.1
rm -rf prebuiltlibs/hardware/interfaces/power/1.2/android.hardware.power@1.2
rm -rf prebuiltlibs/hardware/interfaces/power/1.3/android.hardware.power@1.3
rm -rf prebuiltlibs/hardware/interfaces/radio/1.0/android.hardware.radio@1.0
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.0/android.hardware.radio.config@1.0
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.1/android.hardware.radio.config@1.1
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.2/android.hardware.radio.config@1.2
rm -rf prebuiltlibs/hardware/interfaces/radio/deprecated/1.0/android.hardware.radio.deprecated@1.0
rm -rf prebuiltlibs/hardware/interfaces/radio/1.1/android.hardware.radio@1.1
rm -rf prebuiltlibs/hardware/interfaces/radio/1.2/android.hardware.radio@1.2
rm -rf prebuiltlibs/hardware/interfaces/radio/1.3/android.hardware.radio@1.3
rm -rf prebuiltlibs/hardware/interfaces/radio/1.4/android.hardware.radio@1.4
rm -rf prebuiltlibs/hardware/interfaces/radio/1.5/android.hardware.radio@1.5
rm -rf prebuiltlibs/hardware/interfaces/radio/1.6/android.hardware.radio@1.6
rm -rf prebuiltlibs/hardware/interfaces/radio/config/1.3/android.hardware.radio.config@1.3
rm -rf prebuiltlibs/hardware/interfaces/renderscript/1.0/android.hardware.renderscript@1.0
rm -rf prebuiltlibs/hardware/interfaces/secure_element/1.0/android.hardware.secure_element@1.0
rm -rf prebuiltlibs/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0
rm -rf prebuiltlibs/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0
rm -rf prebuiltlibs/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1
rm -rf prebuiltlibs/hardware/interfaces/tests/lazy/1.0/android.hardware.tests.lazy@1.0
rm -rf prebuiltlibs/hardware/interfaces/tests/lazy/1.1/android.hardware.tests.lazy@1.1
rm -rf prebuiltlibs/hardware/interfaces/thermal/1.0/android.hardware.thermal@1.0
rm -rf prebuiltlibs/hardware/interfaces/thermal/2.0/android.hardware.thermal@2.0
rm -rf prebuiltlibs/hardware/interfaces/thermal/2.0/default/android.hardware.thermal@2.0-service.mock
rm -rf prebuiltlibs/hardware/interfaces/usb/gadget/1.0/android.hardware.usb.gadget@1.0
rm -rf prebuiltlibs/hardware/interfaces/usb/1.0/android.hardware.usb@1.0
rm -rf prebuiltlibs/hardware/interfaces/usb/1.0/default/android.hardware.usb@1.0-service
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2
rm -rf prebuiltlibs/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3
rm -rf prebuiltlibs/hardware/interfaces/vr/1.0/android.hardware.vr@1.0
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.0/android.hardware.wifi.supplicant@1.0
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.1/android.hardware.wifi.supplicant@1.1
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.2/android.hardware.wifi.supplicant@1.2
rm -rf prebuiltlibs/hardware/interfaces/wifi/1.0/android.hardware.wifi@1.0
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.3/android.hardware.wifi.supplicant@1.3
rm -rf prebuiltlibs/hardware/interfaces/wifi/supplicant/1.4/android.hardware.wifi.supplicant@1.4
rm -rf prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl
rm -rf prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service
rm -rf prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust
rm -rf prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust
rm -rf prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust

rm -rf prebuiltlibs/external/perfetto/ipc_plugin
rm -rf prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin
rm -rf prebuiltlibs/external/perfetto/protozero_plugin
rm -rf prebuiltlibs/external/perfetto/libperfetto
rm -rf prebuiltlibs/external/perfetto/traced
rm -rf prebuiltlibs/external/perfetto/traced_probes
rm -rf prebuiltlibs/external/perfetto/perfetto
rm -rf prebuiltlibs/external/perfetto/trigger_perfetto
rm -rf prebuiltlibs/external/perfetto/libstatslog_perfetto
rm -rf prebuiltlibs/external/perfetto/heapprofd
rm -rf prebuiltlibs/external/perfetto/heapprofd_client
rm -rf prebuiltlibs/external/perfetto/libperfetto_android_internal
rm -rf prebuiltlibs/external/perfetto/traced_perf

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/art/runtime/libart/android_x86_64_shared_apex31/libart.so \
  out/soong/.intermediates/art/runtime/libart/android_x86_64_static_apex31/libart.a \
  out/soong/.intermediates/art/runtime/libart/android_x86_x86_64_shared_apex31/libart.so \
  out/soong/.intermediates/art/runtime/libart/android_x86_x86_64_static_apex31/libart.a \
  out/soong/.intermediates/art/runtime/libart/linux_glibc_x86_64_static/libart.a \
  out/soong/.intermediates/art/dexoptanalyzer/dexoptanalyzer/android_x86_64_apex31/dexoptanalyzer \
  out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_64_shared_apex31/libadbconnection.so \
  out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_64_static_apex31/libadbconnection.a \
  out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_x86_64_shared_apex31/libadbconnection.so \
  out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_x86_64_static_apex31/libadbconnection.a \
  out/soong/.intermediates/art/compiler/libart-compiler/linux_glibc_x86_64_static/libart-compiler.a \
  out/soong/.intermediates/art/compiler/libart-compiler/android_x86_64_shared_apex31/libart-compiler.so \
  out/soong/.intermediates/art/compiler/libart-compiler/android_x86_x86_64_shared_apex31/libart-compiler.so \
  out/soong/.intermediates/art/dex2oat/libart-dex2oat/android_x86_64_static_lto-thin_apex31/libart-dex2oat.a \
  out/soong/.intermediates/art/dex2oat/libart-dex2oat/android_x86_x86_64_static_lto-thin_apex31/libart-dex2oat.a \
  out/soong/.intermediates/art/dex2oat/dex2oat/android_x86_64_apex31/dex2oat64 \
  out/soong/.intermediates/art/dex2oat/dex2oat/android_x86_x86_64_apex31/dex2oat32 \
  out/soong/.intermediates/art/oatdump/liboatdump_static/linux_glibc_x86_64_static/liboatdump_static.a \
  out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_64_shared_apex31/libopenjdkjvm.so \
  out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_64_static_apex31/libopenjdkjvm.a \
  out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_shared_apex31/libopenjdkjvm.so \
  out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_static_apex31/libopenjdkjvm.a \
  out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_shared_apex31/libopenjdkjvmti.so \
  out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_static_apex31/libopenjdkjvmti.a \
  out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_shared_apex31/libopenjdkjvmti.so \
  out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_static_apex31/libopenjdkjvmti.a \
  out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_64_shared_apex31/libperfetto_hprof.so \
  out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_64_static_apex31/libperfetto_hprof.a \
  out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_shared_apex31/libperfetto_hprof.so \
  out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_static_apex31/libperfetto_hprof.a \
  out/soong/.intermediates/art/oatdump/oatdump/linux_glibc_x86_64/oatdump \
  out/soong/.intermediates/art/oatdump/oatdump/android_x86_64_apex31/oatdump \
  out/soong/.intermediates/art/odrefresh/odrefresh/android_x86_64_apex31/odrefresh \
  out/soong/.intermediates/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a \
  out/soong/.intermediates/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a \
  out/soong/.intermediates/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a \
  out/soong/.intermediates/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a \
  out/soong/.intermediates/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd64 \
  

mkdir -p prebuiltlibs/art/runtime/libart/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/runtime/libart/android_x86_64_shared_apex31/libart.so prebuiltlibs/art/runtime/libart/android_x86_64_shared_apex31/libart.so
mkdir -p prebuiltlibs/art/runtime/libart/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/runtime/libart/android_x86_64_static_apex31/libart.a prebuiltlibs/art/runtime/libart/android_x86_64_static_apex31/libart.a
mkdir -p prebuiltlibs/art/runtime/libart/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/runtime/libart/android_x86_x86_64_shared_apex31/libart.so prebuiltlibs/art/runtime/libart/android_x86_x86_64_shared_apex31/libart.so
mkdir -p prebuiltlibs/art/runtime/libart/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/runtime/libart/android_x86_x86_64_static_apex31/libart.a prebuiltlibs/art/runtime/libart/android_x86_x86_64_static_apex31/libart.a
mkdir -p prebuiltlibs/art/runtime/libart/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/runtime/libart/linux_glibc_x86_64_static/libart.a prebuiltlibs/art/runtime/libart/linux_glibc_x86_64_static/libart.a
mkdir -p prebuiltlibs/art/runtime/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/runtime/ prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/android_x86_64_apex31/gen prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/android_x86_64_apex31/gen prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/android_x86_x86_64_apex31/gen prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/android_x86_x86_64_apex31/gen prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/linux_glibc_x86_64/gen prebuiltlibs/art/runtime/
mkdir -p prebuiltlibs/art/dexoptanalyzer/dexoptanalyzer/android_x86_64_apex31/ && mv out/soong/.intermediates/art/dexoptanalyzer/dexoptanalyzer/android_x86_64_apex31/dexoptanalyzer prebuiltlibs/art/dexoptanalyzer/dexoptanalyzer/android_x86_64_apex31/dexoptanalyzer
mkdir -p prebuiltlibs/art/adbconnection/libadbconnection/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_64_shared_apex31/libadbconnection.so prebuiltlibs/art/adbconnection/libadbconnection/android_x86_64_shared_apex31/libadbconnection.so
mkdir -p prebuiltlibs/art/adbconnection/libadbconnection/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_64_static_apex31/libadbconnection.a prebuiltlibs/art/adbconnection/libadbconnection/android_x86_64_static_apex31/libadbconnection.a
mkdir -p prebuiltlibs/art/adbconnection/libadbconnection/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_x86_64_shared_apex31/libadbconnection.so prebuiltlibs/art/adbconnection/libadbconnection/android_x86_x86_64_shared_apex31/libadbconnection.so
mkdir -p prebuiltlibs/art/adbconnection/libadbconnection/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/adbconnection/libadbconnection/android_x86_x86_64_static_apex31/libadbconnection.a prebuiltlibs/art/adbconnection/libadbconnection/android_x86_x86_64_static_apex31/libadbconnection.a
mkdir -p prebuiltlibs/art/compiler/libart-compiler/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/compiler/libart-compiler/linux_glibc_x86_64_static/libart-compiler.a prebuiltlibs/art/compiler/libart-compiler/linux_glibc_x86_64_static/libart-compiler.a
mkdir -p prebuiltlibs/art/compiler/libart-compiler/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/compiler/libart-compiler/android_x86_64_shared_apex31/libart-compiler.so prebuiltlibs/art/compiler/libart-compiler/android_x86_64_shared_apex31/libart-compiler.so
mkdir -p prebuiltlibs/art/compiler/libart-compiler/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/compiler/libart-compiler/android_x86_x86_64_shared_apex31/libart-compiler.so prebuiltlibs/art/compiler/libart-compiler/android_x86_x86_64_shared_apex31/libart-compiler.so
mkdir -p prebuiltlibs/art/compiler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/compiler/ prebuiltlibs/art/compiler/
mkdir -p prebuiltlibs/art/dex2oat/libart-dex2oat/android_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/art/dex2oat/libart-dex2oat/android_x86_64_static_lto-thin_apex31/libart-dex2oat.a prebuiltlibs/art/dex2oat/libart-dex2oat/android_x86_64_static_lto-thin_apex31/libart-dex2oat.a
mkdir -p prebuiltlibs/art/dex2oat/libart-dex2oat/android_x86_x86_64_static_lto-thin_apex31/ && mv out/soong/.intermediates/art/dex2oat/libart-dex2oat/android_x86_x86_64_static_lto-thin_apex31/libart-dex2oat.a prebuiltlibs/art/dex2oat/libart-dex2oat/android_x86_x86_64_static_lto-thin_apex31/libart-dex2oat.a
mkdir -p prebuiltlibs/art/dex2oat/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/dex2oat/ prebuiltlibs/art/dex2oat/
mkdir -p prebuiltlibs/art/dex2oat/dex2oat/android_x86_64_apex31/ && mv out/soong/.intermediates/art/dex2oat/dex2oat/android_x86_64_apex31/dex2oat64 prebuiltlibs/art/dex2oat/dex2oat/android_x86_64_apex31/dex2oat
mkdir -p prebuiltlibs/art/dex2oat/dex2oat/android_x86_x86_64_apex31/ && mv out/soong/.intermediates/art/dex2oat/dex2oat/android_x86_x86_64_apex31/dex2oat32 prebuiltlibs/art/dex2oat/dex2oat/android_x86_x86_64_apex31/dex2oat
mkdir -p prebuiltlibs/art/oatdump/liboatdump_static/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/oatdump/liboatdump_static/linux_glibc_x86_64_static/liboatdump_static.a prebuiltlibs/art/oatdump/liboatdump_static/linux_glibc_x86_64_static/liboatdump_static.a
mkdir -p prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_64_shared_apex31/libopenjdkjvm.so prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_64_shared_apex31/libopenjdkjvm.so
mkdir -p prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_64_static_apex31/libopenjdkjvm.a prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_64_static_apex31/libopenjdkjvm.a
mkdir -p prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_shared_apex31/libopenjdkjvm.so prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_shared_apex31/libopenjdkjvm.so
mkdir -p prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_static_apex31/libopenjdkjvm.a prebuiltlibs/art/openjdkjvm/libopenjdkjvm/android_x86_x86_64_static_apex31/libopenjdkjvm.a
mkdir -p prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_shared_apex31/libopenjdkjvmti.so prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_shared_apex31/libopenjdkjvmti.so
mkdir -p prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_static_apex31/libopenjdkjvmti.a prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_64_static_apex31/libopenjdkjvmti.a
mkdir -p prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_shared_apex31/libopenjdkjvmti.so prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_shared_apex31/libopenjdkjvmti.so
mkdir -p prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_static_apex31/libopenjdkjvmti.a prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti/android_x86_x86_64_static_apex31/libopenjdkjvmti.a
mkdir -p prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_64_shared_apex31/libperfetto_hprof.so prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_64_shared_apex31/libperfetto_hprof.so
mkdir -p prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_64_static_apex31/ && mv out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_64_static_apex31/libperfetto_hprof.a prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_64_static_apex31/libperfetto_hprof.a
mkdir -p prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_shared_apex31/libperfetto_hprof.so prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_shared_apex31/libperfetto_hprof.so
mkdir -p prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_static_apex31/libperfetto_hprof.a prebuiltlibs/art/perfetto_hprof/libperfetto_hprof/android_x86_x86_64_static_apex31/libperfetto_hprof.a
mkdir -p prebuiltlibs/art/oatdump/oatdump/linux_glibc_x86_64/ && mv out/soong/.intermediates/art/oatdump/oatdump/linux_glibc_x86_64/oatdump prebuiltlibs/art/oatdump/oatdump/linux_glibc_x86_64/oatdump
mkdir -p prebuiltlibs/art/oatdump/oatdump/android_x86_64_apex31/ && mv out/soong/.intermediates/art/oatdump/oatdump/android_x86_64_apex31/oatdump prebuiltlibs/art/oatdump/oatdump/android_x86_64_apex31/oatdump
mkdir -p prebuiltlibs/art/odrefresh/odrefresh/android_x86_64_apex31/ && mv out/soong/.intermediates/art/odrefresh/odrefresh/android_x86_64_apex31/odrefresh prebuiltlibs/art/odrefresh/odrefresh/android_x86_64_apex31/odrefresh
mkdir -p prebuiltlibs/art/runtime/libartd/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a prebuiltlibs/art/runtime/libartd/linux_glibc_x86_64_static/libartd.a
mkdir -p prebuiltlibs/art/runtime/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/runtime/ prebuiltlibs/art/runtime/
rsync -ar out/soong/.intermediates/art/tools/cpp-define-generator/cpp-define-generator-asm-support/linux_glibc_x86_64/gen prebuiltlibs/art/runtime/
mkdir -p prebuiltlibs/art/compiler/libartd-compiler/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a prebuiltlibs/art/compiler/libartd-compiler/linux_glibc_x86_64_static/libartd-compiler.a
mkdir -p prebuiltlibs/art/compiler/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/compiler/ prebuiltlibs/art/compiler/
mkdir -p prebuiltlibs/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a prebuiltlibs/art/dex2oat/libartd-dex2oat/linux_glibc_x86_64_static/libartd-dex2oat.a
mkdir -p prebuiltlibs/art/dex2oat/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" art/dex2oat/ prebuiltlibs/art/dex2oat/
mkdir -p prebuiltlibs/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a prebuiltlibs/art/dex2oat/libdex2oatd_static/linux_glibc_x86_64_static/libdex2oatd_static.a
mkdir -p prebuiltlibs/art/dex2oat/dex2oatd/linux_glibc_x86_64/ && mv out/soong/.intermediates/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd64 prebuiltlibs/art/dex2oat/dex2oatd/linux_glibc_x86_64/dex2oatd

printf "cc_prebuilt_library {\n  name: \"libart\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libnativeloader-headers\"],\n      shared_libs: [\"libdl_android\",\"libicu\",\"libstatssocket\",\"libz\",\"heapprofd_client_api\"],\n      static_libs: [\"libstatslog_art\",\"libxml2\"],\n      lto: {\n        thin: true,\n      },\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      header_libs: [\"libicuuc_headers\"],\n      shared_libs: [\"libz\"],\n    },\n    android_arm: {\n      strip: {\n        keep_symbols_and_debug_frame: true,\n      },\n      pgo: {\n        profile_file: \"art/art_arm_arm64.profdata\",\n      },\n    },\n    android_arm64: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_arm_arm64.profdata\",\n      },\n    },\n    android_x86: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_x86_x86_64.profdata\",\n      },\n    },\n    android_x86_64: {\n      strip: {\n        keep_symbols: true,\n      },\n      pgo: {\n        profile_file: \"art/art_x86_x86_64.profdata\",\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  whole_static_libs: [\"libcpu_features\"],\n  shared_libs: [\"libartpalette\",\"libbacktrace\",\"libbase\",\"liblog\",\"liblz4\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libsigchain\",\"libunwindstack\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n  static_libs: [\"libodrstatslog\",\"libelffile\"],\n  runtime_libs: [\"libjavacore\"],\n  export_include_dirs: [\".\",\"gen\"],\n  export_shared_lib_headers: [\"libbase\",\"libdexfile\"],\n  pgo: {\n    sampling: true,\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libart.a\"],\n  },\n  shared: {\n    srcs: [\"libart.so\"],\n  },\n}\n" >> prebuiltlibs/art/runtime/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dexoptanalyzer\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"first\",\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libart\",\"libartbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dexoptanalyzer\"],\n}\n" >> prebuiltlibs/art/dexoptanalyzer/Android.bp
printf "cc_prebuilt_library {\n  name: \"libadbconnection\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  compile_multilib: \"both\",\n  shared_libs: [\"libbase\",\"libadbconnection_client\",\"libart\",\"libartbase\"],\n  required: [\"libjdwp\",\"libdt_fd_forward\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libadbconnection.a\"],\n  },\n  shared: {\n    srcs: [\"libadbconnection.so\"],\n  },\n}\n" >> prebuiltlibs/art/adbconnection/Android.bp
printf "cc_prebuilt_library {\n  name: \"libart-compiler\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n    arm64: {\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      lto: {\n        thin: true,\n      },\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n    android_arm64: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_arm: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_x86_64: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n    android_x86: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  static: {\n    srcs: [\"libart-compiler.a\"],\n  },\n  shared_libs: [\"libbase\",\"liblzma\",\"libart\",\"libartbase\",\"libartpalette\",\"libprofile\",\"libdexfile\"],\n  export_include_dirs: [\".\"],\n  pgo: {\n    instrumentation: true,\n    benchmarks: [\"dex2oat\"],\n  },\n  whole_static_libs: [\"libelffile\"],\n  runtime_libs: [\"libart-disassembler\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libart-compiler.so\"],\n  },\n}\n" >> prebuiltlibs/art/compiler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libart-dex2oat\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcrypto\",\"liblog\",\"liblz4\",\"libz\",\"libart-compiler\",\"libart-dexlayout\",\"libart\",\"libartpalette\",\"libprofile\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libart-dex2oat.a\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dex2oat\",\n  visibility: [\"//visibility:public\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"both\",\n      shared_libs: [\"libartpalette\",\"libbase\",\"libcrypto\",\"liblz4\",\"liblog\",\"libsigchain\",\"libz\",\"libart\",\"libart-compiler\",\"libart-dexlayout\",\"libartbase\",\"libdexfile\",\"libprofile\"],\n      static_libs: [\"libart-dex2oat\"],\n      lto: {\n        thin: true,\n      },\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      static_libs: [\"libdex2oat_static\"],\n      stl: \"c++_static\",\n      compile_multilib: \"64\",\n      symlink_preferred_arch: true,\n    },\n    android_arm64: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_arm: {\n      pgo: {\n        profile_file: \"art/dex2oat_arm_arm64.profdata\",\n      },\n    },\n    android_x86_64: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n    android_x86: {\n      pgo: {\n        profile_file: \"art/dex2oat_x86_x86_64.profdata\",\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  pgo: {\n    instrumentation: true,\n    benchmarks: [\"dex2oat\"],\n  },\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dex2oat\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"liboatdump_static\",\n  whole_static_libs: [\"libart-compiler\",\"libart-dexlayout\",\"libart-disassembler\",\"libvixl\",\"libartpalette\",\"libbacktrace\",\"libbase\",\"liblog\",\"liblz4\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libodrstatslog\",\"libsigchain_fake\",\"libunwindstack\",\"libz\",\"libartbase\",\"libdexfile\",\"libdexfile_support_static\",\"libprofile\",\"libart\",\"libelffile\",\"libziparchive\"],\n  target: {\n    bionic: {\n      whole_static_libs: [\"libasync_safe\"],\n    },\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  device_supported: false,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liboatdump_static.a\"],\n}\n" >> prebuiltlibs/art/oatdump/Android.bp
printf "cc_prebuilt_library {\n  name: \"libopenjdkjvm\",\n  visibility: [\"//libcore\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libart\",\"libartbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libopenjdkjvm.a\"],\n  },\n  shared: {\n    srcs: [\"libopenjdkjvm.so\"],\n  },\n}\n" >> prebuiltlibs/art/openjdkjvm/Android.bp
printf "cc_prebuilt_library {\n  name: \"libopenjdkjvmti\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libart\",\"libart-compiler\",\"libart-dexlayout\",\"libdexfile\",\"libartbase\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libopenjdkjvmti.a\"],\n  },\n  shared: {\n    srcs: [\"libopenjdkjvmti.so\"],\n  },\n}\n" >> prebuiltlibs/art/openjdkjvmti/Android.bp
printf "cc_prebuilt_library {\n  name: \"libperfetto_hprof\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: false,\n  compile_multilib: \"both\",\n  shared_libs: [\"libbase\",\"liblog\",\"libdexfile\",\"libart\",\"libartbase\"],\n  static_libs: [\"libperfetto_client_experimental\",\"perfetto_trace_protos\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libperfetto_hprof.a\"],\n  },\n  shared: {\n    srcs: [\"libperfetto_hprof.so\"],\n  },\n}\n" >> prebuiltlibs/art/perfetto_hprof/Android.bp
printf "cc_prebuilt_binary {\n  name: \"oatdump\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      shared_libs: [\"libart\",\"libart-compiler\",\"libart-dexlayout\",\"libart-disassembler\",\"libartbase\",\"libbase\",\"libdexfile\",\"libprofile\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      static_libs: [\"liboatdump_static\"],\n      stl: \"c++_static\",\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"oatdump\"],\n}\n" >> prebuiltlibs/art/oatdump/Android.bp
printf "cc_prebuilt_binary {\n  name: \"odrefresh\",\n  visibility: [\"//art:__subpackages__\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"first\",\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  host_supported: true,\n  shared_libs: [\"libartpalette\",\"libbase\",\"libdexfile\",\"liblog\",\"libart\",\"libartbase\"],\n  static_libs: [\"libxml2\"],\n  required: [\"dexoptanalyzer\",\"dex2oat\"],\n  apex_available: [\"com.android.art\",\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"odrefresh\"],\n}\n" >> prebuiltlibs/art/odrefresh/Android.bp
printf "cc_prebuilt_library {\n  name: \"libartd\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\",\"libnativeloader-headers\"],\n      shared_libs: [\"libdl_android\",\"libicu\",\"libstatssocket\",\"libz\",\"heapprofd_client_api\"],\n      static_libs: [\"libstatslog_art\",\"libxml2\"],\n    },\n    host: {\n      header_libs: [\"libicuuc_headers\"],\n      shared_libs: [\"libz\"],\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    android_arm: {\n    },\n    android_arm64: {\n    },\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n      avx: {\n      },\n    },\n    arm: {\n    },\n    arm64: {\n    },\n  },\n  host_supported: true,\n  whole_static_libs: [\"libcpu_features\"],\n  shared_libs: [\"libartpalette\",\"libbacktrace\",\"libbase\",\"liblog\",\"liblz4\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libsigchain\",\"libunwindstack\",\"libartbased\",\"libdexfiled\",\"libprofiled\"],\n  static_libs: [\"libodrstatslog\",\"libelffiled\"],\n  runtime_libs: [\"libjavacore\"],\n  export_include_dirs: [\".\",\"gen\"],\n  export_shared_lib_headers: [\"libbase\",\"libdexfiled\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd.a\"],\n}\n" >> prebuiltlibs/art/runtime/Android.bp
printf "cc_prebuilt_library {\n  name: \"libartd-compiler\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  static: {\n  },\n  shared_libs: [\"libbase\",\"liblzma\",\"libartbased\",\"libartd\",\"libartpalette\",\"libprofiled\",\"libdexfiled\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libelffiled\"],\n  runtime_libs: [\"libartd-disassembler\"],\n  apex_available: [\"com.android.art.debug\",\"com.android.art\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-compiler.a\"],\n}\n" >> prebuiltlibs/art/compiler/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libartd-dex2oat\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcrypto\",\"liblog\",\"liblz4\",\"libz\",\"libartd-compiler\",\"libartd-dexlayout\",\"libartd\",\"libartpalette\",\"libprofiled\"],\n  export_include_dirs: [\".\"],\n  apex_available: [\"com.android.art.debug\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libartd-dex2oat.a\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdex2oatd_static\",\n  visibility: [\"//art:__subpackages__\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    host: {\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    bionic: {\n      whole_static_libs: [\"libasync_safe\"],\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  whole_static_libs: [\"libbase\",\"libartpalette\",\"liblog\",\"libz\",\"libziparchive\",\"libartbased\",\"libartd-disassembler\",\"libvixld\",\"libartd\",\"libelffiled\",\"libdexfiled\",\"libprofiled\",\"libartd-compiler\",\"libcrypto\",\"liblz4\",\"libbacktrace\",\"liblzma\",\"libnativebridge\",\"libnativeloader\",\"libodrstatslog\",\"libsigchain_fake\",\"libunwindstack\",\"libdexfile_support_static\",\"libartd-dexlayout\",\"libartd-dex2oat\"],\n  device_supported: false,\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdex2oatd_static.a\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp
printf "cc_prebuilt_binary {\n  name: \"dex2oatd\",\n  visibility: [\"//visibility:public\"],\n  target: {\n    android: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n      compile_multilib: \"both\",\n      shared_libs: [\"libartpalette\",\"libbase\",\"libcrypto\",\"liblz4\",\"liblog\",\"libsigchain\",\"libz\",\"libartbased\",\"libartd\",\"libartd-compiler\",\"libartd-dexlayout\",\"libdexfiled\",\"libprofiled\"],\n      static_libs: [\"libartd-dex2oat\"],\n    },\n    host: {\n      static_libs: [\"libdex2oatd_static\"],\n      stl: \"c++_static\",\n      compile_multilib: \"64\",\n      symlink_preferred_arch: true,\n    },\n    linux: {\n    },\n    linux_bionic: {\n      header_libs: [\"bionic_libc_platform_headers\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n  },\n  min_sdk_version: \"S\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  host_supported: true,\n  apex_available: [\"com.android.art.debug\"],\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dex2oatd\"],\n}\n" >> prebuiltlibs/art/dex2oat/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/art/ninja && rsync -ar out/soong/ninja/art/ prebuiltlibs/art/ninja/art-11
touch prebuiltlibs/art/ninja/.find-ignore
tar cfJ art-11.tar.xz -C prebuiltlibs/art/ .
ls -l art-11.tar.xz
end=`date +%s`
echo $((end-start))

rm -rf prebuiltlibs/art/tools/cpp-define-generator/asm_defines.s
rm -rf prebuiltlibs/art/dalvikvm/dalvikvm
rm -rf prebuiltlibs/art/dt_fd_forward/libdt_fd_forward
rm -rf prebuiltlibs/art/dexdump/dexdump
rm -rf prebuiltlibs/art/dexlist/dexlist
rm -rf prebuiltlibs/art/tools/hiddenapi/hiddenapi
rm -rf prebuiltlibs/art/libdexfile/libdexfile_support
rm -rf prebuiltlibs/art/tools/veridex/veridex
rm -rf prebuiltlibs/art/profman/libprofman_static
rm -rf prebuiltlibs/art/profman/profman
rm -rf prebuiltlibs/art/dexoptanalyzer/dexoptanalyzer
rm -rf prebuiltlibs/art/adbconnection/libadbconnection
rm -rf prebuiltlibs/art/dex2oat/dex2oat
rm -rf prebuiltlibs/art/openjdkjvm/libopenjdkjvm
rm -rf prebuiltlibs/art/openjdkjvmti/libopenjdkjvmti
rm -rf prebuiltlibs/art/perfetto_hprof/libperfetto_hprof
rm -rf prebuiltlibs/art/oatdump/oatdump
rm -rf prebuiltlibs/art/odrefresh/odrefresh
rm -rf prebuiltlibs/art/dex2oat/dex2oatd

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate \
  out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so \
  out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so \
  out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so \
  out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so \
  out/soong/.intermediates/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice \
  out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so \
  out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so \
  out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so \
  out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so \
  out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so \
  out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so \
  out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so \
  out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a \
  out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so \
  out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a \
  out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so \
  out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a \
  out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a \
  out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a \
  out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a \
  out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so \
  out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so \
  out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so \
  out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so \
  out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so \
  out/soong/.intermediates/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a \
  out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a \
  out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so \
  out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a \
  out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so \
  out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so \
  out/soong/.intermediates/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so \
  out/soong/.intermediates/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so \
  out/soong/.intermediates/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice \
  

mkdir -p prebuiltlibs/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate prebuiltlibs/frameworks/native/cmds/dumpstate/dumpstate/android_x86_64/dumpstate
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_64_shared/libschedulerservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so prebuiltlibs/frameworks/native/services/schedulerservice/libschedulerservicehidl/android_x86_x86_64_shared/libschedulerservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/schedulerservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/schedulerservice/include/ prebuiltlibs/frameworks/native/services/schedulerservice/include
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_64_shared/libsensorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so prebuiltlibs/frameworks/native/services/sensorservice/libsensorservice/android_x86_x86_64_shared/libsensorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/sensorservice/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice prebuiltlibs/frameworks/native/services/sensorservice/sensorservice/android_x86_64/sensorservice
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_64_shared/libsensorservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so prebuiltlibs/frameworks/native/services/sensorservice/hidl/libsensorservicehidl/android_x86_x86_64_shared/libsensorservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/sensorservice/hidl/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/sensorservice/hidl/include/ prebuiltlibs/frameworks/native/services/sensorservice/hidl/include
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_vendor.31_x86_x86_64_shared/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so prebuiltlibs/frameworks/native/libs/ui/libui/android_x86_64_shared_com.android.media.swcodec/libui.so
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include/ prebuiltlibs/frameworks/native/libs/ui/include
mkdir -p prebuiltlibs/frameworks/native/libs/ui/include_private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/ui/include_private/ prebuiltlibs/frameworks/native/libs/ui/include_private
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_64_shared/libSurfaceFlingerProp.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so prebuiltlibs/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp/android_x86_x86_64_shared/libSurfaceFlingerProp.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_shared/libbufferhub.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_64_static/libbufferhub.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_shared/libbufferhub.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a prebuiltlibs/frameworks/native/libs/vr/libbufferhub/libbufferhub/android_x86_x86_64_static/libbufferhub.a
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_64_shared/libbufferhubqueue.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue/android_x86_x86_64_shared/libbufferhubqueue.so
mkdir -p prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/vr/libbufferhubqueue/include/ prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/include
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/libgui_aidl_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_x86_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui_aidl_static/android_vendor.31_x86_x86_64_static_lto-thin/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/libinput.so
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/libinput.so
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/libinput.a
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/gen/aidl prebuiltlibs/frameworks/native/libs/input/libinput/linux_glibc_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_64_shared/libinputflinger_base.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger_base/android_x86_x86_64_shared/libinputflinger_base.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_64_static/libinputdispatcher.a
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher/android_x86_x86_64_static/libinputdispatcher.a
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_64_shared/libinputreader.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so prebuiltlibs/frameworks/native/services/inputflinger/reader/libinputreader/android_x86_x86_64_shared/libinputreader.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_64_shared/libinputflinger.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so prebuiltlibs/frameworks/native/services/inputflinger/libinputflinger/android_x86_x86_64_shared/libinputflinger.so
mkdir -p prebuiltlibs/frameworks/native/services/inputflinger/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/inputflinger/ prebuiltlibs/frameworks/native/services/inputflinger/
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_static/libnativewindow.a
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_static/libnativewindow.a
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_64_shared_current/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_vendor.31_x86_x86_64_shared/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so prebuiltlibs/frameworks/native/libs/nativewindow/libnativewindow/android_x86_x86_64_shared_current/libnativewindow.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativewindow/include/ prebuiltlibs/frameworks/native/libs/nativewindow/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativewindow/include-private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativewindow/include-private/ prebuiltlibs/frameworks/native/libs/nativewindow/include-private
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_64_static_lto-thin/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_blobCache/android_x86_x86_64_static_lto-thin/libEGL_blobCache.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/EGL
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/opengl/libs/EGL/ prebuiltlibs/frameworks/native/opengl/libs/EGL
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_64_static/libEGL_getProcAddress.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a prebuiltlibs/frameworks/native/opengl/libs/libEGL_getProcAddress/android_x86_x86_64_static/libEGL_getProcAddress.a
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_x86_64_shared_current/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so prebuiltlibs/frameworks/native/opengl/libs/libEGL/android_vendor.31_x86_x86_64_shared/libEGL.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/EGL/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/opengl/libs/EGL/include/ prebuiltlibs/frameworks/native/opengl/libs/EGL/include
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_x86_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv1_CM/android_vendor.31_x86_x86_64_shared/libGLESv1_CM.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_x86_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv2/android_vendor.31_x86_x86_64_shared/libGLESv2.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_64_shared/libGLESv3.so
mkdir -p prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so prebuiltlibs/frameworks/native/opengl/libs/libGLESv3/android_x86_x86_64_shared/libGLESv3.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/libgui.so
mkdir -p prebuiltlibs/frameworks/native/libs/gui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gui/include/ prebuiltlibs/frameworks/native/libs/gui/include
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/libs/gui/libgui/android_vendor.31_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_64_shared/libbufferqueueconverter.so
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so prebuiltlibs/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter/android_vendor.31_x86_x86_64_shared/libbufferqueueconverter.so
mkdir -p prebuiltlibs/frameworks/native/libs/bufferqueueconverter/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/bufferqueueconverter/include/ prebuiltlibs/frameworks/native/libs/bufferqueueconverter/include
mkdir -p prebuiltlibs/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so prebuiltlibs/frameworks/native/services/displayservice/libdisplayservicehidl/android_x86_64_shared/libdisplayservicehidl.so
mkdir -p prebuiltlibs/frameworks/native/services/displayservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/displayservice/include/ prebuiltlibs/frameworks/native/services/displayservice/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/liblayers_proto.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/liblayers_proto.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/layerproto/include/ prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/gen/proto prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_x86_64_static_cfi_com.android.media.swcodec/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_64_static/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a prebuiltlibs/frameworks/native/libs/gui/libgui_bufferqueue_static/android_vendor.31_x86_x86_64_static/libgui_bufferqueue_static.a
mkdir -p prebuiltlibs/frameworks/native/libs/gui/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gui/include/ prebuiltlibs/frameworks/native/libs/gui/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_64_shared/libnativedisplay.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so prebuiltlibs/frameworks/native/libs/nativedisplay/libnativedisplay/android_x86_x86_64_shared/libnativedisplay.so
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativedisplay/include/ prebuiltlibs/frameworks/native/libs/nativedisplay/include
mkdir -p prebuiltlibs/frameworks/native/libs/nativedisplay/include-private
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/nativedisplay/include-private/ prebuiltlibs/frameworks/native/libs/nativedisplay/include-private
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_shared/libtimestats.so
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/libtimestats/android_x86_64_static/libtimestats.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/TimeStats/ prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline/android_x86_64_static_lto-thin/libframetimeline.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/FrameTimeline/ prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/
mkdir -p prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_64_shared/libvulkan.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so prebuiltlibs/frameworks/native/vulkan/libvulkan/libvulkan/android_x86_x86_64_shared/libvulkan.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so prebuiltlibs/frameworks/native/vulkan/vkjson/libvkjson/android_x86_64_shared/libvkjson.so
mkdir -p prebuiltlibs/frameworks/native/vulkan/vkjson/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/vulkan/vkjson/ prebuiltlibs/frameworks/native/vulkan/vkjson/
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so prebuiltlibs/frameworks/native/services/gpuservice/libgpuservice/android_x86_64_shared/libgpuservice.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpuservice/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice prebuiltlibs/frameworks/native/services/gpuservice/gpuservice/android_x86_64/gpuservice

printf "cc_prebuilt_binary {\n  name: \"dumpstate\",\n  shared_libs: [\"android.hardware.dumpstate@1.0\",\"android.hardware.dumpstate@1.1\",\"libziparchive\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libdebuggerd_client\",\"libdumpstateaidl\",\"libdumpstateutil\",\"libdumputils\",\"libhardware_legacy\",\"libhidlbase\",\"liblog\",\"libutils\",\"libbinderdebug\"],\n  required: [\"atrace\",\"dmabuf_dump\",\"ip\",\"iptables\",\"librank\",\"logcat\",\"lpdump\",\"lpdumpd\",\"procrank\",\"screencap\",\"showmap\",\"ss\",\"storaged\",\"toolbox\",\"toybox\",\"vdc\"],\n  init_rc: [\"dumpstate.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"dumpstate\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/dumpstate/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libschedulerservicehidl\",\n  shared_libs: [\"libhidlbase\",\"libmediautils\",\"liblog\",\"libutils\",\"android.frameworks.schedulerservice@1.0\"],\n  export_include_dirs: [\"include/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libschedulerservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/schedulerservice/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorservice\",\n  shared_libs: [\"libcutils\",\"libhardware\",\"libhardware_legacy\",\"libutils\",\"liblog\",\"libactivitymanager_aidl\",\"libbatterystats_aidl\",\"libbinder\",\"libsensor\",\"libsensorprivacy\",\"libpermission\",\"libprotoutil\",\"libcrypto\",\"libbase\",\"libhidlbase\",\"libfmq\",\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.0\",\"android.hardware.sensors@2.1\"],\n  static_libs: [\"android.hardware.sensors@1.0-convert\"],\n  export_shared_lib_headers: [\"libactivitymanager_aidl\",\"libsensor\",\"libsensorprivacy\",\"libpermission\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorservice.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/sensorservice/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sensorservice\",\n  shared_libs: [\"libsensorservice\",\"libsensorprivacy\",\"libbinder\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"sensorservice\"],\n}\n" >> prebuiltlibs/frameworks/native/services/sensorservice/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsensorservicehidl\",\n  header_libs: [\"jni_headers\"],\n  shared_libs: [\"libbase\",\"libhidlbase\",\"libutils\",\"libsensor\",\"android.frameworks.sensorservice@1.0\",\"android.hardware.sensors@1.0\"],\n  static_libs: [\"android.hardware.sensors@1.0-convert\"],\n  export_include_dirs: [\"include/\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsensorservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/sensorservice/hidl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libui\",\n  clang: true,\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  export_include_dirs: [\"include\",\"include_private\"],\n  shared_libs: [\"android.hardware.graphics.allocator@2.0\",\"android.hardware.graphics.allocator@3.0\",\"android.hardware.graphics.allocator@4.0\",\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.mapper@2.0\",\"android.hardware.graphics.mapper@2.1\",\"android.hardware.graphics.mapper@3.0\",\"android.hardware.graphics.mapper@4.0\",\"libbase\",\"libcutils\",\"libgralloctypes\",\"libhidlbase\",\"libsync\",\"libutils\",\"liblog\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libgralloctypes\"],\n  static_libs: [\"libarect\",\"libgrallocusage\",\"libmath\"],\n  whole_static_libs: [\"libui-types\"],\n  target: {\n    vendor: {\n      exclude_header_libs: [],\n      exclude_shared_libs: [],\n    },\n  },\n  header_libs: [\"libbase_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libhardware_headers\",\"libui_headers\"],\n  export_static_lib_headers: [\"libarect\",\"libmath\"],\n  export_header_lib_headers: [\"libbase_headers\",\"libnativebase_headers\",\"libnativewindow_headers\",\"libhardware_headers\",\"libui_headers\"],\n  min_sdk_version: \"29\",\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libui.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/ui/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libSurfaceFlingerProp\",\n  shared_libs: [\"android.hardware.configstore-utils\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore@1.1\",\"android.hardware.graphics.common@1.2\",\"libhidlbase\",\"libui\",\"libutils\",\"liblog\"],\n  static_libs: [\"SurfaceFlingerProperties\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common@1.2\",\"libhidlbase\",\"libui\"],\n  export_static_lib_headers: [\"SurfaceFlingerProperties\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libSurfaceFlingerProp.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/Android.bp
printf "cc_prebuilt_library {\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libui\",\"libutils\",\"libpdx_default_transport\"],\n  header_libs: [\"libbufferhub_headers\",\"libnativebase_headers\"],\n  name: \"libbufferhub\",\n  export_header_lib_headers: [\"libbufferhub_headers\",\"libnativebase_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libbufferhub.a\"],\n  },\n  shared: {\n    srcs: [\"libbufferhub.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libbufferhub/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbufferhubqueue\",\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libbufferhub\"],\n  static_libs: [\"libbufferhub\"],\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libui\",\"libutils\",\"libpdx_default_transport\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbufferhubqueue.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/vr/libbufferhubqueue/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libgui_aidl_static\",\n  vendor_available: true,\n  shared_libs: [\"libbinder\",\"libui\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui_aidl_static.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
printf "cc_prebuilt_library {\n  name: \"libinput\",\n  host_supported: true,\n  clang: true,\n  header_libs: [\"jni_headers\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  shared_libs: [\"libbase\",\"liblog\",\"libcutils\"],\n  static_libs: [\"libui-types\"],\n  export_static_lib_headers: [\"libui-types\"],\n  target: {\n    android: {\n      export_shared_lib_headers: [\"libbinder\"],\n      shared_libs: [\"libutils\",\"libbinder\",\"libui\"],\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    host: {\n      shared: {\n        enabled: false,\n      },\n    },\n    linux_glibc: {\n      static_libs: [\"libhostgraphics\"],\n      shared_libs: [\"libbinder\"],\n    },\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libinput.a\"],\n  },\n  shared: {\n    srcs: [\"libinput.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/input/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputflinger_base\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcutils\",\"libinput\",\"liblog\",\"libui\",\"libutils\"],\n  header_libs: [\"libinputflinger_headers\"],\n  export_header_lib_headers: [\"libinputflinger_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputflinger_base.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libinputdispatcher\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libinput\",\"libkll\",\"liblog\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libui\",\"libutils\",\"lib-platform-compat-native-api\",\"server_configurable_flags\",\"libinputreporter\",\"libinputflinger_base\"],\n  static_libs: [\"libattestation\"],\n  header_libs: [\"libinputdispatcher_headers\"],\n  export_header_lib_headers: [\"libinputdispatcher_headers\"],\n  logtags: [\"EventLogTags.logtags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputdispatcher.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/dispatcher/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputreader\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"libbase\",\"libcap\",\"libcrypto\",\"libcutils\",\"libinput\",\"liblog\",\"libstatslog\",\"libui\",\"libutils\",\"libinputflinger_base\"],\n  static_libs: [\"libc++fs\"],\n  header_libs: [\"libinputreader_headers\"],\n  export_header_lib_headers: [\"libinputreader_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputreader.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/reader/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputflinger\",\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n  },\n  shared_libs: [\"android.hardware.input.classifier@1.0\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"libinput\",\"libkll\",\"liblog\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\",\"libui\",\"lib-platform-compat-native-api\",\"server_configurable_flags\",\"libinputflinger_base\",\"libinputreporter\",\"libinputreader\"],\n  static_libs: [\"libattestation\",\"libinputdispatcher\"],\n  export_static_lib_headers: [\"libinputdispatcher\"],\n  export_include_dirs: [\".\",\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputflinger.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/inputflinger/Android.bp
printf "cc_prebuilt_library {\n  name: \"libnativewindow\",\n  llndk: {\n    symbol_file: \"libnativewindow.map.txt\",\n    unversioned: true,\n    override_export_include_dirs: [\"include\"],\n  },\n  export_include_dirs: [\"include\",\"include-private\"],\n  clang: true,\n  version_script: \"libnativewindow.map.txt\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libutils\",\"libui\",\"android.hardware.graphics.common@1.1\"],\n  static_libs: [\"libarect\",\"libgrallocusage\"],\n  header_libs: [\"libnativebase_headers\"],\n  export_static_lib_headers: [\"libarect\"],\n  export_header_lib_headers: [\"libnativebase_headers\"],\n  stubs: {\n    symbol_file: \"libnativewindow.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnativewindow.a\"],\n  },\n  shared: {\n    srcs: [\"libnativewindow.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/nativewindow/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libEGL_blobCache\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  export_include_dirs: [\"EGL\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_blobCache.a\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libEGL_getProcAddress\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL_getProcAddress.a\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libEGL\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libgraphicsenv\",\"libnativewindow\",\"libbacktrace\",\"libbase\",\"libvndksupport\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore-utils\",\"libhidlbase\",\"libnativebridge_lazy\",\"libnativeloader_lazy\",\"libutils\",\"libSurfaceFlingerProp\"],\n  static_libs: [\"libarect\",\"libEGL_getProcAddress\",\"libEGL_blobCache\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  llndk: {\n    symbol_file: \"libEGL.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  export_include_dirs: [\"EGL/include\"],\n  stubs: {\n    symbol_file: \"libEGL.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libEGL.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libGLESv1_CM\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv1_CM.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  version_script: \"libGLESv1_CM.map.txt\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv1_CM.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libGLESv2\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv2.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  native_coverage: false,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv2.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libGLESv3\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libEGL\"],\n  static_libs: [\"libarect\"],\n  header_libs: [\"gl_headers\"],\n  export_header_lib_headers: [\"gl_headers\"],\n  arch: {\n    arm: {\n    },\n  },\n  llndk: {\n    symbol_file: \"libGLESv3.map.txt\",\n    export_llndk_headers: [\"gl_headers\"],\n    override_export_include_dirs: [],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libGLESv3.so\"],\n}\n" >> prebuiltlibs/frameworks/native/opengl/libs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgui\",\n  clang: true,\n  whole_static_libs: [\"LibGuiProperties\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv2\",\"libhidlbase\",\"liblog\",\"libnativewindow\",\"libsync\",\"libui\",\"libutils\",\"libvndksupport\",\"android.frameworks.bufferhub@1.0\",\"libbinder\",\"libbufferhub\",\"libbufferhubqueue\",\"libinput\",\"libpdx_default_transport\"],\n  static_libs: [\"libbinderthreadstateutils\",\"libgui_aidl_static\"],\n  header_libs: [\"libgui_headers\",\"libgui_aidl_headers\"],\n  export_shared_lib_headers: [\"libEGL\",\"libnativewindow\",\"libui\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbinder\",\"libinput\"],\n  export_header_lib_headers: [\"libgui_headers\",\"libgui_aidl_headers\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    private: true,\n  },\n  double_loadable: true,\n  export_static_lib_headers: [\"libgui_aidl_static\"],\n  target: {\n    vendor: {\n      exclude_shared_libs: [\"android.frameworks.bufferhub@1.0\",\"libbufferhub\",\"libbufferhubqueue\",\"libinput\",\"libpdx_default_transport\"],\n    },\n  },\n  pgo: {\n    sampling: true,\n    profile_file: \"libgui/libgui.profdata\",\n  },\n  lto: {\n    thin: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbufferqueueconverter\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  double_loadable: true,\n  shared_libs: [\"libgui\",\"libui\",\"libutils\",\"libbinder\",\"libbase\",\"liblog\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbufferqueueconverter.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/bufferqueueconverter/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdisplayservicehidl\",\n  shared_libs: [\"libbase\",\"liblog\",\"libgui\",\"libhidlbase\",\"libutils\",\"android.frameworks.displayservice@1.0\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.frameworks.displayservice@1.0\",\"libgui\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdisplayservicehidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/displayservice/Android.bp
printf "cc_prebuilt_library {\n  name: \"liblayers_proto\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.graphics.common@1.1\",\"libgui\",\"libui\",\"libprotobuf-cpp-lite\",\"libbase\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liblayers_proto.a\"],\n  },\n  shared: {\n    srcs: [\"liblayers_proto.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/layerproto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libgui_bufferqueue_static\",\n  clang: true,\n  whole_static_libs: [\"LibGuiProperties\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\",\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv2\",\"libhidlbase\",\"liblog\",\"libnativewindow\",\"libsync\",\"libui\",\"libutils\",\"libvndksupport\"],\n  static_libs: [\"libbinderthreadstateutils\"],\n  header_libs: [\"libgui_headers\"],\n  export_shared_lib_headers: [\"libEGL\",\"libnativewindow\",\"libui\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.graphics.bufferqueue@2.0\",\"android.hardware.graphics.common@1.1\",\"android.hardware.graphics.common@1.2\",\"android.hidl.token@1.0-utils\"],\n  export_header_lib_headers: [\"libgui_headers\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgui_bufferqueue_static.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/gui/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libnativedisplay\",\n  export_include_dirs: [\"include\",\"include-private\"],\n  clang: true,\n  version_script: \"libnativedisplay.map.txt\",\n  shared_libs: [\"libgui\",\"liblog\",\"libnativewindow\",\"libui\",\"libutils\",\"libcutils\",\"libEGL\",\"libGLESv2\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  header_libs: [\"jni_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnativedisplay.so\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/nativedisplay/Android.bp
printf "cc_prebuilt_library {\n  name: \"libtimestats\",\n  shared_libs: [\"android.hardware.graphics.composer@2.4\",\"libbase\",\"libcutils\",\"liblog\",\"libprotobuf-cpp-lite\",\"libtimestats_atoms_proto\",\"libtimestats_proto\",\"libui\",\"libutils\"],\n  export_include_dirs: [\".\"],\n  export_shared_lib_headers: [\"libtimestats_proto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libtimestats.a\"],\n  },\n  shared: {\n    srcs: [\"libtimestats.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/TimeStats/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libframetimeline\",\n  shared_libs: [\"android.hardware.graphics.composer@2.4\",\"libbase\",\"libcutils\",\"liblog\",\"libgui\",\"libtimestats\",\"libui\",\"libutils\"],\n  static_libs: [\"libperfetto_client_experimental\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libframetimeline.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/FrameTimeline/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvulkan\",\n  llndk: {\n    symbol_file: \"libvulkan.map.txt\",\n    export_llndk_headers: [\"vulkan_headers\"],\n  },\n  clang: true,\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  header_libs: [\"vulkan_headers\"],\n  export_header_lib_headers: [\"vulkan_headers\"],\n  shared_libs: [\"android.hardware.configstore@1.0\",\"android.hardware.configstore-utils\",\"libziparchive\",\"libhardware\",\"libsync\",\"libbase\",\"libhidlbase\",\"liblog\",\"libui\",\"libgraphicsenv\",\"libutils\",\"libcutils\",\"libz\",\"libnativebridge_lazy\",\"libnativeloader_lazy\",\"libnativewindow\",\"libvndksupport\",\"android.hardware.graphics.common@1.0\",\"libSurfaceFlingerProp\"],\n  static_libs: [\"libgrallocusage\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvulkan.so\"],\n}\n" >> prebuiltlibs/frameworks/native/vulkan/libvulkan/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvkjson\",\n  export_include_dirs: [\".\"],\n  shared_libs: [\"libvulkan\"],\n  whole_static_libs: [\"libjsoncpp\"],\n  export_shared_lib_headers: [\"libvulkan\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvkjson.so\"],\n}\n" >> prebuiltlibs/frameworks/native/vulkan/vkjson/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgpuservice\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libgfxstats\",\"libgpumem\",\"libgpumemtracer\",\"libgraphicsenv\",\"liblog\",\"libutils\",\"libvkjson\"],\n  static_libs: [\"libserviceutils\"],\n  export_static_lib_headers: [\"libserviceutils\"],\n  export_shared_lib_headers: [\"libgraphicsenv\"],\n  lto: {\n    thin: true,\n  },\n  whole_program_vtables: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgpuservice.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/Android.bp
printf "cc_prebuilt_binary {\n  name: \"gpuservice\",\n  shared_libs: [\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libgpuservice\"],\n  init_rc: [\"gpuservice.rc\"],\n  required: [\"bpfloader\",\"gpu_mem.o\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gpuservice\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-11
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-11.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-11.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
