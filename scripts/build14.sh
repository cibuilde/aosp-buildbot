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
rm -rf prebuiltlibs/art/libnativeloader/libnativeloader
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

rm -rf prebuiltlibs/external/llvm/lib/Analysis/libLLVMAnalysis
rm -rf prebuiltlibs/external/llvm/lib/AsmParser/libLLVMAsmParser
rm -rf prebuiltlibs/external/llvm/lib/Bitcode/Reader/libLLVMBitReader
rm -rf prebuiltlibs/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/AsmPrinter/libLLVMAsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/GlobalISel/libLLVMGlobalISel
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/SelectionDAG/libLLVMSelectionDAG
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/libLLVMCodeGen
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/CodeView/libLLVMDebugInfoCodeView
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/DWARF/libLLVMDebugInfoDWARF
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/PDB/libLLVMDebugInfoPDB
rm -rf prebuiltlibs/external/llvm/lib/DebugInfo/Symbolize/libLLVMSymbolize
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/Orc/libLLVMOrcJIT
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/RuntimeDyld/libLLVMRuntimeDyld
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/libLLVMExecutionEngine
rm -rf prebuiltlibs/external/llvm/lib/IR/libLLVMCore
rm -rf prebuiltlibs/external/llvm/lib/IRReader/libLLVMIRReader
rm -rf prebuiltlibs/external/llvm/lib/LTO/libLLVMLTO
rm -rf prebuiltlibs/external/llvm/lib/LibDriver/libLLVMLibDriver
rm -rf prebuiltlibs/external/llvm/lib/Linker/libLLVMLinker
rm -rf prebuiltlibs/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler
rm -rf prebuiltlibs/external/llvm/lib/MC/MCParser/libLLVMMCParser
rm -rf prebuiltlibs/external/llvm/lib/MC/libLLVMMC
rm -rf prebuiltlibs/external/llvm/lib/Object/libLLVMObject
rm -rf prebuiltlibs/external/llvm/lib/Option/libLLVMOption
rm -rf prebuiltlibs/external/llvm/lib/ProfileData/Coverage/libLLVMProfileDataCoverage
rm -rf prebuiltlibs/external/llvm/lib/ProfileData/libLLVMProfileData
rm -rf prebuiltlibs/external/llvm/lib/Support/libLLVMSupport
rm -rf prebuiltlibs/external/llvm/lib/TableGen/libLLVMTableGen
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/AsmParser/libLLVMAArch64AsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/Disassembler/libLLVMAArch64Disassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/InstPrinter/libLLVMAArch64AsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/MCTargetDesc/libLLVMAArch64Desc
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/TargetInfo/libLLVMAArch64Info
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/Utils/libLLVMAArch64Utils
rm -rf prebuiltlibs/external/llvm/lib/Target/AArch64/libLLVMAArch64CodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/AsmParser/libLLVMARMAsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/Disassembler/libLLVMARMDisassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/InstPrinter/libLLVMARMAsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/MCTargetDesc/libLLVMARMDesc
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/TargetInfo/libLLVMARMInfo
rm -rf prebuiltlibs/external/llvm/lib/Target/ARM/libLLVMARMCodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/AsmParser/libLLVMX86AsmParser
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/Disassembler/libLLVMX86Disassembler
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/InstPrinter/libLLVMX86AsmPrinter
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/MCTargetDesc/libLLVMX86Desc
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/TargetInfo/libLLVMX86Info
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/Utils/libLLVMX86Utils
rm -rf prebuiltlibs/external/llvm/lib/Target/X86/libLLVMX86CodeGen
rm -rf prebuiltlibs/external/llvm/lib/Target/libLLVMTarget
rm -rf prebuiltlibs/external/llvm/lib/Transforms/IPO/libLLVMipo
rm -rf prebuiltlibs/external/llvm/lib/Transforms/InstCombine/libLLVMInstCombine
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Instrumentation/libLLVMInstrumentation
rm -rf prebuiltlibs/external/llvm/lib/Transforms/ObjCARC/libLLVMTransformObjCARC
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Scalar/libLLVMScalarOpts
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Utils/libLLVMTransformUtils
rm -rf prebuiltlibs/external/llvm/lib/Transforms/Vectorize/libLLVMVectorize
rm -rf prebuiltlibs/external/llvm/libLLVM_android

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
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0
rm -rf prebuiltlibs/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1
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
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/android.hardware.neuralnetworks@1.1
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/android.hardware.neuralnetworks@1.2
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/android.hardware.neuralnetworks@1.3
rm -rf prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/android.hardware.neuralnetworks-V1-ndk_platform
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

