source $GITHUB_WORKSPACE/envsetup.sh
df -h

sed -i 's/libLLVM_android.so"],$/libLLVM_android.so"],}, android_x86_64: { srcs: ["libLLVM_android.so"], }, android_x86: { srcs: ["libLLVM_android.so"],/g' prebuilts/sdk/tools/Android.bp
sed -i 's/name: "libLLVM_android",$/name: "libLLVM_android", device_supported: true, prefer: true,/g' prebuilts/sdk/tools/Android.bp
mv prebuiltlibs/external/llvm/libLLVM_android/android_x86_64_shared/libLLVM_android.so prebuilts/sdk/tools/
GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

rm -rf prebuiltlibs/external/llvm/lib/TableGen/libLLVMTableGen
rm -rf prebuiltlibs/external/llvm/utils/TableGen/llvm-tblgen
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
rm -rf prebuiltlibs/external/llvm/lib/Bitcode/Writer/libLLVMBitWriter
rm -rf prebuiltlibs/external/llvm/lib/CodeGen/libLLVMCodeGen
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
rm -rf prebuiltlibs/external/llvm/lib/MC/MCDisassembler/libLLVMMCDisassembler
rm -rf prebuiltlibs/external/llvm/lib/ExecutionEngine/MCJIT/libLLVMMCJIT
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

rm -rf prebuiltlibs/external/swiftshader/third_party/llvm-10.0/libLLVM10_swiftshader
rm -rf prebuiltlibs/external/swiftshader/third_party/marl/swiftshader_marl
rm -rf prebuiltlibs/external/swiftshader/third_party/SPIRV-Tools/swiftshader_spirv-tools
rm -rf prebuiltlibs/external/swiftshader/src/swiftshader_debug
rm -rf prebuiltlibs/external/swiftshader/third_party/astc-encoder/swiftshader_astc
rm -rf prebuiltlibs/external/swiftshader/src/libswiftshadervk_llvm_debug

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/perfetto/heapprofd/android_x86_64/heapprofd \
  out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so \
  out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so \
  out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so \
  out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so \
  out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so \
  out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so \
  out/soong/.intermediates/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so \
  out/soong/.intermediates/external/perfetto/traced_perf/android_x86_64/traced_perf \
  

mkdir -p prebuiltlibs/external/perfetto/heapprofd/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/heapprofd/android_x86_64/heapprofd prebuiltlibs/external/perfetto/heapprofd/android_x86_64/heapprofd
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared_current/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared_current/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_64_shared/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so prebuiltlibs/external/perfetto/heapprofd_client_api/android_x86_x86_64_shared/heapprofd_client_api.so
mkdir -p prebuiltlibs/external/perfetto/src/profiling/memory/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/src/profiling/memory/include/ prebuiltlibs/external/perfetto/src/profiling/memory/include
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so prebuiltlibs/external/perfetto/heapprofd_client/android_x86_64_shared/heapprofd_client.so
mkdir -p prebuiltlibs/external/perfetto/heapprofd_client/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so prebuiltlibs/external/perfetto/heapprofd_client/android_x86_x86_64_shared/heapprofd_client.so
mkdir -p prebuiltlibs/external/perfetto/libperfetto_android_internal/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so prebuiltlibs/external/perfetto/libperfetto_android_internal/android_x86_64_shared/libperfetto_android_internal.so
mkdir -p prebuiltlibs/external/perfetto/traced_perf/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/traced_perf/android_x86_64/traced_perf prebuiltlibs/external/perfetto/traced_perf/android_x86_64/traced_perf