rm -rf prebuiltlibs/external/skia/libskia_renderengine

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/libhwui.so \
  out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_static/libhwui.a \
  out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/libhwui.so \
  out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/libhwui.a \
  out/soong/.intermediates/frameworks/base/core/jni/libandroid_runtime/android_x86_64_shared/libandroid_runtime.so \
  out/soong/.intermediates/frameworks/base/core/jni/libandroid_runtime/android_x86_x86_64_shared/libandroid_runtime.so \
  out/soong/.intermediates/frameworks/base/media/native/midi/libamidi/android_x86_64_shared/libamidi.so \
  out/soong/.intermediates/frameworks/base/media/native/midi/libamidi/android_x86_x86_64_shared/libamidi.so \
  out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared/libandroid.so \
  out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_x86_64_shared/libandroid.so \
  out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared_current/libandroid.so \
  out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_x86_64_shared_current/libandroid.so \
  out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared_31/libandroid.so \
  out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_64_static/libfilterfw_jni.a \
  out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_x86_64_static/libfilterfw_jni.a \
  out/soong/.intermediates/frameworks/base/cmds/hid/jni/libhidcommand_jni/android_x86_64_shared/libhidcommand_jni.so \
  out/soong/.intermediates/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_64_shared_apex29/libmediaparser-jni.so \
  out/soong/.intermediates/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_x86_64_shared_apex29/libmediaparser-jni.so \
  out/soong/.intermediates/frameworks/base/cmds/uinput/jni/libuinputcommand_jni/android_x86_64_shared/libuinputcommand_jni.so \
  out/soong/.intermediates/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_64_shared/libaudioeffect_jni.so \
  out/soong/.intermediates/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_x86_64_shared/libaudioeffect_jni.so \
  out/soong/.intermediates/frameworks/base/drm/jni/libdrmframework_jni/android_x86_64_shared/libdrmframework_jni.so \
  out/soong/.intermediates/frameworks/base/drm/jni/libdrmframework_jni/android_x86_x86_64_shared/libdrmframework_jni.so \
  out/soong/.intermediates/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_64_shared/libsoundpool.so \
  out/soong/.intermediates/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_x86_64_shared/libsoundpool.so \
  out/soong/.intermediates/frameworks/base/libs/input/libinputservice/android_x86_64_shared/libinputservice.so \
  out/soong/.intermediates/frameworks/base/libs/input/libinputservice/android_x86_x86_64_shared/libinputservice.so \
  out/soong/.intermediates/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_64_shared/libjnigraphics.so \
  out/soong/.intermediates/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_x86_64_shared/libjnigraphics.so \
  out/soong/.intermediates/frameworks/base/cmds/bootanimation/libbootanimation/android_x86_64_shared/libbootanimation.so \
  out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_64_shared/libfilterfw.so \
  out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_x86_64_shared/libfilterfw.so \
  out/soong/.intermediates/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_64_shared/libfilterpack_imageproc.so \
  out/soong/.intermediates/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_x86_64_shared/libfilterpack_imageproc.so \
  out/soong/.intermediates/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni/android_x86_64_shared/libprintspooler_jni.so \
  out/soong/.intermediates/frameworks/base/cmds/screencap/screencap/android_x86_64/screencap \
  out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni/android_x86_64_shared/libmedia_jni.so \
  out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni/android_x86_x86_64_shared/libmedia_jni.so \
  out/soong/.intermediates/frameworks/base/services/core/jni/libservices.core/android_x86_64_static/libservices.core.a \
  out/soong/.intermediates/frameworks/base/services/core/jni/libservices.core/android_x86_x86_64_static/libservices.core.a \
  out/soong/.intermediates/frameworks/base/services/libandroid_servers/android_x86_64_shared/libandroid_servers.so \
  out/soong/.intermediates/frameworks/base/services/libandroid_servers/android_x86_x86_64_shared/libandroid_servers.so \
  out/soong/.intermediates/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_64_shared/libwebviewchromium_plat_support.so \
  out/soong/.intermediates/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_x86_64_shared/libwebviewchromium_plat_support.so \
  

mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/libhwui.so prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/libhwui.so
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_static/libhwui.a prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_static/libhwui.a
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/libhwui.so prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/libhwui.so
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/libhwui.a prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/libhwui.a
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/gen/proto prebuiltlibs/frameworks/base/libs/hwui/libhwui/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/base/core/jni/libandroid_runtime/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/core/jni/libandroid_runtime/android_x86_64_shared/libandroid_runtime.so prebuiltlibs/frameworks/base/core/jni/libandroid_runtime/android_x86_64_shared/libandroid_runtime.so
mkdir -p prebuiltlibs/frameworks/base/core/jni/libandroid_runtime/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/core/jni/libandroid_runtime/android_x86_x86_64_shared/libandroid_runtime.so prebuiltlibs/frameworks/base/core/jni/libandroid_runtime/android_x86_x86_64_shared/libandroid_runtime.so
mkdir -p prebuiltlibs/frameworks/base/core/jni/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/core/jni/ prebuiltlibs/frameworks/base/core/jni/
mkdir -p prebuiltlibs/frameworks/base/media/native/midi/libamidi/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/native/midi/libamidi/android_x86_64_shared/libamidi.so prebuiltlibs/frameworks/base/media/native/midi/libamidi/android_x86_64_shared/libamidi.so
mkdir -p prebuiltlibs/frameworks/base/media/native/midi/libamidi/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/native/midi/libamidi/android_x86_x86_64_shared/libamidi.so prebuiltlibs/frameworks/base/media/native/midi/libamidi/android_x86_x86_64_shared/libamidi.so
mkdir -p prebuiltlibs/frameworks/base/media/native/midi/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/media/native/midi/include/ prebuiltlibs/frameworks/base/media/native/midi/include
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared/libandroid.so prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared/libandroid.so
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_x86_64_shared/libandroid.so prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_x86_64_shared/libandroid.so
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared_current/libandroid.so prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared_current/libandroid.so
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_x86_64_shared_current/libandroid.so prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_x86_64_shared_current/libandroid.so
mkdir -p prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared_31/ && mv out/soong/.intermediates/frameworks/base/native/android/libandroid/android_x86_64_shared_31/libandroid.so prebuiltlibs/frameworks/base/native/android/libandroid/android_x86_64_shared_31/libandroid.so
mkdir -p prebuiltlibs/frameworks/base/native/android/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/native/android/include_platform/ prebuiltlibs/frameworks/base/native/android/include_platform
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_64_static/libfilterfw_jni.a prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_64_static/libfilterfw_jni.a
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_x86_64_static/libfilterfw_jni.a prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw_jni/android_x86_x86_64_static/libfilterfw_jni.a
mkdir -p prebuiltlibs/frameworks/base/cmds/hid/jni/libhidcommand_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/cmds/hid/jni/libhidcommand_jni/android_x86_64_shared/libhidcommand_jni.so prebuiltlibs/frameworks/base/cmds/hid/jni/libhidcommand_jni/android_x86_64_shared/libhidcommand_jni.so
mkdir -p prebuiltlibs/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_64_shared_apex29/libmediaparser-jni.so prebuiltlibs/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_64_shared_apex29/libmediaparser-jni.so
mkdir -p prebuiltlibs/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_x86_64_shared_apex29/libmediaparser-jni.so prebuiltlibs/frameworks/base/apex/media/framework/libmediaparser-jni/android_x86_x86_64_shared_apex29/libmediaparser-jni.so
mkdir -p prebuiltlibs/frameworks/base/cmds/uinput/jni/libuinputcommand_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/cmds/uinput/jni/libuinputcommand_jni/android_x86_64_shared/libuinputcommand_jni.so prebuiltlibs/frameworks/base/cmds/uinput/jni/libuinputcommand_jni/android_x86_64_shared/libuinputcommand_jni.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_64_shared/libaudioeffect_jni.so prebuiltlibs/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_64_shared/libaudioeffect_jni.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_x86_64_shared/libaudioeffect_jni.so prebuiltlibs/frameworks/base/media/jni/audioeffect/libaudioeffect_jni/android_x86_x86_64_shared/libaudioeffect_jni.so
mkdir -p prebuiltlibs/frameworks/base/drm/jni/libdrmframework_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/drm/jni/libdrmframework_jni/android_x86_64_shared/libdrmframework_jni.so prebuiltlibs/frameworks/base/drm/jni/libdrmframework_jni/android_x86_64_shared/libdrmframework_jni.so
mkdir -p prebuiltlibs/frameworks/base/drm/jni/libdrmframework_jni/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/drm/jni/libdrmframework_jni/android_x86_x86_64_shared/libdrmframework_jni.so prebuiltlibs/frameworks/base/drm/jni/libdrmframework_jni/android_x86_x86_64_shared/libdrmframework_jni.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_64_shared/libsoundpool.so prebuiltlibs/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_64_shared/libsoundpool.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_x86_64_shared/libsoundpool.so prebuiltlibs/frameworks/base/media/jni/soundpool/libsoundpool/android_x86_x86_64_shared/libsoundpool.so
mkdir -p prebuiltlibs/frameworks/base/libs/input/libinputservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/input/libinputservice/android_x86_64_shared/libinputservice.so prebuiltlibs/frameworks/base/libs/input/libinputservice/android_x86_64_shared/libinputservice.so
mkdir -p prebuiltlibs/frameworks/base/libs/input/libinputservice/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/libs/input/libinputservice/android_x86_x86_64_shared/libinputservice.so prebuiltlibs/frameworks/base/libs/input/libinputservice/android_x86_x86_64_shared/libinputservice.so
mkdir -p prebuiltlibs/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_64_shared/libjnigraphics.so prebuiltlibs/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_64_shared/libjnigraphics.so
mkdir -p prebuiltlibs/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_x86_64_shared/libjnigraphics.so prebuiltlibs/frameworks/base/native/graphics/jni/libjnigraphics/android_x86_x86_64_shared/libjnigraphics.so
mkdir -p prebuiltlibs/frameworks/base/cmds/bootanimation/libbootanimation/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/cmds/bootanimation/libbootanimation/android_x86_64_shared/libbootanimation.so prebuiltlibs/frameworks/base/cmds/bootanimation/libbootanimation/android_x86_64_shared/libbootanimation.so
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_64_shared/libfilterfw.so prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_64_shared/libfilterfw.so
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_x86_64_shared/libfilterfw.so prebuiltlibs/frameworks/base/media/mca/filterfw/libfilterfw/android_x86_x86_64_shared/libfilterfw.so
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_64_shared/libfilterpack_imageproc.so prebuiltlibs/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_64_shared/libfilterpack_imageproc.so
mkdir -p prebuiltlibs/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_x86_64_shared/libfilterpack_imageproc.so prebuiltlibs/frameworks/base/media/mca/filterpacks/libfilterpack_imageproc/android_x86_x86_64_shared/libfilterpack_imageproc.so
mkdir -p prebuiltlibs/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni/android_x86_64_shared/libprintspooler_jni.so prebuiltlibs/frameworks/base/packages/PrintSpooler/jni/libprintspooler_jni/android_x86_64_shared/libprintspooler_jni.so
mkdir -p prebuiltlibs/frameworks/base/cmds/screencap/screencap/android_x86_64/ && mv out/soong/.intermediates/frameworks/base/cmds/screencap/screencap/android_x86_64/screencap prebuiltlibs/frameworks/base/cmds/screencap/screencap/android_x86_64/screencap
mkdir -p prebuiltlibs/frameworks/base/media/jni/libmedia_jni/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni/android_x86_64_shared/libmedia_jni.so prebuiltlibs/frameworks/base/media/jni/libmedia_jni/android_x86_64_shared/libmedia_jni.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/libmedia_jni/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/media/jni/libmedia_jni/android_x86_x86_64_shared/libmedia_jni.so prebuiltlibs/frameworks/base/media/jni/libmedia_jni/android_x86_x86_64_shared/libmedia_jni.so
mkdir -p prebuiltlibs/frameworks/base/media/jni/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/media/jni/ prebuiltlibs/frameworks/base/media/jni/
mkdir -p prebuiltlibs/frameworks/base/services/core/jni/libservices.core/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/core/jni/libservices.core/android_x86_64_static/libservices.core.a prebuiltlibs/frameworks/base/services/core/jni/libservices.core/android_x86_64_static/libservices.core.a
mkdir -p prebuiltlibs/frameworks/base/services/core/jni/libservices.core/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/core/jni/libservices.core/android_x86_x86_64_static/libservices.core.a prebuiltlibs/frameworks/base/services/core/jni/libservices.core/android_x86_x86_64_static/libservices.core.a
mkdir -p prebuiltlibs/frameworks/base/services/libandroid_servers/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/libandroid_servers/android_x86_64_shared/libandroid_servers.so prebuiltlibs/frameworks/base/services/libandroid_servers/android_x86_64_shared/libandroid_servers.so
mkdir -p prebuiltlibs/frameworks/base/services/libandroid_servers/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/libandroid_servers/android_x86_x86_64_shared/libandroid_servers.so prebuiltlibs/frameworks/base/services/libandroid_servers/android_x86_x86_64_shared/libandroid_servers.so
mkdir -p prebuiltlibs/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_64_shared/libwebviewchromium_plat_support.so prebuiltlibs/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_64_shared/libwebviewchromium_plat_support.so
mkdir -p prebuiltlibs/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_x86_64_shared/libwebviewchromium_plat_support.so prebuiltlibs/frameworks/base/native/webview/plat_support/libwebviewchromium_plat_support/android_x86_x86_64_shared/libwebviewchromium_plat_support.so

printf "cc_prebuilt_library {\n  name: \"libhwui\",\n  shared_libs: [\"libbase\",\"libharfbuzz_ng\",\"libminikin\",\"libcutils\",\"liblog\",\"libpng\",\"libz\",\"libdng_sdk\",\"libjpeg\",\"libpiex\",\"libexpat\",\"libft2\"],\n  static_libs: [\"libui-types\",\"libarect\",\"libwebp-decode\",\"libwebp-encode\",\"libsfntly\",\"libnativehelper_lazy\",\"libziparchive_for_incfs\"],\n  target: {\n    android: {\n      shared_libs: [\"liblog\",\"libcutils\",\"libutils\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libGLESv3\",\"libvulkan\",\"libnativedisplay\",\"libnativewindow\",\"libprotobuf-cpp-lite\",\"libft2\",\"libandroidfw\",\"libcrypto\",\"libsync\",\"libheif\",\"libbinder\",\"libbinder_ndk\",\"libmediandk\",\"libpdfium\"],\n      static_libs: [\"libEGL_blobCache\",\"libprotoutil\",\"libstatslog_hwui\",\"libstatspull_lazy\",\"libstatssocket_lazy\",\"libgif\"],\n      export_shared_lib_headers: [\"libvulkan\"],\n      lto: {\n        thin: true,\n      },\n      header_libs: [\"libandroid_headers_private\"],\n      version_script: \"libhwui.map.txt\",\n    },\n    host: {\n      static_libs: [\"libandroidfw\",\"libutils\"],\n      export_static_lib_headers: [\"libarect\"],\n    },\n    darwin: {\n    },\n    windows: {\n    },\n  },\n  group_static_libs: true,\n  pgo: {\n    instrumentation: true,\n    profile_file: \"hwui/hwui.profdata\",\n    benchmarks: [\"hwui\"],\n    enable_profile_use: true,\n  },\n  whole_static_libs: [\"libskia\"],\n  header_libs: [\"android_graphics_apex_headers\"],\n  arch: {\n    arm64: {\n    },\n    x86_64: {\n    },\n  },\n  host_supported: true,\n  export_header_lib_headers: [\"android_graphics_apex_headers\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libhwui.a\"],\n  },\n  shared: {\n    srcs: [\"libhwui.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/libs/hwui/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libandroid_runtime\",\n  host_supported: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"libharfbuzz_ng\",\"libhwui\",\"liblog\",\"libminikin\",\"libz\"],\n  static_libs: [\"libnativehelper_lazy\",\"libziparchive_for_incfs\"],\n  export_include_dirs: [\".\",\"include\"],\n  target: {\n    android: {\n      static_libs: [\"libasync_safe\",\"libbinderthreadstateutils\",\"libdmabufinfo\",\"libgif\",\"libseccomp_policy\",\"libgrallocusage\",\"libscrypt_static\",\"libstatssocket_lazy\"],\n      shared_libs: [\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"av-types-aidl-cpp\",\"android.hardware.camera.device@3.2\",\"libandroidicu\",\"libbpf_android\",\"libnetdbpf\",\"libnetdutils\",\"libmemtrack\",\"libandroidfw\",\"libappfuse\",\"libcrypto\",\"libcutils\",\"libdebuggerd_client\",\"libutils\",\"libbinder\",\"libui\",\"libgraphicsenv\",\"libgui\",\"libmediandk\",\"libpermission\",\"libsensor\",\"libinput\",\"libcamera_client\",\"libcamera_metadata\",\"libsqlite\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libGLESv3\",\"libincfs\",\"libdataloader\",\"libvulkan\",\"libETC1\",\"libjpeg\",\"libhardware\",\"libhardware_legacy\",\"libselinux\",\"libmedia\",\"libmedia_helper\",\"libmediametrics\",\"libmeminfo\",\"libaudioclient\",\"libaudiofoundation\",\"libaudiopolicy\",\"libusbhost\",\"libpdfium\",\"libimg_utils\",\"libnetd_client\",\"libprocessgroup\",\"libnativebridge_lazy\",\"libnativeloader_lazy\",\"libmemunreachable\",\"libhidlbase\",\"libvintf\",\"libnativedisplay\",\"libnativewindow\",\"libdl\",\"libdl_android\",\"libtimeinstate\",\"server_configurable_flags\"],\n      export_shared_lib_headers: [\"libnativewindow\"],\n      export_static_lib_headers: [\"libnativehelper_lazy\"],\n      header_libs: [\"bionic_libc_platform_headers\",\"dnsproxyd_protocol_headers\"],\n    },\n    host: {\n      shared_libs: [\"libicui18n\",\"libicuuc\"],\n      static_libs: [\"libandroidfw\",\"libcompiler_rt\",\"libutils\",\"libhostgraphics\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libinput\",\"libbinderthreadstateutils\",\"libsqlite\"],\n      shared_libs: [\"libbinder\",\"libhidlbase\"],\n    },\n  },\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroid_runtime.so\"],\n}\n" >> prebuiltlibs/frameworks/base/core/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libamidi\",\n  shared_libs: [\"liblog\",\"libbinder\",\"libutils\",\"libandroid_runtime\"],\n  version_script: \"libamidi.map.txt\",\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libamidi.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/native/midi/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libandroid\",\n  shared_libs: [\"liblog\",\"libhidlbase\",\"libcutils\",\"libandroidfw\",\"libinput\",\"libutils\",\"libbinder\",\"libui\",\"libgui\",\"libharfbuzz_ng\",\"libsensor\",\"libactivitymanager_aidl\",\"libandroid_runtime\",\"libminikin\",\"libnetd_client\",\"libhwui\",\"libxml2\",\"libEGL\",\"libGLESv2\",\"libpowermanager\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore-utils\",\"libnativedisplay\"],\n  static_libs: [\"libstorage\",\"libarect\"],\n  whole_static_libs: [\"libnativewindow\"],\n  export_static_lib_headers: [\"libarect\"],\n  export_include_dirs: [\"include_platform\"],\n  version_script: \"libandroid.map.txt\",\n  stubs: {\n    symbol_file: \"libandroid.map.txt\",\n    versions: [\"29\",\"31\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroid.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/android/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libfilterfw_jni\",\n  shared_libs: [\"libmedia\",\"libgui\",\"libandroid\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfilterfw_jni.a\"],\n}\n" >> prebuiltlibs/frameworks/base/media/mca/filterfw/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libhidcommand_jni\",\n  shared_libs: [\"libandroid\",\"libbase\",\"liblog\",\"libnativehelper\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhidcommand_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/hid/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediaparser-jni\",\n  shared_libs: [\"libandroid\",\"liblog\",\"libmediametrics\"],\n  apex_available: [\"com.android.media\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediaparser-jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/apex/media/framework/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libuinputcommand_jni\",\n  shared_libs: [\"libandroid\",\"libandroid_runtime_lazy\",\"libbase\",\"libbinder\",\"liblog\",\"libnativehelper\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libuinputcommand_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/uinput/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudioeffect_jni\",\n  shared_libs: [\"framework-permission-aidl-cpp\",\"liblog\",\"libcutils\",\"libutils\",\"libandroid_runtime\",\"libnativehelper\",\"libaudioclient\",\"libaudioutils\",\"libaudiofoundation\",\"libbinder\"],\n  export_shared_lib_headers: [\"framework-permission-aidl-cpp\"],\n  version_script: \"exports.lds\",\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioeffect_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/jni/audioeffect/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libdrmframework_jni\",\n  shared_libs: [\"libdrmframework\",\"libdrmframeworkcommon\",\"liblog\",\"libutils\",\"libandroid_runtime\",\"libnativehelper\",\"libbinder\",\"libdl\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdrmframework_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/drm/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libsoundpool\",\n  shared_libs: [\"framework-permission-aidl-cpp\",\"libaudioutils\",\"liblog\",\"libcutils\",\"libutils\",\"libandroid_runtime\",\"libnativehelper\",\"libaudioclient\",\"libmediandk\",\"libbinder\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsoundpool.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/jni/soundpool/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libinputservice\",\n  shared_libs: [\"libandroid_runtime\",\"libbinder\",\"libcutils\",\"libhwui\",\"liblog\",\"libutils\",\"libgui\",\"libui\",\"libinput\",\"libnativewindow\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinputservice.so\"],\n}\n" >> prebuiltlibs/frameworks/base/libs/input/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libjnigraphics\",\n  shared_libs: [\"libhwui\",\"liblog\"],\n  static_libs: [\"libarect\"],\n  arch: {\n    arm: {\n      pack_relocations: false,\n    },\n  },\n  host_supported: true,\n  target: {\n    android: {\n      shared_libs: [\"libandroid\"],\n      version_script: \"libjnigraphics.map.txt\",\n    },\n    host: {\n      header_libs: [\"libnativewindow_headers\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libjnigraphics.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/graphics/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libbootanimation\",\n  shared_libs: [\"libandroidfw\",\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libui\",\"libjnigraphics\",\"libEGL\",\"libGLESv2\",\"libgui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbootanimation.so\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/bootanimation/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libfilterfw\",\n  whole_static_libs: [\"libfilterfw_jni\",\"libfilterfw_native\"],\n  shared_libs: [\"libGLESv2\",\"libEGL\",\"libgui\",\"libdl\",\"libcutils\",\"libutils\",\"liblog\",\"libandroid\",\"libjnigraphics\",\"libmedia\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfilterfw.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/mca/filterfw/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libfilterpack_imageproc\",\n  shared_libs: [\"liblog\",\"libutils\",\"libfilterfw\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfilterpack_imageproc.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/mca/filterpacks/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libprintspooler_jni\",\n  shared_libs: [\"libnativehelper\",\"libjnigraphics\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libprintspooler_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/packages/PrintSpooler/jni/Android.bp
printf "cc_prebuilt_binary {\n  name: \"screencap\",\n  shared_libs: [\"libcutils\",\"libutils\",\"libbinder\",\"libjnigraphics\",\"libui\",\"libgui\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"screencap\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/screencap/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_jni\",\n  shared_libs: [\"libbase\",\"liblog\",\"libcodec2\",\"libcodec2_vndk\",\"libutils\",\"libcutils\",\"audioclient-types-aidl-cpp\",\"av-types-aidl-cpp\",\"framework-permission-aidl-cpp\",\"libandroid_runtime\",\"libaudioclient\",\"libnativehelper\",\"libnativewindow\",\"libbinder\",\"libmedia\",\"libmedia_codeclist\",\"libmedia_jni_utils\",\"libmedia_omx\",\"libmediametrics\",\"libmediadrm\",\"libmediadrmmetrics_consumer\",\"libhwui\",\"libui\",\"libgui\",\"libstagefright\",\"libstagefright_foundation\",\"libcamera_client\",\"libmtp\",\"libpiex\",\"libprocessgroup\",\"libandroidfw\",\"libhidlallocatorutils\",\"libhidlbase\",\"libsonivox\",\"android.hardware.cas@1.0\",\"android.hardware.cas.native@1.0\",\"android.hardware.drm@1.3\",\"android.hardware.drm@1.4\",\"android.hidl.memory@1.0\",\"android.hidl.token@1.0-utils\"],\n  min_sdk_version: \"\",\n  static_libs: [\"libgrallocusage\",\"libmedia_midiiowrapper\"],\n  export_include_dirs: [\".\"],\n  export_shared_lib_headers: [\"libpiex\"],\n  lto: {\n    never: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_jni.so\"],\n}\n" >> prebuiltlibs/frameworks/base/media/jni/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libservices.core\",\n  shared_libs: [\"libadb_pairing_server\",\"libadb_pairing_connection\",\"libandroid\",\"libandroid_runtime\",\"libandroidfw\",\"libaudioclient\",\"libbase\",\"libappfuse\",\"libbinder_ndk\",\"libbinder\",\"libcutils\",\"libcrypto\",\"liblog\",\"libgraphicsenv\",\"libhardware\",\"libhardware_legacy\",\"libhidlbase\",\"libmeminfo\",\"libmemtrackproxy\",\"libmtp\",\"libnativehelper\",\"libnativewindow\",\"libpowermanager\",\"libprocessgroup\",\"libutils\",\"libui\",\"libvibratorservice\",\"libinput\",\"libinputflinger\",\"libinputflinger_base\",\"libinputservice\",\"libstatshidl\",\"libstatspull\",\"libstatssocket\",\"libstatslog\",\"libschedulerservicehidl\",\"libsensorservice\",\"libsensorservicehidl\",\"libgui\",\"libtimestats_atoms_proto\",\"libusbhost\",\"libtinyalsa\",\"libEGL\",\"libGLESv2\",\"libnetutils\",\"libhwui\",\"libbpf_android\",\"libnetdbpf\",\"libnetdutils\",\"libpsi\",\"libdataloader\",\"libincfs\",\"android.hardware.audio.common@2.0\",\"android.hardware.broadcastradio@1.0\",\"android.hardware.broadcastradio@1.1\",\"android.hardware.contexthub@1.0\",\"android.hardware.gnss-V1-cpp\",\"android.hardware.gnss@1.0\",\"android.hardware.gnss@1.1\",\"android.hardware.gnss@2.0\",\"android.hardware.gnss@2.1\",\"android.hardware.gnss.measurement_corrections@1.0\",\"android.hardware.gnss.visibility_control@1.0\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.input.classifier@1.0\",\"android.hardware.ir@1.0\",\"android.hardware.light@2.0\",\"android.hardware.memtrack-V1-ndk_platform\",\"android.hardware.power@1.0\",\"android.hardware.power@1.1\",\"android.hardware.power-V2-cpp\",\"android.hardware.power.stats@1.0\",\"android.hardware.power.stats-V1-ndk_platform\",\"android.hardware.thermal@1.0\",\"android.hardware.tv.input@1.0\",\"android.hardware.vibrator-V2-cpp\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"android.hardware.vr@1.0\",\"android.hidl.token@1.0-utils\",\"android.frameworks.schedulerservice@1.0\",\"android.frameworks.sensorservice@1.0\",\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\",\"android.system.suspend.control-V1-cpp\",\"android.system.suspend.control.internal-cpp\",\"android.system.suspend@1.0\",\"service.incremental\"],\n  static_libs: [\"android.hardware.broadcastradio@common-utils-1x-lib\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libservices.core.a\"],\n}\n" >> prebuiltlibs/frameworks/base/services/core/jni/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libandroid_servers\",\n  shared_libs: [\"libadb_pairing_server\",\"libadb_pairing_connection\",\"libandroid\",\"libandroid_runtime\",\"libandroidfw\",\"libaudioclient\",\"libbase\",\"libappfuse\",\"libbinder_ndk\",\"libbinder\",\"libcutils\",\"libcrypto\",\"liblog\",\"libgraphicsenv\",\"libhardware\",\"libhardware_legacy\",\"libhidlbase\",\"libmeminfo\",\"libmemtrackproxy\",\"libmtp\",\"libnativehelper\",\"libnativewindow\",\"libpowermanager\",\"libprocessgroup\",\"libutils\",\"libui\",\"libvibratorservice\",\"libinput\",\"libinputflinger\",\"libinputflinger_base\",\"libinputservice\",\"libstatshidl\",\"libstatspull\",\"libstatssocket\",\"libstatslog\",\"libschedulerservicehidl\",\"libsensorservice\",\"libsensorservicehidl\",\"libgui\",\"libtimestats_atoms_proto\",\"libusbhost\",\"libtinyalsa\",\"libEGL\",\"libGLESv2\",\"libnetutils\",\"libhwui\",\"libbpf_android\",\"libnetdbpf\",\"libnetdutils\",\"libpsi\",\"libdataloader\",\"libincfs\",\"android.hardware.audio.common@2.0\",\"android.hardware.broadcastradio@1.0\",\"android.hardware.broadcastradio@1.1\",\"android.hardware.contexthub@1.0\",\"android.hardware.gnss-V1-cpp\",\"android.hardware.gnss@1.0\",\"android.hardware.gnss@1.1\",\"android.hardware.gnss@2.0\",\"android.hardware.gnss@2.1\",\"android.hardware.gnss.measurement_corrections@1.0\",\"android.hardware.gnss.visibility_control@1.0\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hardware.input.classifier@1.0\",\"android.hardware.ir@1.0\",\"android.hardware.light@2.0\",\"android.hardware.memtrack-V1-ndk_platform\",\"android.hardware.power@1.0\",\"android.hardware.power@1.1\",\"android.hardware.power-V2-cpp\",\"android.hardware.power.stats@1.0\",\"android.hardware.power.stats-V1-ndk_platform\",\"android.hardware.thermal@1.0\",\"android.hardware.tv.input@1.0\",\"android.hardware.vibrator-V2-cpp\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"android.hardware.vr@1.0\",\"android.hidl.token@1.0-utils\",\"android.frameworks.schedulerservice@1.0\",\"android.frameworks.sensorservice@1.0\",\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\",\"android.system.suspend.control-V1-cpp\",\"android.system.suspend.control.internal-cpp\",\"android.system.suspend@1.0\",\"service.incremental\"],\n  static_libs: [\"android.hardware.broadcastradio@common-utils-1x-lib\"],\n  whole_static_libs: [\"libservices.core\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libandroid_servers.so\"],\n}\n" >> prebuiltlibs/frameworks/base/services/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libwebviewchromium_plat_support\",\n  shared_libs: [\"libandroidfw\",\"libcutils\",\"libhwui\",\"liblog\",\"libnativehelper\",\"libui\",\"libutils\",\"libvulkan\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwebviewchromium_plat_support.so\"],\n}\n" >> prebuiltlibs/frameworks/base/native/webview/plat_support/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-14
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-14.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-14.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/rs/libRS_internal/android_vendor.31_x86_64_shared/libRS_internal.so \
  out/soong/.intermediates/frameworks/rs/libRS_internal/android_vendor.31_x86_x86_64_shared/libRS_internal.so \
  out/soong/.intermediates/frameworks/rs/libRS_internal/android_x86_64_shared/libRS_internal.so \
  out/soong/.intermediates/frameworks/rs/libRS_internal/android_x86_x86_64_shared/libRS_internal.so \
  out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_64_shared/libRSCpuRef.so \
  out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_x86_64_shared/libRSCpuRef.so \
  out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_64_shared/libRSCpuRef.so \
  out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_x86_64_shared/libRSCpuRef.so \
  out/soong/.intermediates/frameworks/rs/libRSDriver/android_vendor.31_x86_64_shared/libRSDriver.so \
  out/soong/.intermediates/frameworks/rs/libRSDriver/android_vendor.31_x86_x86_64_shared/libRSDriver.so \
  out/soong/.intermediates/frameworks/rs/libRSDriver/android_x86_64_shared/libRSDriver.so \
  out/soong/.intermediates/frameworks/rs/libRSDriver/android_x86_x86_64_shared/libRSDriver.so \
  