printf "cc_prebuilt_binary {\n  name: \"heapprofd\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  init_rc: [\"heapprofd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"heapprofd_client_api\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"libprocinfo\",\"libunwindstack\"],\n  static_libs: [\"libasync_safe\"],\n  export_include_dirs: [\"src/profiling/memory/include\"],\n  version_script: \"src/profiling/memory/heapprofd_client_api.map.txt\",\n  stubs: {\n    versions: [\"S\"],\n    symbol_file: \"src/profiling/memory/heapprofd_client_api.map.txt\",\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd_client_api.so\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"heapprofd_client\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"heapprofd_client_api\"],\n  static_libs: [\"libasync_safe\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"heapprofd_client.so\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libperfetto_android_internal\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"android.hardware.atrace@1.0\",\"android.hardware.health@2.0\",\"android.hardware.power.stats-V1-cpp\",\"android.hardware.power.stats@1.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"libincident\",\"liblog\",\"libservices\",\"libstatssocket\",\"libtracingproxy\",\"libutils\"],\n  static_libs: [\"libhealthhalutils\",\"libstatslog_perfetto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto_android_internal.so\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"traced_perf\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  init_rc: [\"traced_perf.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced_perf\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-10
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-10.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-10.tar.xz
end=`date +%s`
echo $((end-start))

rm -rf prebuiltlibs/external/perfetto/libperfetto
rm -rf prebuiltlibs/external/perfetto/traced
rm -rf prebuiltlibs/external/perfetto/traced_probes
rm -rf prebuiltlibs/external/perfetto/libperfetto_client_experimental
rm -rf prebuiltlibs/external/perfetto/perfetto
rm -rf prebuiltlibs/external/perfetto/trigger_perfetto
rm -rf prebuiltlibs/external/perfetto/perfetto_trace_protos
rm -rf prebuiltlibs/external/perfetto/heapprofd
rm -rf prebuiltlibs/external/perfetto/heapprofd_client
rm -rf prebuiltlibs/external/perfetto/libperfetto_android_internal
rm -rf prebuiltlibs/external/perfetto/traced_perf

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so \
  out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a \
  out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so \
  out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a \
  out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so \
  out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so \
  

mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_shared_apex10000/libc_malloc_debug.so
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_64_static_apex10000/libc_malloc_debug.a
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_shared_apex10000/libc_malloc_debug.so
mkdir -p prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a prebuiltlibs/bionic/libc/malloc_debug/libc_malloc_debug/android_x86_x86_64_static_apex10000/libc_malloc_debug.a
mkdir -p prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_64_shared/ && mv out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_64_shared/libfdtrack.so
mkdir -p prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/ && mv out/soong/.intermediates/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so prebuiltlibs/bionic/libfdtrack/libfdtrack/android_x86_x86_64_shared/libfdtrack.so

printf "cc_prebuilt_library {\n  name: \"libc_malloc_debug\",\n  stl: \"libc++_static\",\n  static_libs: [\"libasync_safe\",\"libbase\",\"libc_malloc_debug_backtrace\"],\n  shared_libs: [\"libunwindstack\"],\n  multilib: {\n    lib32: {\n      version_script: \"exported32.map\",\n    },\n    lib64: {\n      version_script: \"exported64.map\",\n    },\n  },\n  allow_undefined_symbols: true,\n  sanitize: {\n    never: true,\n  },\n  native_coverage: false,\n  apex_available: [\"com.android.runtime\"],\n  static: {\n    apex_available: [\"//apex_available:platform\"],\n    srcs: [\"libc_malloc_debug.a\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libc_malloc_debug.so\"],\n  },\n}\n" >> prebuiltlibs/bionic/libc/malloc_debug/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libfdtrack\",\n  stl: \"libc++_static\",\n  static_libs: [\"libasync_safe\",\"libbase\",\"libunwindstack\",\"liblzma\",\"liblog\"],\n  version_script: \"libfdtrack.map.txt\",\n  allow_undefined_symbols: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libfdtrack.so\"],\n}\n" >> prebuiltlibs/bionic/libfdtrack/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/bionic/ninja && rsync -ar out/soong/ninja/bionic/ prebuiltlibs/bionic/ninja/bionic-10
touch prebuiltlibs/bionic/ninja/.find-ignore
tar cfJ bionic-10.tar.xz -C prebuiltlibs/bionic/ .
ls -l bionic-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a \
  out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a \
  out/soong/.intermediates/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a \
  out/soong/.intermediates/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd \
  out/soong/.intermediates/bootable/recovery/recovery-persist/android_x86_64/recovery-persist \
  out/soong/.intermediates/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh \
  out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a \
  out/soong/.intermediates/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier \
  out/soong/.intermediates/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt \
  

mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_recovery_x86_64_static/librecovery_utils.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a prebuiltlibs/bootable/recovery/recovery_utils/librecovery_utils/android_x86_64_static/librecovery_utils.a
mkdir -p prebuiltlibs/bootable/recovery/recovery_utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/recovery_utils/include/ prebuiltlibs/bootable/recovery/recovery_utils/include
mkdir -p prebuiltlibs/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a prebuiltlibs/bootable/recovery/minadbd/libminadbd_services/android_recovery_x86_64_static/libminadbd_services.a
mkdir -p prebuiltlibs/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/ && mv out/soong/.intermediates/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd prebuiltlibs/bootable/recovery/minadbd/minadbd/android_recovery_x86_64/minadbd
mkdir -p prebuiltlibs/bootable/recovery/recovery-persist/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/recovery-persist/android_x86_64/recovery-persist prebuiltlibs/bootable/recovery/recovery-persist/android_x86_64/recovery-persist
mkdir -p prebuiltlibs/bootable/recovery/recovery-refresh/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh prebuiltlibs/bootable/recovery/recovery-refresh/android_x86_64/recovery-refresh
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/ && mv out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/libupdate_verifier.a
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" bootable/recovery/update_verifier/include/ prebuiltlibs/bootable/recovery/update_verifier/include
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/ && rsync -ar out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/gen/proto prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_static/gen/proto prebuiltlibs/bootable/recovery/update_verifier/libupdate_verifier/android_x86_64_shared/
mkdir -p prebuiltlibs/bootable/recovery/update_verifier/update_verifier/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier prebuiltlibs/bootable/recovery/update_verifier/update_verifier/android_x86_64/update_verifier
mkdir -p prebuiltlibs/bootable/recovery/uncrypt/uncrypt/android_x86_64/ && mv out/soong/.intermediates/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt prebuiltlibs/bootable/recovery/uncrypt/uncrypt/android_x86_64/uncrypt

printf "cc_prebuilt_library_static {\n  name: \"librecovery_utils\",\n  shared_libs: [\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libselinux\",\"libutils\"],\n  static_libs: [\"libotautil\",\"libfstab\",\"libhealthhalutils\"],\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  export_static_lib_headers: [\"libfstab\"],\n  visibility: [\"//bootable/recovery\",\"//bootable/recovery/install\",\"//bootable/recovery/minadbd\",\"//bootable/recovery/tests\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librecovery_utils.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/recovery_utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libminadbd_services\",\n  shared_libs: [\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libselinux\",\"libutils\",\"libadbd\",\"libcrypto\",\"libfusesideload\"],\n  static_libs: [\"libotautil\",\"libfstab\",\"libhealthhalutils\",\"librecovery_utils\"],\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libminadbd_services.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/minadbd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"minadbd\",\n  shared_libs: [\"libadbd_auth\",\"libadbd_fs\",\"liblog\",\"libselinux\",\"android.hardware.health@2.0\",\"libbase\",\"libext4_utils\",\"libfs_mgr\",\"libhidlbase\",\"libutils\",\"libcrypto\"],\n  target: {\n    android: {\n      shared_libs: [\"libcrypto\"],\n    },\n    linux_glibc: {\n      static_libs: [\"libcrypto_static\"],\n    },\n    recovery: {\n      exclude_static_libs: [\"libadb_pairing_auth\",\"libadb_pairing_connection\"],\n    },\n  },\n  recovery: true,\n  required: [\"adbd_system_api_recovery\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"minadbd\"],\n}\n" >> prebuiltlibs/bootable/recovery/minadbd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"recovery-persist\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  init_rc: [\"recovery-persist.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"recovery-persist\"],\n}\n" >> prebuiltlibs/bootable/recovery/Android.bp
printf "cc_prebuilt_binary {\n  name: \"recovery-refresh\",\n  shared_libs: [\"libbase\",\"liblog\"],\n  init_rc: [\"recovery-refresh.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"recovery-refresh\"],\n}\n" >> prebuiltlibs/bootable/recovery/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libupdate_verifier\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libotautil\",\"libvold_binder\"],\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libcutils\",\"libbinder\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libupdate_verifier.a\"],\n}\n" >> prebuiltlibs/bootable/recovery/update_verifier/Android.bp
printf "cc_prebuilt_binary {\n  name: \"update_verifier\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"libbase\",\"libcutils\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libbinder\",\"libutils\"],\n  init_rc: [\"update_verifier.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_verifier\"],\n}\n" >> prebuiltlibs/bootable/recovery/update_verifier/Android.bp
printf "cc_prebuilt_binary {\n  name: \"uncrypt\",\n  shared_libs: [\"libbase\",\"libbootloader_message\",\"libcutils\",\"libfs_mgr\"],\n  init_rc: [\"uncrypt.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"uncrypt\"],\n}\n" >> prebuiltlibs/bootable/recovery/uncrypt/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/bootable/recovery/ninja && rsync -ar out/soong/ninja/bootable/recovery/ prebuiltlibs/bootable/recovery/ninja/bootable_recovery-10
touch prebuiltlibs/bootable/recovery/ninja/.find-ignore
tar cfJ bootable_recovery-10.tar.xz -C prebuiltlibs/bootable/recovery/ .
ls -l bootable_recovery-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder \
  out/soong/.intermediates/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection \
  

mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/bt_vhci_forwarder/android_vendor.31_x86_64/bt_vhci_forwarder
mkdir -p prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/ && mv out/soong/.intermediates/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/cuttlefish_sensor_injection/android_vendor.31_x86_64/cuttlefish_sensor_injection

printf "cc_prebuilt_binary {\n  name: \"bt_vhci_forwarder\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bt_vhci_forwarder\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/bt_vhci_forwarder/Android.bp
printf "cc_prebuilt_binary {\n  name: \"cuttlefish_sensor_injection\",\n  target: {\n    host: {\n      compile_multilib: \"64\",\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.sensors@1.0\",\"android.hardware.sensors@2.1\",\"libbase\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cuttlefish_sensor_injection\"],\n}\n" >> prebuiltlibs/device/google/cuttlefish/guest/commands/sensor_injection/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/device/google/cuttlefish/ninja && rsync -ar out/soong/ninja/device/google/cuttlefish/ prebuiltlibs/device/google/cuttlefish/ninja/device_google_cuttlefish-10
touch prebuiltlibs/device/google/cuttlefish/ninja/.find-ignore
tar cfJ device_google_cuttlefish-10.tar.xz -C prebuiltlibs/device/google/cuttlefish/ .
ls -l device_google_cuttlefish-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/avb/libavb_user/android_x86_64_static/libavb_user.a \
  out/soong/.intermediates/external/avb/avbctl/android_x86_64/avbctl \
  

mkdir -p prebuiltlibs/external/avb/libavb_user/android_x86_64_static/ && mv out/soong/.intermediates/external/avb/libavb_user/android_x86_64_static/libavb_user.a prebuiltlibs/external/avb/libavb_user/android_x86_64_static/libavb_user.a
mkdir -p prebuiltlibs/external/avb/avbctl/android_x86_64/ && mv out/soong/.intermediates/external/avb/avbctl/android_x86_64/avbctl prebuiltlibs/external/avb/avbctl/android_x86_64/avbctl

printf "cc_prebuilt_library_static {\n  name: \"libavb_user\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libcrypto\",\"libbase\"],\n  recovery_available: true,\n  header_libs: [\"avb_headers\"],\n  export_header_lib_headers: [\"avb_headers\"],\n  static_libs: [\"libfs_mgr\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libavb_user.a\"],\n}\n" >> prebuiltlibs/external/avb/Android.bp
printf "cc_prebuilt_binary {\n  name: \"avbctl\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"libbase\",\"libcrypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"avbctl\"],\n}\n" >> prebuiltlibs/external/avb/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/avb/ninja && rsync -ar out/soong/ninja/external/avb/ prebuiltlibs/external/avb/ninja/external_avb-10
touch prebuiltlibs/external/avb/ninja/.find-ignore
tar cfJ external_avb-10.tar.xz -C prebuiltlibs/external/avb/ .
ls -l external_avb-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so \
  out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib \
  out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so \
  out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase.dylib.so \
  out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase.rlib \
  out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase.dylib.so \
  out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse.rlib \
  out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse.dylib.so \
  out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse.dylib.so \
  out/soong/.intermediates/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib \
  out/soong/.intermediates/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib \
  out/soong/.intermediates/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib \
  out/soong/.intermediates/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib \
  out/soong/.intermediates/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib \
  out/soong/.intermediates/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib \
  out/soong/.intermediates/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib \
  out/soong/.intermediates/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib \
  out/soong/.intermediates/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib \
  out/soong/.intermediates/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib \
  out/soong/.intermediates/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib \
  out/soong/.intermediates/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib \
  out/soong/.intermediates/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib \
  out/soong/.intermediates/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib \
  out/soong/.intermediates/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib \
  out/soong/.intermediates/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib \
  out/soong/.intermediates/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib \
  

mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib/libcros_async.dylib.so
mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_rlib_rlib-std_apex10000/libcros_async.rlib
mkdir -p prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so prebuiltlibs/external/crosvm/cros_async/libcros_async/android_x86_64_dylib_apex10000/libcros_async.dylib.so
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase.dylib.so prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib/libbase_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase.rlib prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_rlib_rlib-std_apex10000/libbase_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase.dylib.so prebuiltlibs/external/crosvm/base/libbase_rust/android_x86_64_dylib_apex10000/libbase_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse.rlib prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_rlib_rlib-std_apex10000/libfuse_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse.dylib.so prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib/libfuse_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/ && mv out/soong/.intermediates/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse.dylib.so prebuiltlibs/external/crosvm/fuse/libfuse_rust/android_x86_64_dylib_apex10000/libfuse_rust.dylib.so
mkdir -p prebuiltlibs/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib prebuiltlibs/external/crosvm/kvm_sys/libkvm_sys/android_x86_64_rlib_rlib-std_apex10000/libkvm_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib prebuiltlibs/external/crosvm/linux_input_sys/liblinux_input_sys/android_x86_64_rlib_rlib-std_apex10000/liblinux_input_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib prebuiltlibs/external/crosvm/gpu_display/libgpu_display/android_x86_64_rlib_rlib-std_apex10000/libgpu_display.rlib
mkdir -p prebuiltlibs/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib prebuiltlibs/external/crosvm/net_sys/libnet_sys/android_x86_64_rlib_rlib-std_apex10000/libnet_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib prebuiltlibs/external/crosvm/net_util/libnet_util/android_x86_64_rlib_rlib-std_apex10000/libnet_util.rlib
mkdir -p prebuiltlibs/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib prebuiltlibs/external/crosvm/power_monitor/libpower_monitor/android_x86_64_rlib_rlib-std_apex10000/libpower_monitor.rlib
mkdir -p prebuiltlibs/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib prebuiltlibs/external/crosvm/resources/libresources/android_x86_64_rlib_rlib-std_apex10000/libresources.rlib
mkdir -p prebuiltlibs/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib prebuiltlibs/external/crosvm/usb_sys/libusb_sys/android_x86_64_rlib_rlib-std_apex10000/libusb_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib prebuiltlibs/external/crosvm/usb_util/libusb_util/android_x86_64_rlib_rlib-std_apex10000/libusb_util.rlib
mkdir -p prebuiltlibs/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib prebuiltlibs/external/crosvm/vfio_sys/libvfio_sys/android_x86_64_rlib_rlib-std_apex10000/libvfio_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib prebuiltlibs/external/crosvm/virtio_sys/libvirtio_sys/android_x86_64_rlib_rlib-std_apex10000/libvirtio_sys.rlib
mkdir -p prebuiltlibs/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib prebuiltlibs/external/crosvm/vm_memory/libvm_memory/android_x86_64_rlib_rlib-std_apex10000/libvm_memory.rlib
mkdir -p prebuiltlibs/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib prebuiltlibs/external/crosvm/disk/libdisk/android_x86_64_rlib_rlib-std_apex10000/libdisk.rlib
mkdir -p prebuiltlibs/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib prebuiltlibs/external/crosvm/kernel_loader/libkernel_loader/android_x86_64_rlib_rlib-std_apex10000/libkernel_loader.rlib
mkdir -p prebuiltlibs/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib prebuiltlibs/external/crosvm/kvm/libkvm/android_x86_64_rlib_rlib-std_apex10000/libkvm.rlib
mkdir -p prebuiltlibs/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib prebuiltlibs/external/crosvm/hypervisor/libhypervisor/android_x86_64_rlib_rlib-std_apex10000/libhypervisor.rlib
mkdir -p prebuiltlibs/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib prebuiltlibs/external/crosvm/vhost/libvhost/android_x86_64_rlib_rlib-std_apex10000/libvhost.rlib

printf "rust_prebuilt_library {\n  name: \"libcros_async\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"cros_async\",\n  rustlibs: [\"libasync_task\",\"libdata_model\",\"libfutures\",\"libintrusive_collections\",\"libio_uring\",\"liblibc\",\"libpin_utils\",\"libslab\",\"libsync_rust\",\"libsys_util\",\"libsyscall_defines\",\"libthiserror\"],\n  proc_macros: [\"libasync_trait\",\"libpaste\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libcros_async.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libcros_async.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/cros_async/Android.bp
printf "rust_prebuilt_library {\n  name: \"libbase_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libbase\",\n  host_supported: true,\n  crate_name: \"base\",\n  rustlibs: [\"libcros_async\",\"libdata_model\",\"liblibc\",\"libserde\",\"libserde_json\",\"libsmallvec\",\"libsync_rust\",\"libsys_util\",\"libthiserror\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libbase_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libbase_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/base/Android.bp
printf "rust_prebuilt_library {\n  name: \"libfuse_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libfuse\",\n  host_supported: true,\n  crate_name: \"fuse\",\n  rustlibs: [\"libbase_rust\",\"libbitflags\",\"libdata_model\",\"liblibc\",\"libthiserror\"],\n  proc_macros: [\"libenumn\"],\n  multiple_variants: true,\n  rlib: {\n    srcs: [\"libfuse_rust.rlib\"],\n  },\n  dylib: {\n    srcs: [\"libfuse_rust.dylib.so\"],\n  },\n}\n" >> prebuiltlibs/external/crosvm/fuse/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkvm_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kvm_sys\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libkvm_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kvm_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblinux_input_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"linux_input_sys\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"liblinux_input_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/linux_input_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libgpu_display\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n      shared_libs: [\"libwayland_client\"],\n    },\n    android: {\n      static_libs: [\"libwayland_client_static\",\"libffi\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"gpu_display\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\",\"liblinux_input_sys\"],\n  static_libs: [\"libdisplay_wl\"],\n  multiple_variants: true,\n  srcs: [\"libgpu_display.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/gpu_display/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libnet_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"net_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libnet_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/net_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libnet_util\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"net_util\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\",\"libnet_sys\"],\n  multiple_variants: true,\n  srcs: [\"libnet_util.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/net_util/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libpower_monitor\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"power_monitor\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libpower_monitor.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/power_monitor/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libresources\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"resources\",\n  rustlibs: [\"libbase_rust\",\"liblibc\",\"libserde\"],\n  multiple_variants: true,\n  srcs: [\"libresources.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/resources/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libusb_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"usb_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libusb_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/usb_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libusb_util\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"usb_util\",\n  rustlibs: [\"libassertions\",\"libbase_rust\",\"libdata_model\",\"liblibc\",\"libusb_sys\"],\n  proc_macros: [\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libusb_util.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/usb_util/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvfio_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vfio_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libvfio_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vfio_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvirtio_sys\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"virtio_sys\",\n  rustlibs: [\"libbase_rust\"],\n  multiple_variants: true,\n  srcs: [\"libvirtio_sys.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/virtio_sys/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvm_memory\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vm_memory\",\n  rustlibs: [\"libbase_rust\",\"libbitflags\",\"libcros_async\",\"libdata_model\",\"liblibc\"],\n  multiple_variants: true,\n  srcs: [\"libvm_memory.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vm_memory/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libdisk\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"disk\",\n  features: [\"composite-disk\"],\n  rustlibs: [\"libbase_rust\",\"libcros_async\",\"libdata_model\",\"libfutures\",\"liblibc\",\"libprotobuf\",\"libprotos\",\"libtempfile\",\"libvm_memory\"],\n  proc_macros: [\"libasync_trait\",\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libdisk.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/disk/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkernel_loader\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kernel_loader\",\n  rustlibs: [\"libbase_rust\",\"liblibc\",\"libtempfile\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libkernel_loader.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kernel_loader/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkvm\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"kvm\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"libkvm_sys\",\"liblibc\",\"libsync_rust\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libkvm.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/kvm/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libhypervisor\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"hypervisor\",\n  rustlibs: [\"libbase_rust\",\"libbit_field\",\"libdata_model\",\"libdowncast_rs\",\"libkvm\",\"libkvm_sys\",\"liblibc\",\"libserde\",\"libsync_rust\",\"libvm_memory\"],\n  proc_macros: [\"libenumn\"],\n  multiple_variants: true,\n  srcs: [\"libhypervisor.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/hypervisor/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvhost\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vhost\",\n  rustlibs: [\"libassertions\",\"libbase_rust\",\"liblibc\",\"libnet_util\",\"libvirtio_sys\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libvhost.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vhost/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-10
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-10.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib \
  

mkdir -p prebuiltlibs/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib prebuiltlibs/external/libchromeos-rs/liblibchromeos/android_x86_64_rlib_rlib-std_apex10000/liblibchromeos.rlib

printf "rust_prebuilt_rlib {\n  name: \"liblibchromeos\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"libchromeos\",\n  rustlibs: [\"libdata_model\",\"libfutures\",\"libintrusive_collections\",\"liblibc\",\"liblog_rust\",\"libprotobuf\"],\n  multiple_variants: true,\n  srcs: [\"liblibchromeos.rlib\"],\n}\n" >> prebuiltlibs/external/libchromeos-rs/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libchromeos-rs/ninja && rsync -ar out/soong/ninja/external/libchromeos-rs/ prebuiltlibs/external/libchromeos-rs/ninja/external_libchromeos-rs-10
touch prebuiltlibs/external/libchromeos-rs/ninja/.find-ignore
tar cfJ external_libchromeos-rs-10.tar.xz -C prebuiltlibs/external/libchromeos-rs/ .
ls -l external_libchromeos-rs-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib \
  out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_64_rlib_rlib-std/libgrpcio.rlib
mkdir -p prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib prebuiltlibs/external/rust/crates/grpcio/libgrpcio/android_x86_x86_64_rlib_rlib-std/libgrpcio.rlib

printf "rust_prebuilt_rlib {\n  name: \"libgrpcio\",\n  host_supported: true,\n  crate_name: \"grpcio\",\n  edition: \"2018\",\n  features: [\"protobuf\",\"protobuf-codec\"],\n  rustlibs: [\"libfutures\",\"libgrpcio_sys\",\"liblibc\",\"liblog_rust\",\"libparking_lot\",\"libprotobuf\"],\n  multiple_variants: true,\n  srcs: [\"libgrpcio.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/grpcio/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/grpcio/ninja && rsync -ar out/soong/ninja/external/rust/crates/grpcio/ prebuiltlibs/external/rust/crates/grpcio/ninja/external_rust_crates_grpcio-10
touch prebuiltlibs/external/rust/crates/grpcio/ninja/.find-ignore
tar cfJ external_rust_crates_grpcio-10.tar.xz -C prebuiltlibs/external/rust/crates/grpcio/ .
ls -l external_rust_crates_grpcio-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib prebuiltlibs/external/rust/crates/rusqlite/librusqlite/android_x86_64_rlib_rlib-std/librusqlite.rlib

printf "rust_prebuilt_rlib {\n  name: \"librusqlite\",\n  host_supported: true,\n  crate_name: \"rusqlite\",\n  edition: \"2018\",\n  features: [\"modern_sqlite\"],\n  rustlibs: [\"libbitflags\",\"libfallible_iterator\",\"libfallible_streaming_iterator\",\"libhashlink\",\"liblibsqlite3_sys\",\"libmemchr\",\"libsmallvec\"],\n  multiple_variants: true,\n  srcs: [\"librusqlite.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/rusqlite/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/rusqlite/ninja && rsync -ar out/soong/ninja/external/rust/crates/rusqlite/ prebuiltlibs/external/rust/crates/rusqlite/ninja/external_rust_crates_rusqlite-10
touch prebuiltlibs/external/rust/crates/rusqlite/ninja/.find-ignore
tar cfJ external_rust_crates_rusqlite-10.tar.xz -C prebuiltlibs/external/rust/crates/rusqlite/ .
ls -l external_rust_crates_rusqlite-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey \
  out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a \
  out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a \
  out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so \
  out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so \
  out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a \
  out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so \
  out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a \
  out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a \
  out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so \
  out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so \
  out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so \
  out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so \
  out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so \
  out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a \
  out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so \
  out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a \
  out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so \
  out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a \
  out/soong/.intermediates/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver \
  out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so \
  out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a \
  out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so \
  out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so \
  out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so \
  out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so \
  out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so \
  out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a \
  out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so \
  out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a \
  out/soong/.intermediates/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so \
  out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a \
  

mkdir -p prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/ && mv out/soong/.intermediates/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/android.hardware.drm@1.4-service.clearkey/android_vendor.31_x86_64/android.hardware.drm@1.4-service.clearkey
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_64_static/libaudiopolicyengine_config.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config/android_x86_x86_64_static/libaudiopolicyengine_config.a
mkdir -p prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/audiopolicy/engine/config/include/ prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/include
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so prebuiltlibs/frameworks/av/media/libaudioprocessing/libaudioprocessing/android_x86_64_shared/libaudioprocessing.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioprocessing/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaudioprocessing/include/ prebuiltlibs/frameworks/av/media/libaudioprocessing/include
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_shared_cfi/libdatasource.so
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_64_static_cfi/libdatasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_shared_cfi/libdatasource.so
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a prebuiltlibs/frameworks/av/media/libdatasource/libdatasource/android_x86_x86_64_static_cfi/libdatasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libdatasource/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libdatasource/include/ prebuiltlibs/frameworks/av/media/libdatasource/include
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource/android_x86_x86_64_static_cfi/libplayerservice_datasource.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediaplayerservice/datasource/include/ prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_64_static_cfi/libstagefright_webm.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a prebuiltlibs/frameworks/av/media/libstagefright/webm/libstagefright_webm/android_x86_x86_64_static_cfi/libstagefright_webm.a
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_64_shared_cfi/libmedia_codeclist.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so prebuiltlibs/frameworks/av/media/libmedia/libmedia_codeclist/android_x86_x86_64_shared_cfi/libmedia_codeclist.so
mkdir -p prebuiltlibs/frameworks/av/media/libmedia/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmedia/include/ prebuiltlibs/frameworks/av/media/libmedia/include
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/libmediadrmmetrics_full.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/libmediadrmmetrics_full.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/libmediadrmmetrics_lite.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/libmediadrmmetrics_lite.so
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/gen/proto prebuiltlibs/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_shared_cfi/libmediandk_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_64_static_cfi/libmediandk_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_shared_cfi/libmediandk_utils.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a prebuiltlibs/frameworks/av/media/ndk/libmediandk_utils/android_x86_x86_64_static_cfi/libmediandk_utils.a
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include/ prebuiltlibs/frameworks/av/media/ndk/include
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_shared/libmediautils.so
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_64_static/libmediautils.a
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_shared/libmediautils.so
mkdir -p prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a prebuiltlibs/frameworks/av/media/utils/libmediautils/android_x86_x86_64_static/libmediautils.a
mkdir -p prebuiltlibs/frameworks/av/media/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/utils/include/ prebuiltlibs/frameworks/av/media/utils/include
mkdir -p prebuiltlibs/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/ && mv out/soong/.intermediates/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver prebuiltlibs/frameworks/av/drm/drmserver/drmserver/android_x86_x86_64/drmserver
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/libaudioclient.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/libaudioclient.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/libaudioclient.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/libaudioclient.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_64_static/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/gen/aidl prebuiltlibs/frameworks/av/media/libaudioclient/libaudioclient/android_x86_x86_64_static/
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_shared/libaaudio_internal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_64_static/libaaudio_internal.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_shared/libaaudio_internal.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio_internal/android_x86_x86_64_static/libaaudio_internal.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libaaudio/src/ prebuiltlibs/frameworks/av/media/libaaudio/src/
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_shared/libaaudio.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_64_static/libaaudio.a
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_shared/libaaudio.so
mkdir -p prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a prebuiltlibs/frameworks/av/media/libaaudio/src/libaaudio/android_x86_x86_64_static/libaaudio.a
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_64_shared/libaudiohal@4.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@4.0/android_x86_x86_64_shared/libaudiohal@4.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_64_shared/libaudiohal@5.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@5.0/android_x86_x86_64_shared/libaudiohal@5.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_64_shared/libaudiohal@6.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@6.0/android_x86_x86_64_shared/libaudiohal@6.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_64_shared/libaudiohal@7.0.so
mkdir -p prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so prebuiltlibs/frameworks/av/media/libaudiohal/impl/libaudiohal@7.0/android_x86_x86_64_shared/libaudiohal@7.0.so
mkdir -p prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_shared/libmedialogservice.so
mkdir -p prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a prebuiltlibs/frameworks/av/services/medialog/libmedialogservice/android_x86_64_static/libmedialogservice.a
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_shared/libmediametricsservice.so
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a prebuiltlibs/frameworks/av/services/mediametrics/libmediametricsservice/android_x86_64_static/libmediametricsservice.a
mkdir -p prebuiltlibs/frameworks/av/services/mediametrics/mediametrics/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics prebuiltlibs/frameworks/av/services/mediametrics/mediametrics/android_x86_64/mediametrics
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_shared/libstagefright_bufferpool@2.0.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_64_static/libstagefright_bufferpool@2.0.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_shared/libstagefright_bufferpool@2.0.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0/android_vendor.31_x86_x86_64_static/libstagefright_bufferpool@2.0.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/bufferpool/2.0/include/ prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_shared/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_x86_64_static/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_shared_apex29/libstagefright_bufferpool@2.0.1.so
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/ && mv out/soong/.intermediates/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a prebuiltlibs/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1/android_x86_64_static_apex29/libstagefright_bufferpool@2.0.1.a
mkdir -p prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/bufferpool/2.0/include/ prebuiltlibs/frameworks/av/media/bufferpool/2.0/include
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support/android_x86_x86_64_static_cfi/libstagefright_mpeg2support.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/mpeg2ts/ prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto/android_x86_64_static_cfi_com.android.media/libstagefright_mpeg2support_nocrypto.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/mpeg2ts/ prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/

printf "cc_prebuilt_binary {\n  name: \"android.hardware.drm@1.4-service.clearkey\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"android.hardware.drm@1.3\",\"android.hardware.drm@1.4\",\"libbase\",\"libbinder\",\"libcrypto\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  sanitize: {\n    integer_overflow: true,\n  },\n  init_rc: [\"android.hardware.drm@1.4-service.clearkey.rc\"],\n  vintf_fragments: [\"manifest_android.hardware.drm@1.4-service.clearkey.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.drm@1.4-service.clearkey\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudiopolicyengine_config\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libmedia_helper\",\"libxml2\",\"libutils\",\"liblog\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiopolicyengine_config.a\"],\n}\n" >> prebuiltlibs/frameworks/av/services/audiopolicy/engine/config/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudioprocessing\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libaudioutils\",\"libcutils\",\"liblog\",\"libutils\",\"libaudiohal\",\"libsonic\",\"libvibrator\"],\n  arch: {\n    x86: {\n      avx2: {\n      },\n    },\n    x86_64: {\n      avx2: {\n      },\n    },\n  },\n  whole_static_libs: [\"libaudioprocessing_base\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudioprocessing.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioprocessing/Android.bp
printf "cc_prebuilt_library {\n  name: \"libdatasource\",\n  header_libs: [\"libstagefright_headers\",\"media_ndk_headers\"],\n  export_header_lib_headers: [\"libstagefright_headers\",\"media_ndk_headers\"],\n  shared_libs: [\"liblog\",\"libcutils\",\"libutils\",\"libstagefright_foundation\",\"libdl\"],\n  static_libs: [\"libc_malloc_debug_backtrace\",\"libmedia_midiiowrapper\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libdatasource.a\"],\n  },\n  shared: {\n    srcs: [\"libdatasource.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libdatasource/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libplayerservice_datasource\",\n  shared_libs: [\"libdatasource\",\"libdrmframework\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libplayerservice_datasource.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmediaplayerservice/datasource/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_webm\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libdatasource\",\"libstagefright_foundation\",\"libutils\",\"liblog\",\"framework-permission-aidl-cpp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_webm.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/webm/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmedia_codeclist\",\n  shared_libs: [\"android.hardware.media.omx@1.0\",\"libbinder\",\"liblog\",\"libstagefright_foundation\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmedia_codeclist.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libmedia/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediadrmmetrics_full\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"libbase\",\"liblog\",\"libmediametrics\",\"libprotobuf-cpp-full\",\"libstagefright_foundation\",\"libutils\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediadrmmetrics_full.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libmediadrm/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediadrmmetrics_lite\",\n  shared_libs: [\"android.hardware.drm@1.0\",\"android.hardware.drm@1.1\",\"android.hardware.drm@1.2\",\"liblog\",\"libmediametrics\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediadrmmetrics_lite.so\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/libmediadrm/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediandk_utils\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediandk_utils.a\"],\n  },\n  shared: {\n    srcs: [\"libmediandk_utils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/ndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediautils\",\n  static_libs: [\"libc_malloc_debug_backtrace\",\"libbatterystats_aidl\",\"libprocessinfoservice_aidl\"],\n  shared_libs: [\"libaudioclient_aidl_conversion\",\"libaudioutils\",\"libbinder\",\"libcutils\",\"liblog\",\"libutils\",\"libhidlbase\",\"libpermission\",\"android.hardware.graphics.bufferqueue@1.0\",\"android.hidl.token@1.0-utils\"],\n  export_static_lib_headers: [\"libbatterystats_aidl\"],\n  logtags: [\"EventLogTags.logtags\"],\n  export_shared_lib_headers: [\"libpermission\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediautils.a\"],\n  },\n  shared: {\n    srcs: [\"libmediautils.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/utils/Android.bp
printf "cc_prebuilt_binary {\n  name: \"drmserver\",\n  shared_libs: [\"libmediametrics\",\"libmediautils\",\"libcutils\",\"libutils\",\"liblog\",\"libbinder\",\"libdl\",\"libdrmframeworkcommon\",\"libselinux\",\"libstagefright_foundation\"],\n  compile_multilib: \"prefer32\",\n  init_rc: [\"drmserver.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"drmserver\"],\n}\n" >> prebuiltlibs/frameworks/av/drm/drmserver/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaudioclient\",\n  shared_libs: [\"audioclient-types-aidl-cpp\",\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"audiopolicy-types-aidl-cpp\",\"av-types-aidl-cpp\",\"capture_state_listener-aidl-cpp\",\"libaudioclient_aidl_conversion\",\"libaudiofoundation\",\"libaudioutils\",\"libaudiopolicy\",\"libaudiomanager\",\"libbinder\",\"libcutils\",\"libdl\",\"liblog\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libnblog\",\"libprocessgroup\",\"libshmemcompat\",\"libutils\",\"libvibrator\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"audioflinger-aidl-cpp\",\"audiopolicy-aidl-cpp\",\"framework-permission-aidl-cpp\",\"libbinder\"],\n  header_libs: [\"libaudioclient_headers\"],\n  export_header_lib_headers: [\"libaudioclient_headers\"],\n  export_static_lib_headers: [\"effect-aidl-cpp\",\"shared-file-region-aidl-cpp\"],\n  static_libs: [\"effect-aidl-cpp\",\"libc_malloc_debug_backtrace\",\"shared-file-region-aidl-cpp\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaudioclient.a\"],\n  },\n  shared: {\n    srcs: [\"libaudioclient.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaudioclient/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaaudio_internal\",\n  export_include_dirs: [\".\"],\n  header_libs: [\"libaaudio_headers\"],\n  export_header_lib_headers: [\"libaaudio_headers\"],\n  export_shared_lib_headers: [\"framework-permission-aidl-cpp\"],\n  shared_libs: [\"libaudioclient\",\"libaudioutils\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"liblog\",\"libcutils\",\"libutils\",\"libbinder\",\"framework-permission-aidl-cpp\",\"aaudio-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaaudio_internal.a\"],\n  },\n  shared: {\n    srcs: [\"libaaudio_internal.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaaudio/src/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaaudio\",\n  header_libs: [\"libaaudio_headers\"],\n  export_header_lib_headers: [\"libaaudio_headers\"],\n  version_script: \"libaaudio.map.txt\",\n  shared_libs: [\"libaaudio_internal\",\"libaudioclient\",\"libaudioutils\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"liblog\",\"libcutils\",\"libutils\",\"libbinder\",\"libpermission\"],\n  sanitize: {\n    integer_overflow: true,\n    misc_undefined: [\"bounds\"],\n  },\n  stubs: {\n    symbol_file: \"libaaudio.map.txt\",\n    versions: [\"28\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaaudio.a\"],\n  },\n  shared: {\n    srcs: [\"libaaudio.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libaaudio/src/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal@4.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@4.0\",\"android.hardware.audio.common@4.0-util\",\"android.hardware.audio.effect@4.0\",\"android.hardware.audio.effect@4.0-util\",\"android.hardware.audio@4.0\",\"android.hardware.audio@4.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@4.0.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/impl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal@5.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@5.0\",\"android.hardware.audio.common@5.0-util\",\"android.hardware.audio.effect@5.0\",\"android.hardware.audio.effect@5.0-util\",\"android.hardware.audio@5.0\",\"android.hardware.audio@5.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@5.0.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/impl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal@6.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio.effect@6.0\",\"android.hardware.audio.effect@6.0-util\",\"android.hardware.audio@6.0\",\"android.hardware.audio@6.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@6.0.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/impl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libaudiohal@7.0\",\n  shared_libs: [\"android.hardware.audio.common-util\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"av-types-aidl-cpp\",\"libaudiofoundation\",\"libaudiohal_deathhandler\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libmedia_helper\",\"libmediautils\",\"libutils\",\"android.hardware.audio.common@7.0\",\"android.hardware.audio.common@7.0-util\",\"android.hardware.audio.effect@7.0\",\"android.hardware.audio.effect@7.0-util\",\"android.hardware.audio@7.0\",\"android.hardware.audio@7.0-util\"],\n  export_shared_lib_headers: [\"libfmq\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libaudiohal@7.0.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libaudiohal/impl/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmedialogservice\",\n  shared_libs: [\"libaudioutils\",\"libbinder\",\"liblog\",\"libmediautils\",\"libnblog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmedialogservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmedialogservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/medialog/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediametricsservice\",\n  shared_libs: [\"mediametricsservice-aidl-cpp\",\"libbase\",\"libbinder\",\"libcutils\",\"liblog\",\"libmedia_helper\",\"libmediametrics\",\"libmediautils\",\"libmemunreachable\",\"libprotobuf-cpp-lite\",\"libstagefright_foundation\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\"],\n  export_shared_lib_headers: [\"libstatspull\",\"libstatssocket\"],\n  static_libs: [\"libplatformprotos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediametricsservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmediametricsservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/services/mediametrics/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mediametrics\",\n  shared_libs: [\"libbinder\",\"liblog\",\"libmediametricsservice\",\"libmediautils\",\"libutils\",\"mediametricsservice-aidl-cpp\"],\n  init_rc: [\"mediametrics.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediametrics\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediametrics/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_bufferpool@2.0\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.media.bufferpool@2.0\"],\n  export_shared_lib_headers: [\"libfmq\",\"android.hardware.media.bufferpool@2.0\"],\n  vendor_available: true,\n  double_loadable: true,\n  vndk: {\n    enabled: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_bufferpool@2.0.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_bufferpool@2.0.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/bufferpool/2.0/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_bufferpool@2.0.1\",\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libcutils\",\"libfmq\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.media.bufferpool@2.0\"],\n  export_shared_lib_headers: [\"libfmq\",\"android.hardware.media.bufferpool@2.0\"],\n  vendor_available: true,\n  min_sdk_version: \"29\",\n  double_loadable: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_bufferpool@2.0.1.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_bufferpool@2.0.1.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/bufferpool/2.0/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_mpeg2support\",\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libhidlmemory\",\"android.hardware.cas.native@1.0\",\"android.hidl.memory@1.0\",\"android.hidl.allocator@1.0\",\"libcrypto\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libstagefright_metadatautils\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mpeg2support.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstagefright_mpeg2support_nocrypto\",\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"libhidlmemory\",\"android.hardware.cas.native@1.0\",\"android.hidl.memory@1.0\",\"android.hidl.allocator@1.0\"],\n  export_include_dirs: [\".\"],\n  whole_static_libs: [\"libstagefright_metadatautils\"],\n  min_sdk_version: \"29\",\n  host_supported: true,\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"com.android.media\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstagefright_mpeg2support_nocrypto.a\"],\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/mpeg2ts/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-10
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-10.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/base/core/java/android.os.permissions_aidl-rust/android_x86_64_rlib_rlib-std/libandroid_os_permissions_aidl.rlib \
  out/soong/.intermediates/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd \
  out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so \
  out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a \
  out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so \
  out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a \
  

mkdir -p prebuiltlibs/frameworks/base/core/java/android.os.permissions_aidl-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/frameworks/base/core/java/android.os.permissions_aidl-rust/android_x86_64_rlib_rlib-std/libandroid_os_permissions_aidl.rlib prebuiltlibs/frameworks/base/core/java/android.os.permissions_aidl-rust/android_x86_64_rlib_rlib-std/android.os.permissions_aidl-rust.rlib
mkdir -p prebuiltlibs/frameworks/base/cmds/incidentd/incidentd/android_x86_64/ && mv out/soong/.intermediates/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd prebuiltlibs/frameworks/base/cmds/incidentd/incidentd/android_x86_64/incidentd
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_shared/service.incremental.so
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_64_static/service.incremental.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_shared/service.incremental.so
mkdir -p prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a prebuiltlibs/frameworks/base/services/incremental/service.incremental/android_x86_x86_64_static/service.incremental.a
mkdir -p prebuiltlibs/frameworks/base/services/incremental/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/base/services/incremental/include/ prebuiltlibs/frameworks/base/services/incremental/include

printf "\n" >> prebuiltlibs/frameworks/base/core/java/Android.bp
printf "cc_prebuilt_binary {\n  name: \"incidentd\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libdebuggerd_client\",\"libdumputils\",\"libincidentpriv\",\"liblog\",\"libprotoutil\",\"libservices\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  init_rc: [\"incidentd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"incidentd\"],\n}\n" >> prebuiltlibs/frameworks/base/cmds/incidentd/Android.bp
printf "cc_prebuilt_library {\n  name: \"service.incremental\",\n  static_libs: [\"libbase\",\"libext2_uuid\",\"libdataloader_aidl-cpp\",\"libincremental_aidl-cpp\",\"libincremental_manager_aidl-cpp\",\"libprotobuf-cpp-lite\",\"service.incremental.proto\",\"libutils\",\"libvold_binder\",\"libc++fs\",\"libziparchive_for_incfs\"],\n  shared_libs: [\"libandroidfw\",\"libbinder\",\"libcrypto\",\"libcutils\",\"libincfs\",\"liblog\",\"libpermission\",\"libz\",\"libprotobuf-cpp-lite\"],\n  export_include_dirs: [\"include/\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"service.incremental.a\"],\n  },\n  shared: {\n    srcs: [\"service.incremental.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/base/services/incremental/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/base/ninja && rsync -ar out/soong/ninja/frameworks/base/ prebuiltlibs/frameworks/base/ninja/frameworks_base-10
touch prebuiltlibs/frameworks/base/ninja/.find-ignore
tar cfJ frameworks_base-10.tar.xz -C prebuiltlibs/frameworks/base/ .
ls -l frameworks_base-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_shared/android.frameworks.bufferhub@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_static/android.frameworks.bufferhub@1.0.a \
  out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_shared/android.frameworks.bufferhub@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_static/android.frameworks.bufferhub@1.0.a \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_shared/android.frameworks.sensorservice@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_static/android.frameworks.sensorservice@1.0.a \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_static/android.frameworks.sensorservice@1.0.a \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_shared/android.frameworks.sensorservice@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_static/android.frameworks.sensorservice@1.0.a \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so \
  out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_static/android.frameworks.sensorservice@1.0.a \
  

mkdir -p prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_shared/android.frameworks.bufferhub@1.0.so prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_shared/android.frameworks.bufferhub@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_static/android.frameworks.bufferhub@1.0.a prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_64_static/android.frameworks.bufferhub@1.0.a
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_shared/android.frameworks.bufferhub@1.0.so prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_shared/android.frameworks.bufferhub@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_static/android.frameworks.bufferhub@1.0.a prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0/android_x86_x86_64_static/android.frameworks.bufferhub@1.0.a
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_shared/android.frameworks.sensorservice@1.0.so prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_shared/android.frameworks.sensorservice@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_static/android.frameworks.sensorservice@1.0.a prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_64_static/android.frameworks.sensorservice@1.0.a
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_static/android.frameworks.sensorservice@1.0.a prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_x86_x86_64_static/android.frameworks.sensorservice@1.0.a
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_shared/android.frameworks.sensorservice@1.0.so prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_shared/android.frameworks.sensorservice@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_static/android.frameworks.sensorservice@1.0.a prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_64_static/android.frameworks.sensorservice@1.0.a
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_shared/android.frameworks.sensorservice@1.0.so
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_static/android.frameworks.sensorservice@1.0.a prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0/android_vendor.31_x86_x86_64_static/android.frameworks.sensorservice@1.0.a

printf "\n" >> prebuiltlibs/frameworks/hardware/interfaces/bufferhub/1.0/Android.bp
printf "\n" >> prebuiltlibs/frameworks/hardware/interfaces/sensorservice/1.0/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/hardware/interfaces/ninja && rsync -ar out/soong/ninja/frameworks/hardware/interfaces/ prebuiltlibs/frameworks/hardware/interfaces/ninja/frameworks_hardware_interfaces-10
touch prebuiltlibs/frameworks/hardware/interfaces/ninja/.find-ignore
tar cfJ frameworks_hardware_interfaces-10.tar.xz -C prebuiltlibs/frameworks/hardware/interfaces/ .
ls -l frameworks_hardware_interfaces-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace \
  out/soong/.intermediates/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so \
  out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a \
  out/soong/.intermediates/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a \
  out/soong/.intermediates/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli \
  out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so \
  out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so \
  out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so \
  out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so \
  out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so \
  out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so \
  out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so \
  out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so \
  out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot \
  

mkdir -p prebuiltlibs/frameworks/native/cmds/atrace/atrace/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace prebuiltlibs/frameworks/native/cmds/atrace/atrace/android_x86_64/atrace
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so prebuiltlibs/frameworks/native/services/gpuservice/gpustats/libgfxstats/android_x86_64_shared/libgfxstats.so
mkdir -p prebuiltlibs/frameworks/native/services/gpuservice/gpustats/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/gpuservice/gpustats/include/ prebuiltlibs/frameworks/native/services/gpuservice/gpustats/include
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_shared/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_vendor.31_x86_x86_64_static/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_shared_com.android.media.swcodec/libgralloctypes.so
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/ && mv out/soong/.intermediates/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a prebuiltlibs/frameworks/native/libs/gralloc/types/libgralloctypes/android_x86_64_static_com.android.media.swcodec/libgralloctypes.a
mkdir -p prebuiltlibs/frameworks/native/libs/gralloc/types/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/gralloc/types/include/ prebuiltlibs/frameworks/native/libs/gralloc/types/include
mkdir -p prebuiltlibs/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a prebuiltlibs/frameworks/native/cmds/idlcli/libidlcli/android_x86_64_static/libidlcli.a
mkdir -p prebuiltlibs/frameworks/native/cmds/idlcli/idlcli/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli prebuiltlibs/frameworks/native/cmds/idlcli/idlcli/android_x86_64/idlcli
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_64_shared/libmemtrackproxy.so
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so prebuiltlibs/frameworks/native/services/memtrackproxy/libmemtrackproxy/android_x86_x86_64_shared/libmemtrackproxy.so
mkdir -p prebuiltlibs/frameworks/native/services/memtrackproxy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/memtrackproxy/include/ prebuiltlibs/frameworks/native/services/memtrackproxy/include
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/libpowermanager.so
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/libpowermanager.so
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/powermanager/include/ prebuiltlibs/frameworks/native/services/powermanager/include
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/gen/aidl prebuiltlibs/frameworks/native/services/powermanager/libpowermanager/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_64_shared/libstatshidl.so
mkdir -p prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so prebuiltlibs/frameworks/native/services/stats/libstatshidl/android_x86_x86_64_shared/libstatshidl.so
mkdir -p prebuiltlibs/frameworks/native/services/stats/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/stats/include/ prebuiltlibs/frameworks/native/services/stats/include
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_64_shared/libvibratorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so prebuiltlibs/frameworks/native/services/vibratorservice/libvibratorservice/android_x86_x86_64_shared/libvibratorservice.so
mkdir -p prebuiltlibs/frameworks/native/services/vibratorservice/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/vibratorservice/include/ prebuiltlibs/frameworks/native/services/vibratorservice/include
mkdir -p prebuiltlibs/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot prebuiltlibs/frameworks/native/cmds/installd/otapreopt_chroot/android_x86_64/otapreopt_chroot

printf "cc_prebuilt_binary {\n  name: \"atrace\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"libcutils\",\"libz\",\"libbase\",\"libpdx_default_transport\",\"android.hardware.atrace@1.0\"],\n  init_rc: [\"atrace.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"atrace\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/atrace/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libgfxstats\",\n  shared_libs: [\"libcutils\",\"libgraphicsenv\",\"liblog\",\"libprotoutil\",\"libstatslog\",\"libstatspull\",\"libstatssocket\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"libstatspull\",\"libstatssocket\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libgfxstats.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/gpuservice/gpustats/Android.bp
printf "cc_prebuilt_library {\n  name: \"libgralloctypes\",\n  target: {\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.media.swcodec\"],\n  min_sdk_version: \"29\",\n  shared_libs: [\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libhidlbase\",\"liblog\"],\n  export_shared_lib_headers: [\"android.hardware.graphics.common-V2-ndk_platform\",\"android.hardware.graphics.mapper@4.0\",\"libhidlbase\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgralloctypes.a\"],\n  },\n  shared: {\n    srcs: [\"libgralloctypes.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/native/libs/gralloc/types/Android.bp
printf "cc_prebuilt_library {\n  name: \"libidlcli\",\n  shared_libs: [\"android.hardware.vibrator-V2-ndk_platform\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  vendor_available: true,\n  visibility: [\":__subpackages__\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libidlcli.a\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/idlcli/Android.bp
printf "cc_prebuilt_binary {\n  name: \"idlcli\",\n  shared_libs: [\"android.hardware.vibrator-V2-ndk_platform\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\",\"libbase\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  vendor_available: true,\n  whole_static_libs: [\"libidlcli\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"idlcli\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/idlcli/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmemtrackproxy\",\n  shared_libs: [\"libbase\",\"libbinder_ndk\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libcutils\",\"libutils\",\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  export_include_dirs: [\"include\"],\n  export_shared_lib_headers: [\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmemtrackproxy.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/memtrackproxy/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libpowermanager\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.power@1.0\",\"android.hardware.power@1.1\",\"android.hardware.power-V2-cpp\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpowermanager.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/powermanager/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libstatshidl\",\n  shared_libs: [\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\",\"libbinder_ndk\",\"libhidlbase\",\"liblog\",\"libstatslog\",\"libstatssocket\",\"libutils\"],\n  export_include_dirs: [\"include/\"],\n  export_shared_lib_headers: [\"android.frameworks.stats@1.0\",\"android.frameworks.stats-V1-ndk_platform\"],\n  vintf_fragments: [\"android.frameworks.stats@1.0-service.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstatshidl.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/stats/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libvibratorservice\",\n  shared_libs: [\"libbinder\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.hardware.vibrator-V2-cpp\",\"android.hardware.vibrator@1.0\",\"android.hardware.vibrator@1.1\",\"android.hardware.vibrator@1.2\",\"android.hardware.vibrator@1.3\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libvibratorservice.so\"],\n}\n" >> prebuiltlibs/frameworks/native/services/vibratorservice/Android.bp
printf "cc_prebuilt_binary {\n  name: \"otapreopt_chroot\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"libutils\"],\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  clang: true,\n  required: [\"apexd\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"otapreopt_chroot\"],\n}\n" >> prebuiltlibs/frameworks/native/cmds/installd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-10
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-10.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so \
  out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so \
  out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so \
  out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so \
  out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service \
  out/soong/.intermediates/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_secureclock_V1.rlib \
  out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_keymint_V1.rlib \
  out/soong/.intermediates/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_sharedsecret_V1.rlib \
  

mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio.effect@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/android.hardware.audio.effect@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio.effect@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_64_shared/android.hardware.audio@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/android.hardware.audio@6.0-impl/android_vendor.31_x86_x86_64_shared/android.hardware.audio@6.0-impl.so
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/ && mv out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/android.hardware.security.keymint-service/android_vendor.31_x86_64/android.hardware.security.keymint-service
mkdir -p prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_secureclock_V1.rlib prebuiltlibs/hardware/interfaces/security/secureclock/aidl/android.hardware.security.secureclock-V1-rust/android_x86_64_rlib_rlib-std/android.hardware.security.secureclock-V1-rust.rlib
mkdir -p prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_keymint_V1.rlib prebuiltlibs/hardware/interfaces/security/keymint/aidl/android.hardware.security.keymint-V1-rust/android_x86_64_rlib_rlib-std/android.hardware.security.keymint-V1-rust.rlib
mkdir -p prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust/android_x86_64_rlib_rlib-std/libandroid_hardware_security_sharedsecret_V1.rlib prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/android.hardware.security.sharedsecret-V1-rust/android_x86_64_rlib_rlib-std/android.hardware.security.sharedsecret-V1-rust.rlib

printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio.effect@6.0-impl\",\n  vendor: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libeffects\",\"libfmq\",\"libhidlbase\",\"libhidlmemory\",\"liblog\",\"libutils\",\"android.hardware.audio.common-util\",\"android.hidl.memory@1.0\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\",\"android.hardware.audio.effect@6.0\",\"android.hardware.audio.effect@6.0-util\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio.effect@6.0-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/effect/all-versions/default/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"android.hardware.audio@6.0-impl\",\n  relative_install_path: \"hw\",\n  proprietary: true,\n  vendor: true,\n  static_libs: [\"libaudiofoundation\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libfmq\",\"libhardware\",\"libhidlbase\",\"liblog\",\"libmedia_helper\",\"libutils\",\"android.hardware.audio.common-util\",\"android.hardware.audio@6.0\",\"android.hardware.audio@6.0-util\",\"android.hardware.audio.common@6.0\",\"android.hardware.audio.common@6.0-util\"],\n  header_libs: [\"android.hardware.audio-impl_headers\"],\n  export_header_lib_headers: [\"android.hardware.audio-impl_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.audio@6.0-impl.so\"],\n}\n" >> prebuiltlibs/hardware/interfaces/audio/core/all-versions/default/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.hardware.security.keymint-service\",\n  relative_install_path: \"hw\",\n  init_rc: [\"android.hardware.security.keymint-service.rc\"],\n  vintf_fragments: [\"android.hardware.security.keymint-service.xml\",\"android.hardware.security.sharedsecret-service.xml\",\"android.hardware.security.secureclock-service.xml\"],\n  vendor: true,\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcppbor_external\",\"libcrypto\",\"libkeymaster_portable\",\"libkeymint\",\"liblog\",\"libpuresoftkeymasterdevice\",\"libutils\"],\n  required: [\"RemoteProvisioner\",\"android.hardware.hardware_keystore.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.security.keymint-service\"],\n}\n" >> prebuiltlibs/hardware/interfaces/security/keymint/aidl/default/Android.bp
printf "\n" >> prebuiltlibs/hardware/interfaces/security/secureclock/aidl/Android.bp
printf "\n" >> prebuiltlibs/hardware/interfaces/security/keymint/aidl/Android.bp
printf "\n" >> prebuiltlibs/hardware/interfaces/security/sharedsecret/aidl/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-10
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-10.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so \
  out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so \
  

mkdir -p prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_64_shared/audio.r_submix.default.so
mkdir -p prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/audio.r_submix.default/android_vendor.31_x86_x86_64_shared/audio.r_submix.default.so

printf "cc_prebuilt_library_shared {\n  name: \"audio.r_submix.default\",\n  relative_install_path: \"hw\",\n  vendor: true,\n  shared_libs: [\"liblog\",\"libcutils\",\"libmedia_helper\",\"libnbaio_mono\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"audio.r_submix.default.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware/modules/audio_remote_submix/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/libhardware/ninja && rsync -ar out/soong/ninja/hardware/libhardware/ prebuiltlibs/hardware/libhardware/ninja/hardware_libhardware-10
touch prebuiltlibs/hardware/libhardware/ninja/.find-ignore
tar cfJ hardware_libhardware-10.tar.xz -C prebuiltlibs/hardware/libhardware/ .
ls -l hardware_libhardware-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so \
  out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a \
  

mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_vendor.31_x86_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so prebuiltlibs/hardware/libhardware_legacy/libhardware_legacy/android_x86_x86_64_shared/libhardware_legacy.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_vendor.31_x86_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_static/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_shared/libpower.so
mkdir -p prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a prebuiltlibs/hardware/libhardware_legacy/libpower/android_x86_x86_64_static/libpower.a
mkdir -p prebuiltlibs/hardware/libhardware_legacy/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/libhardware_legacy/include/ prebuiltlibs/hardware/libhardware_legacy/include

printf "cc_prebuilt_library_shared {\n  name: \"libhardware_legacy\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend@1.0\",\"libdl\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  header_libs: [\"libhardware_legacy_headers\"],\n  export_header_lib_headers: [\"libhardware_legacy_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libhardware_legacy.so\"],\n}\n" >> prebuiltlibs/hardware/libhardware_legacy/Android.bp
printf "cc_prebuilt_library {\n  name: \"libpower\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend@1.0\"],\n  export_include_dirs: [\"include\"],\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libpower.a\"],\n  },\n  shared: {\n    srcs: [\"libpower.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/libhardware_legacy/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/libhardware_legacy/ninja && rsync -ar out/soong/ninja/hardware/libhardware_legacy/ prebuiltlibs/hardware/libhardware_legacy/ninja/hardware_libhardware_legacy-10
touch prebuiltlibs/hardware/libhardware_legacy/ninja/.find-ignore
tar cfJ hardware_libhardware_legacy-10.tar.xz -C prebuiltlibs/hardware/libhardware_legacy/ .
ls -l hardware_libhardware_legacy-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so \
  

mkdir -p prebuiltlibs/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/ && mv out/soong/.intermediates/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so prebuiltlibs/packages/apps/Bluetooth/libbluetooth_jni/android_x86_64_shared/libbluetooth_jni.so

printf "cc_prebuilt_library_shared {\n  name: \"libbluetooth_jni\",\n  shared_libs: [\"libbase\",\"libchrome\",\"liblog\",\"libnativehelper\"],\n  static_libs: [\"libbluetooth-types\"],\n  sanitize: {\n    scs: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbluetooth_jni.so\"],\n}\n" >> prebuiltlibs/packages/apps/Bluetooth/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/apps/Bluetooth/ninja && rsync -ar out/soong/ninja/packages/apps/Bluetooth/ prebuiltlibs/packages/apps/Bluetooth/ninja/packages_apps_Bluetooth-10
touch prebuiltlibs/packages/apps/Bluetooth/ninja/.find-ignore
tar cfJ packages_apps_Bluetooth-10.tar.xz -C prebuiltlibs/packages/apps/Bluetooth/ .
ls -l packages_apps_Bluetooth-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust/android_x86_64_rlib_rlib-std_apex10000/libandroid_system_virtmanager.rlib \
  out/soong/.intermediates/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager \
  out/soong/.intermediates/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm \
  out/soong/.intermediates/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server \
  

mkdir -p prebuiltlibs/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust/android_x86_64_rlib_rlib-std_apex10000/libandroid_system_virtmanager.rlib prebuiltlibs/packages/modules/Virtualization/virtmanager/aidl/android.system.virtmanager-rust/android_x86_64_rlib_rlib-std_apex10000/android.system.virtmanager-rust.rlib
mkdir -p prebuiltlibs/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager prebuiltlibs/packages/modules/Virtualization/virtmanager/virtmanager/android_x86_64_apex10000/virtmanager
mkdir -p prebuiltlibs/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm prebuiltlibs/packages/modules/Virtualization/vm/vm/android_x86_64_apex10000/vm
mkdir -p prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/ && mv out/soong/.intermediates/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/fd_server/android_x86_64_apex10000/fd_server

printf "\n" >> prebuiltlibs/packages/modules/Virtualization/virtmanager/aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"virtmanager\",\n  stl: \"none\",\n  prefer: true,\n  apex_available: [\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"virtmanager\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/virtmanager/Android.bp
printf "cc_prebuilt_binary {\n  name: \"vm\",\n  stl: \"none\",\n  prefer: true,\n  apex_available: [\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"vm\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/vm/Android.bp
printf "cc_prebuilt_binary {\n  name: \"fd_server\",\n  stl: \"none\",\n  prefer: true,\n  apex_available: [\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"fd_server\"],\n}\n" >> prebuiltlibs/packages/modules/Virtualization/authfs/fd_server/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/packages/modules/Virtualization/ninja && rsync -ar out/soong/ninja/packages/modules/Virtualization/ prebuiltlibs/packages/modules/Virtualization/ninja/packages_modules_Virtualization-10
touch prebuiltlibs/packages/modules/Virtualization/ninja/.find-ignore
tar cfJ packages_modules_Virtualization-10.tar.xz -C prebuiltlibs/packages/modules/Virtualization/ .
ls -l packages_modules_Virtualization-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a \
  out/soong/.intermediates/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a \
  out/soong/.intermediates/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a \
  out/soong/.intermediates/system/apex/apexd/apexd/android_x86_64/apexd \
  

mkdir -p prebuiltlibs/system/apex/apexd/libapexd/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a prebuiltlibs/system/apex/apexd/libapexd/android_x86_64_static/libapexd.a
mkdir -p prebuiltlibs/system/apex/apexd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/apex/apexd/ prebuiltlibs/system/apex/apexd/
mkdir -p prebuiltlibs/system/apex/apexd/libapexservice/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a prebuiltlibs/system/apex/apexd/libapexservice/android_x86_64_static/libapexservice.a
mkdir -p prebuiltlibs/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/ && mv out/soong/.intermediates/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a prebuiltlibs/system/apex/apexd/libapexd_checkpoint_vold/android_x86_64_static/libapexd_checkpoint_vold.a
mkdir -p prebuiltlibs/system/apex/apexd/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/apex/apexd/ prebuiltlibs/system/apex/apexd/
mkdir -p prebuiltlibs/system/apex/apexd/apexd/android_x86_64/ && mv out/soong/.intermediates/system/apex/apexd/apexd/android_x86_64/apexd prebuiltlibs/system/apex/apexd/apexd/android_x86_64/apexd

printf "cc_prebuilt_library_static {\n  name: \"libapexd\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\",\"libapex\",\"libdm\",\"libext2_uuid\",\"libverity_tree\",\"libvold_binder\",\"libxml2\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexd.a\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapexservice\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"apex_aidl_interface-cpp\",\"libutils\"],\n  static_libs: [\"lib_apex_session_state_proto\",\"lib_apex_manifest_proto\",\"libavb\",\"libapex\",\"libdm\",\"libext2_uuid\",\"libverity_tree\",\"libvold_binder\",\"libxml2\",\"libapexd\"],\n  static: {\n    whole_static_libs: [\"libc++fs\"],\n  },\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexservice.a\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libapexd_checkpoint_vold\",\n  static_libs: [\"libbase\",\"libutils\",\"libvold_binder\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libapexd_checkpoint_vold.a\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"apexd\",\n  shared_libs: [\"libbase\",\"libcrypto\",\"libcutils\",\"libprotobuf-cpp-full\",\"libziparchive\",\"libselinux\",\"libbinder\",\"liblog\",\"liblogwrap\",\"apex_aidl_interface-cpp\",\"libutils\"],\n  whole_static_libs: [\"com.android.sysprop.apex\"],\n  init_rc: [\"apexd.rc\"],\n  bootstrap: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"apexd\"],\n}\n" >> prebuiltlibs/system/apex/apexd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/apex/ninja && rsync -ar out/soong/ninja/system/apex/ prebuiltlibs/system/apex/ninja/system_apex-10
touch prebuiltlibs/system/apex/ninja/.find-ignore
tar cfJ system_apex-10.tar.xz -C prebuiltlibs/system/apex/ .
ls -l system_apex-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux \
  out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a \
  out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a \
  

mkdir -p prebuiltlibs/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/ && mv out/soong/.intermediates/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux prebuiltlibs/system/bt/vendor_libs/linux/interface/android.hardware.bluetooth@1.1-service.btlinux/android_vendor.31_x86_64/android.hardware.bluetooth@1.1-service.btlinux
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_64_static/libbt_hidl_hal_cxx.a
mkdir -p prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a prebuiltlibs/system/bt/gd/rust/hal/libbt_hidl_hal_cxx/android_x86_x86_64_static/libbt_hidl_hal_cxx.a

printf "cc_prebuilt_binary {\n  name: \"android.hardware.bluetooth@1.1-service.btlinux\",\n  proprietary: true,\n  relative_install_path: \"hw\",\n  shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libbase\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  init_rc: [\"android.hardware.bluetooth@1.1-service.btlinux.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.hardware.bluetooth@1.1-service.btlinux\"],\n}\n" >> prebuiltlibs/system/bt/vendor_libs/linux/interface/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbt_hidl_hal_cxx\",\n  target: {\n    darwin: {\n      enabled: false,\n    },\n  },\n  shared_libs: [\"android.hardware.bluetooth@1.0\",\"android.hardware.bluetooth@1.1\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbt_hidl_hal_cxx.a\"],\n}\n" >> prebuiltlibs/system/bt/gd/rust/hal/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/bt/ninja && rsync -ar out/soong/ninja/system/bt/ prebuiltlibs/system/bt/ninja/system_bt-10
touch prebuiltlibs/system/bt/ninja/.find-ignore
tar cfJ system_bt-10.tar.xz -C prebuiltlibs/system/bt/ .
ls -l system_bt-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/connectivity/wificond/wificond/android_x86_64/wificond \
  

mkdir -p prebuiltlibs/system/connectivity/wificond/wificond/android_x86_64/ && mv out/soong/.intermediates/system/connectivity/wificond/wificond/android_x86_64/wificond prebuiltlibs/system/connectivity/wificond/wificond/android_x86_64/wificond

printf "cc_prebuilt_binary {\n  name: \"wificond\",\n  init_rc: [\"wificond.rc\"],\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"android.security.legacykeystore-ndk_platform\",\"libbinder\",\"libbinder_ndk\",\"libbase\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"libminijail\",\"libssl\",\"libutils\",\"libwifi-system-iface\",\"android.system.wifi.keystore@1.0\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"wificond\"],\n}\n" >> prebuiltlibs/system/connectivity/wificond/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/connectivity/wificond/ninja && rsync -ar out/soong/ninja/system/connectivity/wificond/ prebuiltlibs/system/connectivity/wificond/ninja/system_connectivity_wificond-10
touch prebuiltlibs/system/connectivity/wificond/ninja/.find-ignore
tar cfJ system_connectivity_wificond-10.tar.xz -C prebuiltlibs/system/connectivity/wificond/ .
ls -l system_connectivity_wificond-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/core/bootstat/bootstat/android_x86_64/bootstat \
  out/soong/.intermediates/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd \
  out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a \
  out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a \
  out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a \
  out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a \
  out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump64 \
  out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump32 \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so \
  out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so \
  out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/libinit.a \
  out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/libinit.a \
  out/soong/.intermediates/system/core/init/init_second_stage/android_x86_64/init \
  out/soong/.intermediates/system/core/init/init_second_stage/android_recovery_x86_64/init \
  out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a \
  out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl \
  out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a \
  out/soong/.intermediates/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd \
  out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a \
  out/soong/.intermediates/system/core/storaged/storaged/android_x86_64/storaged \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so \
  out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a \
  out/soong/.intermediates/system/core/usbd/usbd/android_x86_64/usbd \
  

mkdir -p prebuiltlibs/system/core/bootstat/bootstat/android_x86_64/ && mv out/soong/.intermediates/system/core/bootstat/bootstat/android_x86_64/bootstat prebuiltlibs/system/core/bootstat/bootstat/android_x86_64/bootstat
mkdir -p prebuiltlibs/system/core/gatekeeperd/gatekeeperd/android_x86_64/ && mv out/soong/.intermediates/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd prebuiltlibs/system/core/gatekeeperd/gatekeeperd/android_x86_64/gatekeeperd
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_vendor.31_x86_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_recovery_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/libbatterymonitor/android_x86_64_static/ && mv out/soong/.intermediates/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a prebuiltlibs/system/core/healthd/libbatterymonitor/android_x86_64_static/libbatterymonitor.a
mkdir -p prebuiltlibs/system/core/healthd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/healthd/include/ prebuiltlibs/system/core/healthd/include
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static_apex10000/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static_apex10000/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_recovery_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_vendor_ramdisk_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a prebuiltlibs/system/core/debuggerd/libdebuggerd/android_x86_x86_64_static/libdebuggerd.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/libdebuggerd/include/ prebuiltlibs/system/core/debuggerd/libdebuggerd/include
mkdir -p prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_64_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump64 prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_64_apex10000/crash_dump
mkdir -p prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump32 prebuiltlibs/system/core/debuggerd/crash_dump/android_x86_x86_64_apex10000/crash_dump
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static_apex10000/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static_apex10000/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_recovery_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_core/android_x86_x86_64_static/libdebuggerd_handler_core.a
mkdir -p prebuiltlibs/system/core/debuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/include/ prebuiltlibs/system/core/debuggerd/include
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static_apex10000/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static_apex10000/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_recovery_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_vendor_ramdisk_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a prebuiltlibs/system/core/debuggerd/libdebuggerd_handler_fallback/android_x86_x86_64_static/libdebuggerd_handler_fallback.a
mkdir -p prebuiltlibs/system/core/debuggerd/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/debuggerd/include/ prebuiltlibs/system/core/debuggerd/include
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_static/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_x86_64_static_apex29/libgrallocusage.a
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_64_shared/libgrallocusage.so
mkdir -p prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so prebuiltlibs/system/core/libgrallocusage/libgrallocusage/android_vendor.31_x86_x86_64_shared/libgrallocusage.so
mkdir -p prebuiltlibs/system/core/libgrallocusage/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/libgrallocusage/include/ prebuiltlibs/system/core/libgrallocusage/include
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_static/ && mv out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/libinit.a prebuiltlibs/system/core/init/libinit/android_x86_64_static/libinit.a
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/libinit.a prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/libinit.a
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/init/libinit/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/init/libinit/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/init/libinit/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/init/init_second_stage/android_x86_64/ && mv out/soong/.intermediates/system/core/init/init_second_stage/android_x86_64/init prebuiltlibs/system/core/init/init_second_stage/android_x86_64/init_second_stage
mkdir -p prebuiltlibs/system/core/init/init_second_stage/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/init/init_second_stage/android_recovery_x86_64/init prebuiltlibs/system/core/init/init_second_stage/android_recovery_x86_64/init_second_stage
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/libsnapshot.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl prebuiltlibs/system/core/fs_mgr/libsnapshot/snapshotctl/android_x86_64/snapshotctl
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/libsnapshot_nobinder.a
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/fs_mgr/libsnapshot/include/ prebuiltlibs/system/core/fs_mgr/libsnapshot/include
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/
mkdir -p prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_static/gen/proto prebuiltlibs/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/system/core/fastboot/fastbootd/android_recovery_x86_64/ && mv out/soong/.intermediates/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd prebuiltlibs/system/core/fastboot/fastbootd/android_recovery_x86_64/fastbootd
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && mv out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/libstoraged.a
mkdir -p prebuiltlibs/system/core/storaged/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/core/storaged/include/ prebuiltlibs/system/core/storaged/include
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/gen/aidl prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/ && rsync -ar out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/gen/proto prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_static/
mkdir -p prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/core/storaged/libstoraged/android_x86_64_static/gen/proto prebuiltlibs/system/core/storaged/libstoraged/android_x86_64_shared/
mkdir -p prebuiltlibs/system/core/storaged/storaged/android_x86_64/ && mv out/soong/.intermediates/system/core/storaged/storaged/android_x86_64/storaged prebuiltlibs/system/core/storaged/storaged/android_x86_64/storaged
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_vendor.31_x86_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_shared/libutilscallstack.so
mkdir -p prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a prebuiltlibs/system/core/libutils/libutilscallstack/android_x86_x86_64_static/libutilscallstack.a
mkdir -p prebuiltlibs/system/core/usbd/usbd/android_x86_64/ && mv out/soong/.intermediates/system/core/usbd/usbd/android_x86_64/usbd prebuiltlibs/system/core/usbd/usbd/android_x86_64/usbd

printf "cc_prebuilt_binary {\n  name: \"bootstat\",\n  shared_libs: [\"libbase\",\"libcutils\",\"liblog\",\"libstatslog\"],\n  init_rc: [\"bootstat.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bootstat\"],\n}\n" >> prebuiltlibs/system/core/bootstat/Android.bp
printf "cc_prebuilt_binary {\n  name: \"gatekeeperd\",\n  shared_libs: [\"libbinder\",\"libbinder_ndk\",\"libgatekeeper\",\"libgsi\",\"liblog\",\"libhardware\",\"libbase\",\"libutils\",\"libcrypto\",\"libhidlbase\",\"android.hardware.gatekeeper@1.0\",\"libgatekeeper_aidl\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.security.authorization-ndk_platform\"],\n  init_rc: [\"gatekeeperd.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gatekeeperd\"],\n}\n" >> prebuiltlibs/system/core/gatekeeperd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libbatterymonitor\",\n  vendor_available: true,\n  recovery_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libutils\",\"libbase\",\"android.hardware.health@2.1\"],\n  header_libs: [\"libhealthd_headers\"],\n  export_header_lib_headers: [\"libhealthd_headers\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libbatterymonitor.a\"],\n}\n" >> prebuiltlibs/system/core/healthd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdebuggerd\",\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  export_include_dirs: [\"libdebuggerd/include\"],\n  static_libs: [\"libdexfile_support\",\"libunwindstack\",\"liblzma\",\"libbase\",\"libcutils\",\"liblog\"],\n  whole_static_libs: [\"libasync_safe\",\"gwp_asan_crash_handler\",\"libscudo\",\"libtombstone_proto\",\"libprocinfo\",\"libprotobuf-cpp-lite\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libdexfile_support\"],\n    },\n    vendor_ramdisk: {\n      exclude_static_libs: [\"libdexfile_support\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"crash_dump\",\n  compile_multilib: \"both\",\n  multilib: {\n    lib32: {\n      suffix: \"32\",\n    },\n    lib64: {\n      suffix: \"64\",\n    },\n  },\n  shared_libs: [\"libbase\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n  apex_available: [\"com.android.runtime\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"crash_dump\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdebuggerd_handler_core\",\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  header_libs: [\"libdebuggerd_common_headers\"],\n  whole_static_libs: [\"libasync_safe\",\"libcutils\",\"libdebuggerd\"],\n  export_header_lib_headers: [\"libdebuggerd_common_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd_handler_core.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libdebuggerd_handler_fallback\",\n  visibility: [\"//bionic/linker\"],\n  apex_available: [\"com.android.runtime\",\"//apex_available:platform\"],\n  recovery_available: true,\n  vendor_ramdisk_available: true,\n  whole_static_libs: [\"libdebuggerd_handler_core\",\"libtombstoned_client_static\",\"libasync_safe\",\"libbase\",\"libdebuggerd\",\"libunwindstack_no_dex\",\"liblzma\",\"libcutils\"],\n  header_libs: [\"bionic_libc_platform_headers\"],\n  export_header_lib_headers: [\"bionic_libc_platform_headers\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libdebuggerd_handler_fallback.a\"],\n}\n" >> prebuiltlibs/system/core/debuggerd/Android.bp
printf "cc_prebuilt_library {\n  name: \"libgrallocusage\",\n  vendor_available: true,\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"android.hardware.graphics.allocator@2.0\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libgrallocusage.a\"],\n  },\n  shared: {\n    srcs: [\"libgrallocusage.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libgrallocusage/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libinit\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libavb\",\"libc++fs\",\"libcgrouprc_format\",\"liblmkd_utils\",\"libmodprobe\",\"libprocinfo\",\"libprotobuf-cpp-lite\",\"libpropertyinfoserializer\",\"libpropertyinfoparser\",\"libsnapshot_cow\",\"libsnapshot_init\",\"libxml2\",\"lib_apex_manifest_proto_lite\",\"update_metadata-protos\"],\n  shared_libs: [\"libbacktrace\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libdl\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidl-gen-utils\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"liblp\",\"libprocessgroup\",\"libprocessgroup_setup\",\"libselinux\",\"libutils\",\"libprotobuf-cpp-lite\"],\n  bootstrap: true,\n  visibility: [\":__subpackages__\"],\n  recovery_available: true,\n  whole_static_libs: [\"libcap\",\"com.android.sysprop.apex\",\"com.android.sysprop.init\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libxml2\"],\n      exclude_shared_libs: [\"libbinder\",\"libutils\"],\n    },\n  },\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libinit.a\"],\n}\n" >> prebuiltlibs/system/core/init/Android.bp
printf "cc_prebuilt_binary {\n  name: \"init_second_stage\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\"],\n  },\n  shared_libs: [\"libbacktrace\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libdl\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidl-gen-utils\",\"libkeyutils\",\"liblog\",\"liblogwrap\",\"liblp\",\"libprocessgroup\",\"libprocessgroup_setup\",\"libselinux\",\"libutils\"],\n  bootstrap: true,\n  visibility: [\"//packages/modules/Virtualization/microdroid\"],\n  recovery_available: true,\n  stem: \"init\",\n  required: [\"e2fsdroid\",\"init.rc\",\"mke2fs\",\"sload_f2fs\",\"make_f2fs\",\"ueventd.rc\"],\n  symlinks: [\"ueventd\"],\n  target: {\n    recovery: {\n      exclude_static_libs: [\"libxml2\"],\n      exclude_shared_libs: [\"libbinder\",\"libutils\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"init_second_stage\"],\n}\n" >> prebuiltlibs/system/core/init/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsnapshot\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libchrome\",\"libcutils\",\"liblog\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libdm\",\"libfstab\",\"update_metadata-protos\",\"libfs_mgr_binder\"],\n  whole_static_libs: [\"libbrotli\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfstab\",\"libsnapshot_cow\",\"libsnapshot_snapuserd\",\"libz\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_static_lib_headers: [\"update_metadata-protos\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_binary {\n  name: \"snapshotctl\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libbase\",\"libbinder\",\"libext2_uuid\",\"libext4_utils\",\"libfs_mgr_binder\",\"libhidlbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-lite\",\"libstatslog\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"snapshotctl\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsnapshot_nobinder\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  shared_libs: [\"libbase\",\"libchrome\",\"libcutils\",\"liblog\",\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"libprotobuf-cpp-lite\"],\n  static_libs: [\"libbrotli\",\"libdm\",\"libfstab\",\"update_metadata-protos\",\"libfs_mgr\"],\n  whole_static_libs: [\"libbrotli\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfstab\",\"libsnapshot_cow\",\"libsnapshot_snapuserd\",\"libz\"],\n  header_libs: [\"libfiemap_headers\"],\n  export_static_lib_headers: [\"update_metadata-protos\"],\n  export_header_lib_headers: [\"libfiemap_headers\"],\n  export_include_dirs: [\"include\"],\n  recovery_available: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsnapshot_nobinder.a\"],\n}\n" >> prebuiltlibs/system/core/fs_mgr/libsnapshot/Android.bp
printf "cc_prebuilt_binary {\n  name: \"fastbootd\",\n  recovery: true,\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"android.hardware.fastboot@1.1\",\"android.hardware.health@2.0\",\"libasyncio\",\"libbase\",\"libbootloader_message\",\"libcutils\",\"libext2_uuid\",\"libext4_utils\",\"libfs_mgr\",\"libgsi\",\"libhidlbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-lite\",\"libsparse\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"fastbootd\"],\n}\n" >> prebuiltlibs/system/core/fastboot/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libstoraged\",\n  shared_libs: [\"android.hardware.health@1.0\",\"android.hardware.health@2.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libsysutils\",\"libutils\",\"libz\"],\n  static_libs: [\"libhealthhalutils\"],\n  logtags: [\"EventLogTags.logtags\"],\n  export_include_dirs: [\"include\"],\n  prebuilt_proto: true,\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libstoraged.a\"],\n}\n" >> prebuiltlibs/system/core/storaged/Android.bp
printf "cc_prebuilt_binary {\n  name: \"storaged\",\n  shared_libs: [\"android.hardware.health@1.0\",\"android.hardware.health@2.0\",\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libprotobuf-cpp-lite\",\"libsysutils\",\"libutils\",\"libz\"],\n  init_rc: [\"storaged.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"storaged\"],\n}\n" >> prebuiltlibs/system/core/storaged/Android.bp
printf "cc_prebuilt_library {\n  name: \"libutilscallstack\",\n  vendor_available: true,\n  product_available: true,\n  recovery_available: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  host_supported: true,\n  header_libs: [\"libutils_headers\"],\n  export_header_lib_headers: [\"libutils_headers\"],\n  shared_libs: [\"libcutils\",\"liblog\",\"libutils\",\"libbacktrace\"],\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  target: {\n    android: {\n      shared_libs: [\"libprocessgroup\",\"libdl\",\"libvndksupport\"],\n      sanitize: {\n        misc_undefined: [\"integer\"],\n      },\n    },\n    recovery: {\n      exclude_shared_libs: [\"libvndksupport\"],\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    windows: {\n      enabled: false,\n    },\n    linux: {\n    },\n  },\n  native_bridge_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libutilscallstack.a\"],\n  },\n  shared: {\n    srcs: [\"libutilscallstack.so\"],\n  },\n}\n" >> prebuiltlibs/system/core/libutils/Android.bp
printf "cc_prebuilt_binary {\n  name: \"usbd\",\n  init_rc: [\"usbd.rc\"],\n  shared_libs: [\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\",\"libhardware\",\"android.hardware.usb.gadget@1.0\",\"libcutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"usbd\"],\n}\n" >> prebuiltlibs/system/core/usbd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/core/ninja && rsync -ar out/soong/ninja/system/core/ prebuiltlibs/system/core/ninja/system_core-10
touch prebuiltlibs/system/core/ninja/.find-ignore
tar cfJ system_core-10.tar.xz -C prebuiltlibs/system/core/ .
ls -l system_core-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/extras/bootctl/bootctl/android_x86_64/bootctl \
  out/soong/.intermediates/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so \
  out/soong/.intermediates/system/extras/partition_tools/lpdump/android_x86_64/lpdump \
  out/soong/.intermediates/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd \
  out/soong/.intermediates/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a \
  out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so \
  out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a \
  out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib \
  out/soong/.intermediates/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf \
  out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/liblibprofcollectd.dylib.so \
  out/soong/.intermediates/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl \
  out/soong/.intermediates/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd \
  

mkdir -p prebuiltlibs/system/extras/bootctl/bootctl/android_x86_64/ && mv out/soong/.intermediates/system/extras/bootctl/bootctl/android_x86_64/bootctl prebuiltlibs/system/extras/bootctl/bootctl/android_x86_64/bootctl
mkdir -p prebuiltlibs/system/extras/partition_tools/liblpdump/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so prebuiltlibs/system/extras/partition_tools/liblpdump/android_x86_64_shared/liblpdump.so
mkdir -p prebuiltlibs/system/extras/partition_tools/lpdump/android_x86_64/ && mv out/soong/.intermediates/system/extras/partition_tools/lpdump/android_x86_64/lpdump prebuiltlibs/system/extras/partition_tools/lpdump/android_x86_64/lpdump
mkdir -p prebuiltlibs/system/extras/partition_tools/lpdumpd/android_x86_64/ && mv out/soong/.intermediates/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd prebuiltlibs/system/extras/partition_tools/lpdumpd/android_x86_64/lpdumpd
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a prebuiltlibs/system/extras/simpleperf/libsimpleperf/android_x86_64_static/libsimpleperf.a
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/ && mv out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_shared/libsimpleperf_profcollect.so
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/ && mv out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect/android_x86_64_static/libsimpleperf_profcollect.a
mkdir -p prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/ && mv out/soong/.intermediates/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib prebuiltlibs/system/extras/simpleperf/libsimpleperf_profcollect_rust/android_x86_64_rlib_dylib-std/libsimpleperf_profcollect_rust.rlib
mkdir -p prebuiltlibs/system/extras/simpleperf/simpleperf/android_x86_64/ && mv out/soong/.intermediates/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf prebuiltlibs/system/extras/simpleperf/simpleperf/android_x86_64/simpleperf
mkdir -p prebuiltlibs/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/ && mv out/soong/.intermediates/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/liblibprofcollectd.dylib.so prebuiltlibs/system/extras/profcollectd/libprofcollectd/libprofcollectd/android_x86_64_dylib/libprofcollectd.dylib.so
mkdir -p prebuiltlibs/system/extras/profcollectd/profcollectctl/android_x86_64/ && mv out/soong/.intermediates/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl prebuiltlibs/system/extras/profcollectd/profcollectctl/android_x86_64/profcollectctl
mkdir -p prebuiltlibs/system/extras/profcollectd/profcollectd/android_x86_64/ && mv out/soong/.intermediates/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd prebuiltlibs/system/extras/profcollectd/profcollectd/android_x86_64/profcollectd

printf "cc_prebuilt_binary {\n  name: \"bootctl\",\n  shared_libs: [\"android.hardware.boot@1.0\",\"android.hardware.boot@1.1\",\"android.hardware.boot@1.2\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"bootctl\"],\n}\n" >> prebuiltlibs/system/extras/bootctl/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"liblpdump\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"libcutils\",\"libfs_mgr\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\",\"liblp\",\"libprotobuf-cpp-full\"],\n  static_libs: [\"libjsonpbparse\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"liblpdump.so\"],\n}\n" >> prebuiltlibs/system/extras/partition_tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"lpdump\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    android: {\n      shared_libs: [\"liblpdump_interface-cpp\",\"libbinder\",\"libutils\"],\n      required: [\"lpdumpd\"],\n    },\n    host: {\n      shared_libs: [\"liblpdump\"],\n    },\n  },\n  host_supported: true,\n  shared_libs: [\"libbase\",\"liblog\",\"liblp\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lpdump\"],\n}\n" >> prebuiltlibs/system/extras/partition_tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"lpdumpd\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  init_rc: [\"lpdumpd.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"liblog\",\"liblp\",\"liblpdump\",\"liblpdump_interface-cpp\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"lpdumpd\"],\n}\n" >> prebuiltlibs/system/extras/partition_tools/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libsimpleperf\",\n  target: {\n    linux: {\n      static_libs: [\"libunwindstack\",\"libcutils\",\"libprocinfo\",\"libevent\",\"libc++fs\",\"libdexfile_support\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    host: {\n      stl: \"libc++_static\",\n    },\n    android: {\n      static_libs: [\"libc\"],\n    },\n  },\n  static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\",\"liblzma\",\"libz\",\"libziparchive\",\"libsimpleperf_etm_decoder\",\"libbase\",\"liblog\",\"libutils\",\"libprotobuf-cpp-lite\",\"libopencsd_decoder\",\"libbuildversion\"],\n  host_supported: true,\n  use_version_lib: false,\n  compile_multilib: \"both\",\n  shared_libs: [\"libprotobuf-cpp-lite\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libsimpleperf.a\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "cc_prebuilt_library {\n  name: \"libsimpleperf_profcollect\",\n  target: {\n    host: {\n      static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux: {\n      shared_libs: [\"libcutils\",\"libevent\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n      static_libs: [\"libc++fs\",\"libdexfile_support\"],\n    },\n  },\n  host_supported: false,\n  shared_libs: [\"libbase\",\"liblzma\",\"libprotobuf-cpp-lite\",\"libziparchive\",\"libLLVM_android\"],\n  static_libs: [\"libsimpleperf_etm_decoder\",\"libopencsd_decoder\",\"libsimpleperf\"],\n  use_version_lib: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libsimpleperf_profcollect.a\"],\n  },\n  shared: {\n    srcs: [\"libsimpleperf_profcollect.so\"],\n  },\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libsimpleperf_profcollect_rust\",\n  crate_name: \"simpleperf_profcollect\",\n  rlibs: [\"libsimpleperf_profcollect_bindgen\"],\n  shared_libs: [\"libsimpleperf_profcollect\"],\n  visibility: [\"//system/extras/profcollectd:__subpackages__\"],\n  multiple_variants: true,\n  srcs: [\"libsimpleperf_profcollect_rust.rlib\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "cc_prebuilt_binary {\n  name: \"simpleperf\",\n  target: {\n    host: {\n      static_libs: [\"libLLVMObject\",\"libLLVMBitReader\",\"libLLVMMC\",\"libLLVMMCParser\",\"libLLVMCore\",\"libLLVMSupport\"],\n    },\n    darwin: {\n    },\n    windows: {\n      enabled: true,\n    },\n    linux: {\n      shared_libs: [\"libcutils\",\"libevent\",\"liblog\",\"libprocinfo\",\"libunwindstack\"],\n      static_libs: [\"libc++fs\",\"libdexfile_support\"],\n    },\n    android: {\n      shared_libs: [\"libLLVM_android\"],\n    },\n  },\n  host_supported: false,\n  shared_libs: [\"libbase\",\"liblzma\",\"libprotobuf-cpp-lite\",\"libziparchive\"],\n  use_version_lib: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"simpleperf\"],\n}\n" >> prebuiltlibs/system/extras/simpleperf/Android.bp
printf "rust_prebuilt_library {\n  name: \"libprofcollectd\",\n  stem: \"liblibprofcollectd\",\n  crate_name: \"libprofcollectd\",\n  rustlibs: [\"profcollectd_aidl_interface-rust\",\"libandroid_logger\",\"libanyhow\",\"libbinder_rs\",\"libchrono\",\"liblazy_static\",\"liblog_rust\",\"libmacaddr\",\"librand\",\"libserde\",\"libserde_json\",\"libuuid\",\"libzip\"],\n  rlibs: [\"libprofcollect_libflags_rust\",\"libprofcollect_libbase_rust\",\"libsimpleperf_profcollect_rust\"],\n  shared_libs: [\"libsimpleperf_profcollect\"],\n  multiple_variants: true,\n  srcs: [\"libprofcollectd.dylib.so\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/libprofcollectd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"profcollectctl\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"profcollectctl\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/Android.bp
printf "cc_prebuilt_binary {\n  name: \"profcollectd\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  srcs: [\"profcollectd\"],\n}\n" >> prebuiltlibs/system/extras/profcollectd/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/extras/ninja && rsync -ar out/soong/ninja/system/extras/ prebuiltlibs/system/extras/ninja/system_extras-10
touch prebuiltlibs/system/extras/ninja/.find-ignore
tar cfJ system_extras-10.tar.xz -C prebuiltlibs/system/extras/ .
ls -l system_extras-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/gsid/gsid/android_x86_64/gsid \
  

mkdir -p prebuiltlibs/system/gsid/gsid/android_x86_64/ && mv out/soong/.intermediates/system/gsid/gsid/android_x86_64/gsid prebuiltlibs/system/gsid/gsid/android_x86_64/gsid

printf "cc_prebuilt_binary {\n  name: \"gsid\",\n  required: [\"mke2fs\"],\n  init_rc: [\"gsid.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libcrypto\",\"liblog\"],\n  target: {\n    android: {\n      shared_libs: [\"libprocessgroup\",\"libvndksupport\"],\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"gsid\"],\n}\n" >> prebuiltlibs/system/gsid/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/gsid/ninja && rsync -ar out/soong/ninja/system/gsid/ prebuiltlibs/system/gsid/ninja/system_gsid-10
touch prebuiltlibs/system/gsid/ninja/.find-ignore
tar cfJ system_gsid-10.tar.xz -C prebuiltlibs/system/gsid/ .
ls -l system_gsid-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so \
  out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so \
  out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so \
  out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so \
  

mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_x86_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so prebuiltlibs/system/memory/libmemtrack/libmemtrack/android_vendor.31_x86_x86_64_shared/libmemtrack.so
mkdir -p prebuiltlibs/system/memory/libmemtrack/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/memory/libmemtrack/include/ prebuiltlibs/system/memory/libmemtrack/include

printf "cc_prebuilt_library_shared {\n  name: \"libmemtrack\",\n  vendor_available: true,\n  vndk: {\n    enabled: true,\n  },\n  export_include_dirs: [\"include\"],\n  shared_libs: [\"libbinder_ndk\",\"libhardware\",\"liblog\",\"libbase\",\"libhidlbase\",\"libutils\",\"android.hardware.memtrack@1.0\",\"android.hardware.memtrack-V1-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmemtrack.so\"],\n}\n" >> prebuiltlibs/system/memory/libmemtrack/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/memory/libmemtrack/ninja && rsync -ar out/soong/ninja/system/memory/libmemtrack/ prebuiltlibs/system/memory/libmemtrack/ninja/system_memory_libmemtrack-10
touch prebuiltlibs/system/memory/libmemtrack/ninja/.find-ignore
tar cfJ system_memory_libmemtrack-10.tar.xz -C prebuiltlibs/system/memory/libmemtrack/ .
ls -l system_memory_libmemtrack-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/netd/server/ndc/android_x86_64_cfi/ndc \
  out/soong/.intermediates/system/netd/server/netd/android_x86_64_cfi/netd \
  

mkdir -p prebuiltlibs/system/netd/server/ndc/android_x86_64_cfi/ && mv out/soong/.intermediates/system/netd/server/ndc/android_x86_64_cfi/ndc prebuiltlibs/system/netd/server/ndc/android_x86_64_cfi/ndc
mkdir -p prebuiltlibs/system/netd/server/netd/android_x86_64_cfi/ && mv out/soong/.intermediates/system/netd/server/netd/android_x86_64_cfi/netd prebuiltlibs/system/netd/server/netd/android_x86_64_cfi/netd

printf "cc_prebuilt_binary {\n  name: \"ndc\",\n  shared_libs: [\"libbase\",\"libnetdutils\",\"libnetutils\",\"libcutils\",\"liblog\",\"libutils\",\"libbinder\",\"dnsresolver_aidl_interface-V7-cpp\",\"netd_aidl_interface-V6-cpp\"],\n  sanitize: {\n    cfi: true,\n    memtag_heap: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"ndc\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "cc_prebuilt_binary {\n  name: \"netd\",\n  init_rc: [\"netd.rc\"],\n  required: [\"bpfloader\",\"clatd.o\",\"netd.o\"],\n  shared_libs: [\"android.system.net.netd@1.0\",\"android.system.net.netd@1.1\",\"libbase\",\"libbinder\",\"libbpf_android\",\"libcutils\",\"libdl\",\"libhidlbase\",\"liblog\",\"libmdnssd\",\"libnetd_resolv\",\"libnetdbpf\",\"libnetdutils\",\"libnetutils\",\"libpcap\",\"libprocessgroup\",\"libqtaguid\",\"libselinux\",\"libsysutils\",\"libutils\",\"netd_aidl_interface-V7-cpp\",\"netd_event_listener_interface-V1-cpp\",\"oemnetd_aidl_interface-cpp\"],\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"netd\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-10
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-10.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so \
  

mkdir -p prebuiltlibs/system/nfc/src/libnfc-nci/android_x86_64_shared/ && mv out/soong/.intermediates/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so prebuiltlibs/system/nfc/src/libnfc-nci/android_x86_64_shared/libnfc-nci.so

printf "cc_prebuilt_library_shared {\n  arch: {\n    arm: {\n    },\n  },\n  name: \"libnfc-nci\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libdl\",\"libhardware\",\"libz\",\"libchrome\",\"libbase\",\"libstatslog\",\"libhidlbase\",\"libutils\",\"android.hardware.nfc@1.0\",\"android.hardware.nfc@1.1\",\"android.hardware.nfc@1.2\"],\n  static_libs: [\"libnfcutils\"],\n  required: [\"libnfc-nci.conf-default\"],\n  sanitize: {\n    misc_undefined: [\"bounds\"],\n    integer_overflow: true,\n    scs: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnfc-nci.so\"],\n}\n" >> prebuiltlibs/system/nfc/src/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/nfc/ninja && rsync -ar out/soong/ninja/system/nfc/ prebuiltlibs/system/nfc/ninja/system_nfc-10
touch prebuiltlibs/system/nfc/ninja/.find-ignore
tar cfJ system_nfc-10.tar.xz -C prebuiltlibs/system/nfc/ .
ls -l system_nfc-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/security/keystore2/aidl/android.security.apc-rust/android_x86_64_rlib_rlib-std/libandroid_security_apc.rlib \
  out/soong/.intermediates/system/security/keystore2/aidl/android.security.legacykeystore-rust/android_x86_64_rlib_rlib-std/libandroid_security_legacykeystore.rlib \
  out/soong/.intermediates/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_shared/android.security.maintenance-ndk_platform.so \
  out/soong/.intermediates/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_static/android.security.maintenance-ndk_platform.a \
  out/soong/.intermediates/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2 \
  out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so \
  out/soong/.intermediates/system/security/identity/credstore/android_x86_64/credstore \
  out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so \
  out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so \
  out/soong/.intermediates/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so \
  out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so \
  out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a \
  out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib \
  out/soong/.intermediates/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib \
  out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so \
  out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a \
  out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so \
  out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a \
  out/soong/.intermediates/system/security/ondevice-signing/odsign/android_x86_64/odsign \
  

mkdir -p prebuiltlibs/system/security/keystore2/aidl/android.security.apc-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/aidl/android.security.apc-rust/android_x86_64_rlib_rlib-std/libandroid_security_apc.rlib prebuiltlibs/system/security/keystore2/aidl/android.security.apc-rust/android_x86_64_rlib_rlib-std/android.security.apc-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/aidl/android.security.legacykeystore-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/aidl/android.security.legacykeystore-rust/android_x86_64_rlib_rlib-std/libandroid_security_legacykeystore.rlib prebuiltlibs/system/security/keystore2/aidl/android.security.legacykeystore-rust/android_x86_64_rlib_rlib-std/android.security.legacykeystore-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_shared/android.security.maintenance-ndk_platform.so prebuiltlibs/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_shared/android.security.maintenance-ndk_platform.so
mkdir -p prebuiltlibs/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_static/android.security.maintenance-ndk_platform.a prebuiltlibs/system/security/keystore2/aidl/android.security.maintenance-ndk_platform/android_x86_64_static/android.security.maintenance-ndk_platform.a
mkdir -p prebuiltlibs/system/security/keystore/keystore_cli_v2/android_x86_64/ && mv out/soong/.intermediates/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2 prebuiltlibs/system/security/keystore/keystore_cli_v2/android_x86_64/keystore_cli_v2
mkdir -p prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/libcredstore_aidl.so
mkdir -p prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/ && rsync -ar out/soong/.intermediates/system/security/identity/libcredstore_aidl/android_x86_64_shared/gen/aidl prebuiltlibs/system/security/identity/libcredstore_aidl/android_x86_64_shared/
mkdir -p prebuiltlibs/system/security/identity/credstore/android_x86_64/ && mv out/soong/.intermediates/system/security/identity/credstore/android_x86_64/credstore prebuiltlibs/system/security/identity/credstore/android_x86_64/credstore
mkdir -p prebuiltlibs/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so prebuiltlibs/system/security/keystore-engine/libkeystore-engine/android_x86_64_shared/libkeystore-engine.so
mkdir -p prebuiltlibs/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so prebuiltlibs/system/security/keystore-engine/libkeystore-engine-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-engine-wifi-hidl.so
mkdir -p prebuiltlibs/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so prebuiltlibs/system/security/keystore/libkeystore-wifi-hidl/android_vendor.31_x86_64_shared/libkeystore-wifi-hidl.so
mkdir -p prebuiltlibs/system/security/keystore/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/security/keystore/include/ prebuiltlibs/system/security/keystore/include
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_shared/libkeystore2_apc_compat.so
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat/android_x86_64_static/libkeystore2_apc_compat.a
mkdir -p prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib prebuiltlibs/system/security/keystore2/apc_compat/libkeystore2_apc_compat-rust/android_x86_64_rlib_rlib-std/libkeystore2_apc_compat-rust.rlib
mkdir -p prebuiltlibs/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib prebuiltlibs/system/security/keystore2/selinux/libkeystore2_selinux/android_x86_64_rlib_rlib-std/libkeystore2_selinux.rlib
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_shared/libkm_compat.so
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat/android_x86_64_static/libkm_compat.a
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_shared/libkm_compat_service.so
mkdir -p prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/ && mv out/soong/.intermediates/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a prebuiltlibs/system/security/keystore2/src/km_compat/libkm_compat_service/android_x86_64_static/libkm_compat_service.a
mkdir -p prebuiltlibs/system/security/ondevice-signing/odsign/android_x86_64/ && mv out/soong/.intermediates/system/security/ondevice-signing/odsign/android_x86_64/odsign prebuiltlibs/system/security/ondevice-signing/odsign/android_x86_64/odsign

printf "\n" >> prebuiltlibs/system/security/keystore2/aidl/Android.bp
printf "\n" >> prebuiltlibs/system/security/keystore2/aidl/Android.bp
printf "\n" >> prebuiltlibs/system/security/keystore2/aidl/Android.bp
printf "cc_prebuilt_binary {\n  name: \"keystore_cli_v2\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-unsigned-integer-truncation\",\"implicit-integer-sign-change\"],\n  },\n  clang: true,\n  shared_libs: [\"android.security.apc-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"libbinder\",\"libbinder_ndk\",\"libchrome\",\"libcrypto\",\"libkeymint_support\",\"libprotobuf-cpp-lite\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"keystore_cli_v2\"],\n}\n" >> prebuiltlibs/system/security/keystore/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libcredstore_aidl\",\n  shared_libs: [\"libbinder\",\"libutils\",\"libkeymaster4support\"],\n  export_shared_lib_headers: [\"libbinder\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcredstore_aidl.so\"],\n}\n" >> prebuiltlibs/system/security/identity/Android.bp
printf "cc_prebuilt_binary {\n  name: \"credstore\",\n  sanitize: {\n    misc_undefined: [\"integer\"],\n  },\n  clang: true,\n  init_rc: [\"credstore.rc\"],\n  shared_libs: [\"libbase\",\"libbinder\",\"libbinder_ndk\",\"android.hardware.keymaster@4.0\",\"libcredstore_aidl\",\"libcrypto\",\"libutils\",\"libhidlbase\",\"android.hardware.identity-support-lib\",\"libkeymaster4support\",\"libkeystore-attestation-application-id\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.security.authorization-ndk_platform\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"credstore\"],\n}\n" >> prebuiltlibs/system/security/identity/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libkeystore-engine\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"libbinder_ndk\",\"libcrypto\",\"libcutils\",\"liblog\",\"libbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-engine.so\"],\n}\n" >> prebuiltlibs/system/security/keystore-engine/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libkeystore-engine-wifi-hidl\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcrypto\",\"liblog\",\"libcutils\",\"libutils\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-engine-wifi-hidl.so\"],\n}\n" >> prebuiltlibs/system/security/keystore-engine/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libkeystore-wifi-hidl\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\",\"shift\",\"integer-divide-by-zero\",\"implicit-unsigned-integer-truncation\",\"implicit-integer-sign-change\"],\n  },\n  clang: true,\n  shared_libs: [\"android.system.wifi.keystore@1.0\",\"libbase\",\"libhidlbase\",\"liblog\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  vendor: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libkeystore-wifi-hidl.so\"],\n}\n" >> prebuiltlibs/system/security/keystore/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkeystore2_apc_compat\",\n  shared_libs: [\"android.hardware.confirmationui@1.0\",\"libbase\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkeystore2_apc_compat.a\"],\n  },\n  shared: {\n    srcs: [\"libkeystore2_apc_compat.so\"],\n  },\n}\n" >> prebuiltlibs/system/security/keystore2/apc_compat/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_apc_compat-rust\",\n  crate_name: \"keystore2_apc_compat\",\n  rustlibs: [\"libkeystore2_apc_compat_bindgen\"],\n  shared_libs: [\"libkeystore2_apc_compat\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_apc_compat-rust.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/apc_compat/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libkeystore2_selinux\",\n  crate_name: \"keystore2_selinux\",\n  shared_libs: [\"libselinux\"],\n  rustlibs: [\"libanyhow\",\"liblazy_static\",\"liblog_rust\",\"libselinux_bindgen\",\"libthiserror\"],\n  multiple_variants: true,\n  srcs: [\"libkeystore2_selinux.rlib\"],\n}\n" >> prebuiltlibs/system/security/keystore2/selinux/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkm_compat\",\n  shared_libs: [\"android.hardware.keymaster@3.0\",\"android.hardware.keymaster@4.0\",\"android.hardware.keymaster@4.1\",\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.security.compat-ndk_platform\",\"android.system.keystore2-V1-ndk_platform\",\"libbase\",\"libbinder_ndk\",\"libcrypto\",\"libhidlbase\",\"libkeymaster4_1support\",\"libkeymint\",\"libkeymint_support\",\"libkeystore2_crypto\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkm_compat.a\"],\n  },\n  shared: {\n    srcs: [\"libkm_compat.so\"],\n  },\n}\n" >> prebuiltlibs/system/security/keystore2/src/km_compat/Android.bp
printf "cc_prebuilt_library {\n  name: \"libkm_compat_service\",\n  shared_libs: [\"android.hardware.security.keymint-V1-ndk_platform\",\"android.hardware.security.secureclock-V1-ndk_platform\",\"android.hardware.security.sharedsecret-V1-ndk_platform\",\"android.security.compat-ndk_platform\",\"libbinder_ndk\",\"libcrypto\",\"libkm_compat\",\"libkeymaster4_1support\",\"libkeystore2_crypto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libkm_compat_service.a\"],\n  },\n  shared: {\n    srcs: [\"libkm_compat_service.so\"],\n  },\n}\n" >> prebuiltlibs/system/security/keystore2/src/km_compat/Android.bp
printf "cc_prebuilt_binary {\n  name: \"odsign\",\n  init_rc: [\"odsign.rc\"],\n  shared_libs: [\"android.system.keystore2-V1-cpp\",\"android.hardware.security.keymint-V1-cpp\",\"libbase\",\"libbinder\",\"libcrypto\",\"libcrypto_utils\",\"libfsverity\",\"liblogwrap\",\"libprotobuf-cpp-full\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"odsign\"],\n}\n" >> prebuiltlibs/system/security/ondevice-signing/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/security/ninja && rsync -ar out/soong/ninja/system/security/ prebuiltlibs/system/security/ninja/system_security-10
touch prebuiltlibs/system/security/ninja/.find-ignore
tar cfJ system_security-10.tar.xz -C prebuiltlibs/system/security/ .
ls -l system_security-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server \
  

mkdir -p prebuiltlibs/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/ && mv out/soong/.intermediates/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server prebuiltlibs/system/tools/hidl/test/lazy_test/hidl_lazy_test_server/android_x86_64/hidl_lazy_test_server

printf "cc_prebuilt_binary {\n  name: \"hidl_lazy_test_server\",\n  system_ext_specific: true,\n  vintf_fragments: [\"hidl_lazy_test_server.xml\"],\n  init_rc: [\"hidl_lazy_test_server.rc\"],\n  shared_libs: [\"android.hardware.tests.lazy@1.1\",\"libbase\",\"libhidlbase\",\"libutils\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"hidl_lazy_test_server\"],\n}\n" >> prebuiltlibs/system/tools/hidl/test/lazy_test/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/tools/hidl/ninja && rsync -ar out/soong/ninja/system/tools/hidl/ prebuiltlibs/system/tools/hidl/ninja/system_tools_hidl-10
touch prebuiltlibs/system/tools/hidl/ninja/.find-ignore
tar cfJ system_tools_hidl-10.tar.xz -C prebuiltlibs/system/tools/hidl/ .
ls -l system_tools_hidl-10.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a \
  out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a \
  out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a \
  out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a \
  out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a \
  out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a \
  out/soong/.intermediates/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a \
  out/soong/.intermediates/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a \
  out/soong/.intermediates/system/update_engine/update_engine_client/android_x86_64/update_engine_client \
  

mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_x86_64_static/libpayload_extent_ranges.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a prebuiltlibs/system/update_engine/libpayload_extent_ranges/android_recovery_x86_64_static/libpayload_extent_ranges.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_utils/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a prebuiltlibs/system/update_engine/libpayload_extent_utils/android_x86_64_static/libpayload_extent_utils.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a prebuiltlibs/system/update_engine/libpayload_extent_utils/android_recovery_x86_64_static/libpayload_extent_utils.a
mkdir -p prebuiltlibs/system/update_engine/libcow_operation_convert/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a prebuiltlibs/system/update_engine/libcow_operation_convert/android_x86_64_static/libcow_operation_convert.a
mkdir -p prebuiltlibs/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a prebuiltlibs/system/update_engine/libcow_operation_convert/android_recovery_x86_64_static/libcow_operation_convert.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_consumer/android_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a prebuiltlibs/system/update_engine/libpayload_consumer/android_x86_64_static/libpayload_consumer.a
mkdir -p prebuiltlibs/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/ && mv out/soong/.intermediates/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a prebuiltlibs/system/update_engine/libpayload_consumer/android_recovery_x86_64_static/libpayload_consumer.a
mkdir -p prebuiltlibs/system/update_engine/update_engine_client/android_x86_64/ && mv out/soong/.intermediates/system/update_engine/update_engine_client/android_x86_64/update_engine_client prebuiltlibs/system/update_engine/update_engine_client/android_x86_64/update_engine_client

printf "cc_prebuilt_library_static {\n  name: \"libpayload_extent_ranges\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"update_metadata-protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_extent_ranges.a\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpayload_extent_utils\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"update_metadata-protos\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_extent_utils.a\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcow_operation_convert\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  host_supported: true,\n  recovery_available: true,\n  static_libs: [\"libsnapshot_cow\",\"update_metadata-protos\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libbrotli\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcow_operation_convert.a\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libpayload_consumer\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libprotobuf-cpp-lite\",\"libbase\",\"libcrypto\",\"libfec\",\"libziparchive\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  static_libs: [\"update_metadata-protos\",\"libxz\",\"libbz\",\"libbspatch\",\"libbrotli\",\"libc++fs\",\"libfec_rs\",\"libpuffpatch\",\"libverity_tree\",\"libsnapshot_cow\",\"libz\",\"libpayload_extent_ranges\",\"libpayload_extent_utils\",\"libcow_operation_convert\"],\n  host_supported: true,\n  recovery_available: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libpayload_consumer.a\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp
printf "cc_prebuilt_binary {\n  name: \"update_engine_client\",\n  shared_libs: [\"libbrillo-stream\",\"libbrillo\",\"libchrome\",\"libbinder\",\"libbinderwrapper\",\"libbrillo-binder\",\"libutils\"],\n  target: {\n    android: {\n    },\n    host: {\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"update_engine_client\"],\n}\n" >> prebuiltlibs/system/update_engine/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/update_engine/ninja && rsync -ar out/soong/ninja/system/update_engine/ prebuiltlibs/system/update_engine/ninja/system_update_engine-10
touch prebuiltlibs/system/update_engine/ninja/.find-ignore
tar cfJ system_update_engine-10.tar.xz -C prebuiltlibs/system/update_engine/ .
ls -l system_update_engine-10.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