mkdir -p prebuiltlibs/frameworks/rs/libRS_internal/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRS_internal/android_vendor.31_x86_64_shared/libRS_internal.so prebuiltlibs/frameworks/rs/libRS_internal/android_vendor.31_x86_64_shared/libRS_internal.so
mkdir -p prebuiltlibs/frameworks/rs/libRS_internal/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRS_internal/android_vendor.31_x86_x86_64_shared/libRS_internal.so prebuiltlibs/frameworks/rs/libRS_internal/android_vendor.31_x86_x86_64_shared/libRS_internal.so
mkdir -p prebuiltlibs/frameworks/rs/libRS_internal/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRS_internal/android_x86_64_shared/libRS_internal.so prebuiltlibs/frameworks/rs/libRS_internal/android_x86_64_shared/libRS_internal.so
mkdir -p prebuiltlibs/frameworks/rs/libRS_internal/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRS_internal/android_x86_x86_64_shared/libRS_internal.so prebuiltlibs/frameworks/rs/libRS_internal/android_x86_x86_64_shared/libRS_internal.so
mkdir -p prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_64_shared/libRSCpuRef.so prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_64_shared/libRSCpuRef.so
mkdir -p prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_x86_64_shared/libRSCpuRef.so prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_vendor.31_x86_x86_64_shared/libRSCpuRef.so
mkdir -p prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_64_shared/libRSCpuRef.so prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_64_shared/libRSCpuRef.so
mkdir -p prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_x86_64_shared/libRSCpuRef.so prebuiltlibs/frameworks/rs/cpu_ref/libRSCpuRef/android_x86_x86_64_shared/libRSCpuRef.so
mkdir -p prebuiltlibs/frameworks/rs/libRSDriver/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSDriver/android_vendor.31_x86_64_shared/libRSDriver.so prebuiltlibs/frameworks/rs/libRSDriver/android_vendor.31_x86_64_shared/libRSDriver.so
mkdir -p prebuiltlibs/frameworks/rs/libRSDriver/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSDriver/android_vendor.31_x86_x86_64_shared/libRSDriver.so prebuiltlibs/frameworks/rs/libRSDriver/android_vendor.31_x86_x86_64_shared/libRSDriver.so
mkdir -p prebuiltlibs/frameworks/rs/libRSDriver/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSDriver/android_x86_64_shared/libRSDriver.so prebuiltlibs/frameworks/rs/libRSDriver/android_x86_64_shared/libRSDriver.so
mkdir -p prebuiltlibs/frameworks/rs/libRSDriver/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/rs/libRSDriver/android_x86_x86_64_shared/libRSDriver.so prebuiltlibs/frameworks/rs/libRSDriver/android_x86_x86_64_shared/libRSDriver.so

printf "cc_prebuilt_library_shared {\n  name: \"libRS_internal\",\n  vendor_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  shared_libs: [\"liblog\",\"libutilscallstack\",\"libutils\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libdl\",\"libnativewindow\",\"libft2\",\"libbcinfo\",\"libmediandk\"],\n  static_libs: [\"libarect\"],\n  required: [\"libclcore.bc\",\"libclcore_debug.bc\",\"libclcore_debug_g.bc\",\"libclcore_g.bc\",\"libcompiler_rt\"],\n  arch: {\n    x86: {\n      required: [\"libclcore_x86.bc\"],\n    },\n    x86_64: {\n      required: [\"libclcore_x86.bc\"],\n    },\n    arm: {\n      neon: {\n        required: [\"libclcore_neon.bc\"],\n      },\n    },\n  },\n  target: {\n    native_bridge: {\n      header_libs: [\"libnativewindow_headers\",\"media_ndk_headers\"],\n      shared_libs: [\"libnative_bridge_guest_libEGL\",\"libnative_bridge_guest_libGLESv1_CM\",\"libnative_bridge_guest_libGLESv2\",\"libnative_bridge_guest_libmediandk\",\"libnative_bridge_guest_libnativewindow\"],\n      exclude_shared_libs: [\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libmediandk\",\"libnativewindow\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRS_internal.so\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libRSCpuRef\",\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  target: {\n    android_x86: {\n    },\n    android_x86_64: {\n    },\n    arm_on_x86: {\n    },\n    arm_on_x86_64: {\n    },\n  },\n  vendor_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  shared_libs: [\"libRS_internal\",\"libc++\",\"liblog\",\"libz\",\"libbcinfo\",\"libblas\"],\n  static_libs: [\"libbnnmlowp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRSCpuRef.so\"],\n}\n" >> prebuiltlibs/frameworks/rs/cpu_ref/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libRSDriver\",\n  vendor_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  shared_libs: [\"libRS_internal\",\"libRSCpuRef\",\"liblog\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libnativewindow\",\"libbcinfo\"],\n  static_libs: [\"libarect\"],\n  arch: {\n    x86: {\n      sanitize: {\n        never: true,\n      },\n    },\n  },\n  target: {\n    native_bridge: {\n      header_libs: [\"libnativewindow_headers\",\"media_ndk_headers\"],\n      shared_libs: [\"libnative_bridge_guest_libEGL\",\"libnative_bridge_guest_libGLESv1_CM\",\"libnative_bridge_guest_libGLESv2\",\"libnative_bridge_guest_libnativewindow\"],\n      exclude_shared_libs: [\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libnativewindow\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libRSDriver.so\"],\n}\n" >> prebuiltlibs/frameworks/rs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/rs/ninja && rsync -ar out/soong/ninja/frameworks/rs/ prebuiltlibs/frameworks/rs/ninja/frameworks_rs-14
touch prebuiltlibs/frameworks/rs/ninja/.find-ignore
tar cfJ frameworks_rs-14.tar.xz -C prebuiltlibs/frameworks/rs/ .
ls -l frameworks_rs-14.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a \
  out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a \
  out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_vendor.31_x86_64_static/libneuralnetworks_common.a \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-all \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-fast \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-slow \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-minimal \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-quant \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-all \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-fast \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-slow \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-minimal \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-quant \
  out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so \
  out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so \
  out/soong/.intermediates/packages/modules/NeuralNetworks/shim_and_sl/libneuralnetworks_shim_static/android_vendor.31_x86_64_static/libneuralnetworks_shim_static.a \
  out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample/android_vendor.31_x86_64/android.hardware.neuralnetworks-shim-service-sample \
  

mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_x86_x86_64_static_com.android.neuralnetworks/libneuralnetworks_common.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_vendor.31_x86_64_static/libneuralnetworks_common.a prebuiltlibs/packages/modules/NeuralNetworks/common/libneuralnetworks_common/android_vendor.31_x86_64_static/libneuralnetworks_common.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/common/include/ prebuiltlibs/packages/modules/NeuralNetworks/common/include
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-all prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-all
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-fast prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-fast
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-slow prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-float-slow
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-minimal prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-minimal
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-quant prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/android.hardware.neuralnetworks-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks-service-sample-quant
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-all prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-all/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-all
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-fast prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-fast/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-fast
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-slow prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-float-slow/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-float-slow
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-minimal prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-minimal/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-minimal
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-quant prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/android.hardware.neuralnetworks@1.3-service-sample-quant/android_vendor.31_x86_64/android.hardware.neuralnetworks@1.3-service-sample-quant
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_64_shared_com.android.neuralnetworks/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_x86_64_shared_com.android.neuralnetworks/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so prebuiltlibs/packages/modules/NeuralNetworks/runtime/libneuralnetworks/android_x86_x86_64_shared_com.android.neuralnetworks/libneuralnetworks.so
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/libneuralnetworks_shim_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/shim_and_sl/libneuralnetworks_shim_static/android_vendor.31_x86_64_static/libneuralnetworks_shim_static.a prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/libneuralnetworks_shim_static/android_vendor.31_x86_64_static/libneuralnetworks_shim_static.a
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/public
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" packages/modules/NeuralNetworks/shim_and_sl/public/ prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/public
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample/android_vendor.31_x86_64/ && mv out/soong/.intermediates/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample/android_vendor.31_x86_64/android.hardware.neuralnetworks-shim-service-sample prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_shim/android.hardware.neuralnetworks-shim-service-sample/android_vendor.31_x86_64/android.hardware.neuralnetworks-shim-service-sample

printf "cc_prebuilt_library_static {\n  name: \"libneuralnetworks_common\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  host_supported: false,\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libutils\"],\n  whole_static_libs: [\"libarect\",\"libtflite_kernel_utils\",\"neuralnetworks_types\",\"neuralnetworks_utils_hal_1_0\",\"neuralnetworks_utils_hal_1_1\",\"neuralnetworks_utils_hal_1_2\",\"neuralnetworks_utils_hal_1_3\",\"neuralnetworks_utils_hal_aidl\",\"neuralnetworks_utils_hal_common\",\"neuralnetworks_utils_hal_service\",\"philox_random\"],\n  static_libs: [\"libcrypto_static\",\"libruy_static\",\"libtextclassifier_hash_static\"],\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libneuralnetworks_common.a\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/common/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-service-sample-all\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-service-sample-all.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-service-sample-all.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-service-sample-all\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-service-sample-float-fast\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-service-sample-float-fast.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-service-sample-float-fast.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-service-sample-float-fast\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-service-sample-float-slow\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-service-sample-float-slow.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-service-sample-float-slow.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-service-sample-float-slow\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-service-sample-minimal\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-service-sample-minimal.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-service-sample-minimal.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-service-sample-minimal\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-service-sample-quant\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libbinder_ndk\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-service-sample-quant.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-service-sample-quant.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-service-sample-quant\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks@1.3-service-sample-all\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks@1.3-service-sample-all.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks@1.3-service-sample-all.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks@1.3-service-sample-all\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks@1.3-service-sample-float-fast\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks@1.3-service-sample-float-fast.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks@1.3-service-sample-float-fast.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks@1.3-service-sample-float-fast\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks@1.3-service-sample-float-slow\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks@1.3-service-sample-float-slow.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks@1.3-service-sample-float-slow.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks@1.3-service-sample-float-slow\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks@1.3-service-sample-minimal\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks@1.3-service-sample-minimal.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks@1.3-service-sample-minimal.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks@1.3-service-sample-minimal\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks@1.3-service-sample-quant\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libbase\",\"libcutils\",\"libdl\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libtextclassifier_hash\",\"libutils\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks@1.3-service-sample-quant.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks@1.3-service-sample-quant.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks@1.3-service-sample-quant\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libneuralnetworks\",\n  host_supported: false,\n  use_version_lib: true,\n  target: {\n    android: {\n      version_script: \"libneuralnetworks.map.txt\",\n      shared_libs: [\"liblog\",\"libnativewindow\",\"libneuralnetworks_packageinfo\"],\n    },\n    host: {\n      shared_libs: [],\n    },\n  },\n  static_libs: [\"android.hardware.common-V2-ndk_platform\",\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"libaidlcommonsupport\",\"libbase\",\"libcrypto_static\",\"libcutils\",\"libfmq\",\"libhidlbase\",\"libhidlmemory\",\"libjsoncpp\",\"libmath\",\"libneuralnetworks_common\",\"libprocessgroup\",\"libtextclassifier_hash_static\",\"libutils\",\"neuralnetworks_types\"],\n  stl: \"libc++_static\",\n  whole_static_libs: [\"libprocpartition\"],\n  shared_libs: [\"libbinder_ndk\",\"libcgrouprc\",\"libvndksupport\"],\n  header_libs: [\"libneuralnetworks_headers\"],\n  export_header_lib_headers: [\"libneuralnetworks_headers\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  llndk: {\n    symbol_file: \"libneuralnetworks.map.txt\",\n    override_export_include_dirs: [\"include\"],\n  },\n  apex_available: [\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  stubs: {\n    versions: [\"30\",\"31\"],\n    symbol_file: \"libneuralnetworks.map.txt\",\n  },\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libneuralnetworks.so\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/runtime/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libneuralnetworks_shim_static\",\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  licenses: [\"Android-Apache-2.0\"],\n  vendor_available: true,\n  min_sdk_version: \"30\",\n  static_libs: [\"android.hardware.common-V2-ndk_platform\",\"android.hardware.neuralnetworks-V1-ndk_platform\",\"libaidlcommonsupport\",\"libarect\",\"libcutils\",\"libneuralnetworks_common\",\"neuralnetworks_supportlibrary_loader\",\"neuralnetworks_utils_hal_aidl\",\"neuralnetworks_utils_hal_common\"],\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\"],\n  export_include_dirs: [\"public\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libneuralnetworks_shim_static.a\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/shim_and_sl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.neuralnetworks-shim-service-sample\",\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libnativewindow\",\"libutils\",\"neuralnetworks_sample_sl_driver_prebuilt\"],\n  relative_install_path: \"hw\",\n  proprietary: true,\n  init_rc: [\"config/android.hardware.neuralnetworks-shim-service-sample.rc\"],\n  vintf_fragments: [\"config/android.hardware.neuralnetworks-shim-service-sample.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.neuralnetworks-shim-service-sample\"],\n}\n" >> prebuiltlibs/packages/modules/NeuralNetworks/driver/sample_shim/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/NeuralNetworks/ninja && rsync -ar out/soong/ninja/packages/modules/NeuralNetworks/ prebuiltlibs/packages/modules/NeuralNetworks/ninja/packages_modules_NeuralNetworks-14
touch prebuiltlibs/packages/modules/NeuralNetworks/ninja/.find-ignore
tar cfJ packages_modules_NeuralNetworks-14.tar.xz -C prebuiltlibs/packages/modules/NeuralNetworks/ .
ls -l packages_modules_NeuralNetworks-14.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
