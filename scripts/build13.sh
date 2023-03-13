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

rm -rf prebuiltlibs/external/perfetto/heapprofd
rm -rf prebuiltlibs/external/perfetto/heapprofd_client
rm -rf prebuiltlibs/external/perfetto/heapprofd_client_api
rm -rf prebuiltlibs/external/perfetto/ipc_plugin
rm -rf prebuiltlibs/external/perfetto/libperfetto
rm -rf prebuiltlibs/external/perfetto/libperfetto_android_internal
rm -rf prebuiltlibs/external/perfetto/libstatslog_perfetto
rm -rf prebuiltlibs/external/perfetto/perfetto
rm -rf prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin
rm -rf prebuiltlibs/external/perfetto/perfetto_trace_protos
rm -rf prebuiltlibs/external/perfetto/protozero_plugin
rm -rf prebuiltlibs/external/perfetto/traced
rm -rf prebuiltlibs/external/perfetto/traced_perf
rm -rf prebuiltlibs/external/perfetto/traced_probes
rm -rf prebuiltlibs/external/perfetto/trigger_perfetto

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_64_static_apex30/neuralnetworks_utils_hal_common.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_common.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_common.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_0.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_1.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_2.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_3.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_aidl.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a \
  out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_service.a \
  

mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_64_static_apex30/neuralnetworks_utils_hal_common.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_64_static_apex30/neuralnetworks_utils_hal_common.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_common.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_common.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_common.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/neuralnetworks_utils_hal_common/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_common.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/utils/common/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_0.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_0.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/neuralnetworks_utils_hal_1_0/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_0.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/1.0/utils/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_1.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_1.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/neuralnetworks_utils_hal_1_1/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_1.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/1.1/utils/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_2.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_2.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/neuralnetworks_utils_hal_1_2/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_2.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/1.2/utils/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_x86_x86_64_static_apex30/neuralnetworks_utils_hal_1_3.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_3.a prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/neuralnetworks_utils_hal_1_3/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_1_3.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/1.3/utils/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_aidl.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_aidl.a prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/neuralnetworks_utils_hal_aidl/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_aidl.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/aidl/utils/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/include
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_x86_64_static_com.android.neuralnetworks/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_x86_x86_64_static_com.android.neuralnetworks/neuralnetworks_utils_hal_service.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_service.a prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/neuralnetworks_utils_hal_service/android_vendor.31_x86_64_static/neuralnetworks_utils_hal_service.a
mkdir -p prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" hardware/interfaces/neuralnetworks/utils/service/include/ prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/include

printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_common\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"libarect\",\"neuralnetworks_types\"],\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"libhidlbase\",\"libnativewindow\",\"libbinder_ndk\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_common.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/utils/common/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_1_0\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"neuralnetworks_types\",\"neuralnetworks_utils_hal_common\"],\n  shared_libs: [\"android.hardware.neuralnetworks@1.0\"],\n  export_static_lib_headers: [\"neuralnetworks_utils_hal_common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_1_0.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/1.0/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_1_1\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"neuralnetworks_types\",\"neuralnetworks_utils_hal_common\",\"neuralnetworks_utils_hal_1_0\"],\n  shared_libs: [\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\"],\n  export_static_lib_headers: [\"neuralnetworks_utils_hal_common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_1_1.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/1.1/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_1_2\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"neuralnetworks_types\",\"neuralnetworks_utils_hal_common\",\"neuralnetworks_utils_hal_1_0\",\"neuralnetworks_utils_hal_1_1\"],\n  shared_libs: [\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"libfmq\"],\n  export_static_lib_headers: [\"neuralnetworks_utils_hal_common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_1_2.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/1.2/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_1_3\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"neuralnetworks_types\",\"neuralnetworks_utils_hal_common\",\"neuralnetworks_utils_hal_1_0\",\"neuralnetworks_utils_hal_1_1\",\"neuralnetworks_utils_hal_1_2\"],\n  shared_libs: [\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"libfmq\"],\n  export_static_lib_headers: [\"neuralnetworks_utils_hal_common\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_1_3.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/1.3/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_aidl\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"android.hardware.graphics.common-V2-ndk_platform\",\"libaidlcommonsupport\",\"libarect\",\"neuralnetworks_types\",\"neuralnetworks_utils_hal_common\"],\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"libbinder_ndk\",\"libhidlbase\",\"libnativewindow\"],\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_aidl.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/aidl/utils/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"neuralnetworks_utils_hal_service\",\n  host_supported: false,\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.neuralnetworks\",\"test_com.android.neuralnetworks\"],\n  min_sdk_version: \"30\",\n  export_include_dirs: [\"include\"],\n  static_libs: [\"neuralnetworks_types\",\"neuralnetworks_utils_hal_1_0\",\"neuralnetworks_utils_hal_1_1\",\"neuralnetworks_utils_hal_1_2\",\"neuralnetworks_utils_hal_1_3\",\"neuralnetworks_utils_hal_aidl\",\"neuralnetworks_utils_hal_common\"],\n  shared_libs: [\"android.hardware.neuralnetworks-V1-ndk_platform\",\"android.hardware.neuralnetworks@1.0\",\"android.hardware.neuralnetworks@1.1\",\"android.hardware.neuralnetworks@1.2\",\"android.hardware.neuralnetworks@1.3\",\"libbinder_ndk\"],\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"neuralnetworks_utils_hal_service.a\"],\n}\n" >> prebuiltlibs/hardware/interfaces/neuralnetworks/utils/service/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/interfaces/ninja && rsync -ar out/soong/ninja/hardware/interfaces/ prebuiltlibs/hardware/interfaces/ninja/hardware_interfaces-13
touch prebuiltlibs/hardware/interfaces/ninja/.find-ignore
tar cfJ hardware_interfaces-13.tar.xz -C prebuiltlibs/hardware/interfaces/ .
ls -l hardware_interfaces-13.tar.xz
end=`date +%s`
echo $((end-start))

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
  out/soong/.intermediates/external/skia/libskia/android_x86_64_static_lto-thin/libskia.a \
  out/soong/.intermediates/external/skia/libskia/android_x86_x86_64_static_lto-thin/libskia.a \
  

mkdir -p prebuiltlibs/external/skia/libskia/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/skia/libskia/android_x86_64_static_lto-thin/libskia.a prebuiltlibs/external/skia/libskia/android_x86_64_static_lto-thin/libskia.a
mkdir -p prebuiltlibs/external/skia/libskia/android_x86_x86_64_static_lto-thin/ && mv out/soong/.intermediates/external/skia/libskia/android_x86_x86_64_static_lto-thin/libskia.a prebuiltlibs/external/skia/libskia/android_x86_x86_64_static_lto-thin/libskia.a
mkdir -p prebuiltlibs/external/skia/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/skia/ prebuiltlibs/external/skia/

printf "cc_prebuilt_library_static {\n  name: \"libskia\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libpng\",\"libz\",\"libdng_sdk\",\"libjpeg\",\"libpiex\",\"libexpat\",\"libft2\"],\n  static_libs: [\"libarect\",\"libwebp-decode\",\"libwebp-encode\",\"libsfntly\"],\n  group_static_libs: true,\n  target: {\n    android: {\n      shared_libs: [\"libEGL\",\"libGLESv2\",\"libvulkan\",\"libnativewindow\",\"libheif\"],\n      export_shared_lib_headers: [\"libvulkan\"],\n      export_include_dirs: [\"android\"],\n    },\n    darwin: {\n      export_include_dirs: [\"mac\"],\n    },\n    windows: {\n      enabled: true,\n      export_include_dirs: [\"win\"],\n    },\n    linux_glibc: {\n      export_include_dirs: [\"linux\"],\n    },\n  },\n  pgo: {\n    instrumentation: true,\n    profile_file: \"hwui/hwui.profdata\",\n    benchmarks: [\"hwui\",\"skia\"],\n    enable_profile_use: true,\n  },\n  export_include_dirs: [\"\",\"client_utils/android/\",\"include/android/\",\"include/c/\",\"include/codec/\",\"include/config/\",\"include/core/\",\"include/docs/\",\"include/effects/\",\"include/encode/\",\"include/gpu/\",\"include/pathops/\",\"include/ports/\",\"include/svg/\",\"include/utils/\",\"include/utils/mac/\",\"modules/particles/include/\",\"modules/skottie/include/\",\"modules/skparagraph/include/\",\"modules/skshaper/include/\",\"modules/svg/include/\"],\n  arch: {\n    arm: {\n      neon: {\n      },\n    },\n    arm64: {\n    },\n    x86: {\n    },\n    x86_64: {\n    },\n  },\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libskia.a\"],\n}\n" >> prebuiltlibs/external/skia/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/skia/ninja && rsync -ar out/soong/ninja/external/skia/ prebuiltlibs/external/skia/ninja/external_skia-13
touch prebuiltlibs/external/skia/ninja/.find-ignore
tar cfJ external_skia-13.tar.xz -C prebuiltlibs/external/skia/ .
ls -l external_skia-13.tar.xz
end=`date +%s`
echo $((end-start))

rm -rf prebuiltlibs/external/skia/libskia

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/crosvm/rutabaga_gfx/librutabaga_gfx/android_x86_64_rlib_rlib-std_apex10000/librutabaga_gfx.rlib \
  out/soong/.intermediates/external/crosvm/vm_control/libvm_control/android_x86_64_rlib_rlib-std_apex10000/libvm_control.rlib \
  out/soong/.intermediates/external/crosvm/devices/libdevices/android_x86_64_rlib_rlib-std_apex10000/libdevices.rlib \
  out/soong/.intermediates/external/crosvm/arch/libarch/android_x86_64_rlib_rlib-std_apex10000/libarch.rlib \
  out/soong/.intermediates/external/crosvm/x86_64/libx86_64_rust/android_x86_64_rlib_rlib-std_apex10000/libx86_64.rlib \
  out/soong/.intermediates/external/crosvm/libcrosvm/android_x86_64_rlib_rlib-std_apex10000/libcrosvm.rlib \
  out/soong/.intermediates/external/crosvm/crosvm/android_x86_64_apex10000/crosvm \
  

mkdir -p prebuiltlibs/external/crosvm/rutabaga_gfx/librutabaga_gfx/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/rutabaga_gfx/librutabaga_gfx/android_x86_64_rlib_rlib-std_apex10000/librutabaga_gfx.rlib prebuiltlibs/external/crosvm/rutabaga_gfx/librutabaga_gfx/android_x86_64_rlib_rlib-std_apex10000/librutabaga_gfx.rlib
mkdir -p prebuiltlibs/external/crosvm/vm_control/libvm_control/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/vm_control/libvm_control/android_x86_64_rlib_rlib-std_apex10000/libvm_control.rlib prebuiltlibs/external/crosvm/vm_control/libvm_control/android_x86_64_rlib_rlib-std_apex10000/libvm_control.rlib
mkdir -p prebuiltlibs/external/crosvm/devices/libdevices/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/devices/libdevices/android_x86_64_rlib_rlib-std_apex10000/libdevices.rlib prebuiltlibs/external/crosvm/devices/libdevices/android_x86_64_rlib_rlib-std_apex10000/libdevices.rlib
mkdir -p prebuiltlibs/external/crosvm/arch/libarch/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/arch/libarch/android_x86_64_rlib_rlib-std_apex10000/libarch.rlib prebuiltlibs/external/crosvm/arch/libarch/android_x86_64_rlib_rlib-std_apex10000/libarch.rlib
mkdir -p prebuiltlibs/external/crosvm/x86_64/libx86_64_rust/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/x86_64/libx86_64_rust/android_x86_64_rlib_rlib-std_apex10000/libx86_64.rlib prebuiltlibs/external/crosvm/x86_64/libx86_64_rust/android_x86_64_rlib_rlib-std_apex10000/libx86_64_rust.rlib
mkdir -p prebuiltlibs/external/crosvm/libcrosvm/android_x86_64_rlib_rlib-std_apex10000/ && mv out/soong/.intermediates/external/crosvm/libcrosvm/android_x86_64_rlib_rlib-std_apex10000/libcrosvm.rlib prebuiltlibs/external/crosvm/libcrosvm/android_x86_64_rlib_rlib-std_apex10000/libcrosvm.rlib
mkdir -p prebuiltlibs/external/crosvm/crosvm/android_x86_64_apex10000/ && mv out/soong/.intermediates/external/crosvm/crosvm/android_x86_64_apex10000/crosvm prebuiltlibs/external/crosvm/crosvm/android_x86_64_apex10000/crosvm

printf "rust_prebuilt_rlib {\n  name: \"librutabaga_gfx\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    host: {\n      shared_libs: [\"libvirglrenderer\"],\n    },\n    android: {\n      shared_libs: [\"libdrm\"],\n      static_libs: [\"libepoxy\",\"libgbm\",\"libvirglrenderer\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"rutabaga_gfx\",\n  features: [\"gfxstream\",\"virgl_renderer\",\"virgl_renderer_next\"],\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"liblibc\",\"libsync_rust\"],\n  shared_libs: [\"libgfxstream_backend\"],\n  multiple_variants: true,\n  srcs: [\"librutabaga_gfx.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/rutabaga_gfx/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libvm_control\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n      features: [\"gdb\",\"gdbstub\"],\n      rustlibs: [\"libgdbstub\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"vm_control\",\n  rustlibs: [\"libbase_rust\",\"libdata_model\",\"libhypervisor\",\"liblibc\",\"libresources\",\"librutabaga_gfx\",\"libserde\",\"libsync_rust\",\"libvm_memory\"],\n  multiple_variants: true,\n  srcs: [\"libvm_control.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/vm_control/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libdevices\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"devices\",\n  features: [\"audio\",\"gpu\",\"gpu_buffer\",\"gpu_display\",\"gpu_renderer\",\"gfxstream\"],\n  shared_libs: [\"libgfxstream_backend\"],\n  rustlibs: [\"libacpi_tables\",\"libaudio_streams\",\"libbase_rust\",\"libbit_field\",\"libcros_async\",\"libdata_model\",\"libdisk\",\"libfuse_rust\",\"libfutures\",\"libgpu_display\",\"libhypervisor\",\"libkvm_sys\",\"liblibc\",\"liblibchromeos\",\"liblibcras\",\"liblinux_input_sys\",\"libminijail_rust\",\"libnet_sys\",\"libnet_util\",\"libp9\",\"libpower_monitor\",\"librand_ish\",\"libresources\",\"librutabaga_gfx\",\"libserde\",\"libsmallvec\",\"libsync_rust\",\"libsys_util\",\"libsyscall_defines\",\"libthiserror\",\"libusb_util\",\"libvfio_sys\",\"libvhost\",\"libvirtio_sys\",\"libvm_control\",\"libvm_memory\",\"libvmm_vhost\"],\n  proc_macros: [\"libenumn\",\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libdevices.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/devices/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libarch\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n      features: [\"gdb\",\"gdbstub\"],\n      rustlibs: [\"libgdbstub\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"arch\",\n  rustlibs: [\"libacpi_tables\",\"libbase_rust\",\"libdevices\",\"libhypervisor\",\"libkernel_cmdline\",\"liblibc\",\"libminijail_rust\",\"libpower_monitor\",\"libresources\",\"libsync_rust\",\"libthiserror\",\"libvm_control\",\"libvm_memory\"],\n  shared_libs: [\"libfdt\"],\n  multiple_variants: true,\n  srcs: [\"libarch.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/arch/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libx86_64_rust\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n      features: [\"gdb\",\"gdbstub\"],\n      rustlibs: [\"libgdbstub\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  stem: \"libx86_64\",\n  host_supported: true,\n  crate_name: \"x86_64\",\n  rustlibs: [\"libacpi_tables\",\"libarch\",\"libassertions\",\"libbase_rust\",\"libdata_model\",\"libdevices\",\"libhypervisor\",\"libkernel_cmdline\",\"libkernel_loader\",\"liblibc\",\"libminijail_rust\",\"libresources\",\"libsync_rust\",\"libvm_control\",\"libvm_memory\"],\n  proc_macros: [\"libremain\"],\n  arch: {\n    arm: {\n      enabled: false,\n    },\n    arm64: {\n      enabled: false,\n    },\n  },\n  multiple_variants: true,\n  srcs: [\"libx86_64_rust.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/x86_64/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"libcrosvm\",\n  edition: \"2018\",\n  target: {\n    linux_glibc_x86_64: {\n      enabled: true,\n      flags: [\"-L device/google/cuttlefish_vmm/x86_64-linux-gnu/bin/\"],\n      features: [\"gdb\",\"gdbstub\"],\n      rustlibs: [\"libgdbstub\",\"libthiserror\"],\n    },\n    android64: {\n      compile_multilib: \"64\",\n      enabled: true,\n    },\n    linux_bionic_arm64: {\n      enabled: true,\n    },\n    darwin: {\n      enabled: false,\n    },\n    linux_glibc: {\n      features: [\"gfxstream\"],\n    },\n  },\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  host_supported: true,\n  crate_name: \"crosvm\",\n  arch: {\n    x86_64: {\n      rustlibs: [\"libx86_64_rust\"],\n    },\n    arm64: {\n      rustlibs: [\"libaarch64\"],\n    },\n  },\n  features: [\"audio\",\"default\",\"gpu\"],\n  rustlibs: [\"libacpi_tables\",\"libarch\",\"libassertions\",\"libaudio_streams\",\"libbase_rust\",\"libbit_field\",\"libdata_model\",\"libdevices\",\"libdisk\",\"libhypervisor\",\"libkernel_cmdline\",\"libkernel_loader\",\"liblibc\",\"liblibcras\",\"libminijail_rust\",\"libnet_util\",\"libp9\",\"librand_ish\",\"libresources\",\"librutabaga_gfx\",\"libsync_rust\",\"libtempfile\",\"libvhost\",\"libvm_control\",\"libvm_memory\"],\n  proc_macros: [\"libenumn\",\"libremain\"],\n  multiple_variants: true,\n  srcs: [\"libcrosvm.rlib\"],\n}\n" >> prebuiltlibs/external/crosvm/Android.bp
printf "cc_prebuilt_binary {\n  name: \"crosvm\",\n  stl: \"none\",\n  prefer: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  multiple_variants: true,\n  srcs: [\"crosvm\"],\n}\n" >> prebuiltlibs/external/crosvm/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/crosvm/ninja && rsync -ar out/soong/ninja/external/crosvm/ prebuiltlibs/external/crosvm/ninja/external_crosvm-13
touch prebuiltlibs/external/crosvm/ninja/.find-ignore
tar cfJ external_crosvm-13.tar.xz -C prebuiltlibs/external/crosvm/ .
ls -l external_crosvm-13.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_64_shared_cfi/libstagefright.so \
  out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_64_static_cfi/libstagefright.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_shared_cfi/libstagefright.so \
  out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_static_cfi/libstagefright.a \
  out/soong/.intermediates/frameworks/av/services/camera/libcameraservice/libcameraservice/android_x86_64_shared/libcameraservice.so \
  out/soong/.intermediates/frameworks/av/camera/cameraserver/cameraserver/android_x86_64/cameraserver \
  out/soong/.intermediates/frameworks/av/services/mediaextractor/libmediaextractorservice/android_x86_64_shared/libmediaextractorservice.so \
  out/soong/.intermediates/frameworks/av/services/mediaextractor/mediaextractor/android_x86_64/mediaextractor \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_29/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared_29/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_current/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_64_shared/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_x86_64_shared/libmediandk.so \
  out/soong/.intermediates/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_shared_cfi_com.android.media/libaacextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_static_cfi_com.android.media/libaacextractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_shared_cfi_apex29/libamrextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_static_cfi_apex29/libamrextractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_shared_cfi_com.android.media/libflacextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_static_cfi_com.android.media/libflacextractor.a \
  out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_shared_cfi_apex29/libmediaformatshaper.so \
  out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_static_cfi_apex29/libmediaformatshaper.a \
  out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_shared_cfi_apex29/libmediaformatshaper.so \
  out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_static_cfi_apex29/libmediaformatshaper.a \
  out/soong/.intermediates/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_shared_cfi_apex29/libmediatranscoder.so \
  out/soong/.intermediates/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_static_cfi_apex29/libmediatranscoder.a \
  out/soong/.intermediates/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_shared_cfi_apex29/libmidiextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_static_cfi_apex29/libmidiextractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_shared_cfi_com.android.media/libmkvextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_static_cfi_com.android.media/libmkvextractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_shared_cfi_apex29/libmp3extractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_static_cfi_apex29/libmp3extractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_shared_cfi_apex29/libmp4extractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_static_cfi_apex29/libmp4extractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_shared_cfi_com.android.media/libmpeg2extractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_static_cfi_com.android.media/libmpeg2extractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_shared_cfi_com.android.media/liboggextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_static_cfi_com.android.media/liboggextractor.a \
  out/soong/.intermediates/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_shared_cfi_apex29/libwavextractor.so \
  out/soong/.intermediates/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_static_cfi_apex29/libwavextractor.a \
  out/soong/.intermediates/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_shared_cfi/libstagefright_httplive.so \
  out/soong/.intermediates/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_static_cfi/libstagefright_httplive.a \
  out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_shared_cfi/libmediaplayerservice.so \
  out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_static_cfi/libmediaplayerservice.a \
  out/soong/.intermediates/frameworks/av/media/mediaserver/mediaserver/android_x86_x86_64/mediaserver \
  out/soong/.intermediates/frameworks/av/cmds/screenrecord/screenrecord/android_x86_64/screenrecord \
  

mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_64_shared_cfi/libstagefright.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_64_shared_cfi/libstagefright.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_64_static_cfi/libstagefright.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_64_static_cfi/libstagefright.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_shared_cfi/libstagefright.so prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_shared_cfi/libstagefright.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_static_cfi/libstagefright.a prebuiltlibs/frameworks/av/media/libstagefright/libstagefright/android_x86_x86_64_static_cfi/libstagefright.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libstagefright/include/ prebuiltlibs/frameworks/av/media/libstagefright/include
mkdir -p prebuiltlibs/frameworks/av/services/camera/libcameraservice/libcameraservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/camera/libcameraservice/libcameraservice/android_x86_64_shared/libcameraservice.so prebuiltlibs/frameworks/av/services/camera/libcameraservice/libcameraservice/android_x86_64_shared/libcameraservice.so
mkdir -p prebuiltlibs/frameworks/av/services/camera/libcameraservice/
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/services/camera/libcameraservice/ prebuiltlibs/frameworks/av/services/camera/libcameraservice/
mkdir -p prebuiltlibs/frameworks/av/camera/cameraserver/cameraserver/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/camera/cameraserver/cameraserver/android_x86_64/cameraserver prebuiltlibs/frameworks/av/camera/cameraserver/cameraserver/android_x86_64/cameraserver
mkdir -p prebuiltlibs/frameworks/av/services/mediaextractor/libmediaextractorservice/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/services/mediaextractor/libmediaextractorservice/android_x86_64_shared/libmediaextractorservice.so prebuiltlibs/frameworks/av/services/mediaextractor/libmediaextractorservice/android_x86_64_shared/libmediaextractorservice.so
mkdir -p prebuiltlibs/frameworks/av/services/mediaextractor/mediaextractor/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/services/mediaextractor/mediaextractor/android_x86_64/mediaextractor prebuiltlibs/frameworks/av/services/mediaextractor/mediaextractor/android_x86_64/mediaextractor
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_29/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_29/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_29/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared_29/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared_29/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_x86_64_shared_29/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_current/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_current/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_x86_64_shared_current/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_64_shared/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_64_shared/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_x86_64_shared/libmediandk.so prebuiltlibs/frameworks/av/media/ndk/libmediandk/android_vendor.31_x86_x86_64_shared/libmediandk.so
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include/ prebuiltlibs/frameworks/av/media/ndk/include
mkdir -p prebuiltlibs/frameworks/av/media/ndk/include_platform
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/ndk/include_platform/ prebuiltlibs/frameworks/av/media/ndk/include_platform
mkdir -p prebuiltlibs/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_shared_cfi_com.android.media/libaacextractor.so prebuiltlibs/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_shared_cfi_com.android.media/libaacextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_static_cfi_com.android.media/libaacextractor.a prebuiltlibs/frameworks/av/media/extractors/aac/libaacextractor/android_x86_64_static_cfi_com.android.media/libaacextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_shared_cfi_apex29/libamrextractor.so prebuiltlibs/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_shared_cfi_apex29/libamrextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_static_cfi_apex29/libamrextractor.a prebuiltlibs/frameworks/av/media/extractors/amr/libamrextractor/android_x86_64_static_cfi_apex29/libamrextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_shared_cfi_com.android.media/libflacextractor.so prebuiltlibs/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_shared_cfi_com.android.media/libflacextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_static_cfi_com.android.media/libflacextractor.a prebuiltlibs/frameworks/av/media/extractors/flac/libflacextractor/android_x86_64_static_cfi_com.android.media/libflacextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_shared_cfi_apex29/libmediaformatshaper.so prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_shared_cfi_apex29/libmediaformatshaper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_static_cfi_apex29/libmediaformatshaper.a prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_64_static_cfi_apex29/libmediaformatshaper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_shared_cfi_apex29/libmediaformatshaper.so prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_shared_cfi_apex29/libmediaformatshaper.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_static_cfi_apex29/libmediaformatshaper.a prebuiltlibs/frameworks/av/media/libmediaformatshaper/libmediaformatshaper/android_x86_x86_64_static_cfi_apex29/libmediaformatshaper.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_shared_cfi_apex29/libmediatranscoder.so prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_shared_cfi_apex29/libmediatranscoder.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_static_cfi_apex29/libmediatranscoder.a prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder/android_x86_64_static_cfi_apex29/libmediatranscoder.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/av/media/libmediatranscoding/transcoder/include/ prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/include
mkdir -p prebuiltlibs/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_shared_cfi_apex29/libmidiextractor.so prebuiltlibs/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_shared_cfi_apex29/libmidiextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_static_cfi_apex29/libmidiextractor.a prebuiltlibs/frameworks/av/media/extractors/midi/libmidiextractor/android_x86_64_static_cfi_apex29/libmidiextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_shared_cfi_com.android.media/libmkvextractor.so prebuiltlibs/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_shared_cfi_com.android.media/libmkvextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_static_cfi_com.android.media/libmkvextractor.a prebuiltlibs/frameworks/av/media/extractors/mkv/libmkvextractor/android_x86_64_static_cfi_com.android.media/libmkvextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_shared_cfi_apex29/libmp3extractor.so prebuiltlibs/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_shared_cfi_apex29/libmp3extractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_static_cfi_apex29/libmp3extractor.a prebuiltlibs/frameworks/av/media/extractors/mp3/libmp3extractor/android_x86_64_static_cfi_apex29/libmp3extractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_shared_cfi_apex29/libmp4extractor.so prebuiltlibs/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_shared_cfi_apex29/libmp4extractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_static_cfi_apex29/libmp4extractor.a prebuiltlibs/frameworks/av/media/extractors/mp4/libmp4extractor/android_x86_64_static_cfi_apex29/libmp4extractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_shared_cfi_com.android.media/libmpeg2extractor.so prebuiltlibs/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_shared_cfi_com.android.media/libmpeg2extractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_static_cfi_com.android.media/libmpeg2extractor.a prebuiltlibs/frameworks/av/media/extractors/mpeg2/libmpeg2extractor/android_x86_64_static_cfi_com.android.media/libmpeg2extractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_shared_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_shared_cfi_com.android.media/liboggextractor.so prebuiltlibs/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_shared_cfi_com.android.media/liboggextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_static_cfi_com.android.media/ && mv out/soong/.intermediates/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_static_cfi_com.android.media/liboggextractor.a prebuiltlibs/frameworks/av/media/extractors/ogg/liboggextractor/android_x86_64_static_cfi_com.android.media/liboggextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_shared_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_shared_cfi_apex29/libwavextractor.so prebuiltlibs/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_shared_cfi_apex29/libwavextractor.so
mkdir -p prebuiltlibs/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_static_cfi_apex29/libwavextractor.a prebuiltlibs/frameworks/av/media/extractors/wav/libwavextractor/android_x86_64_static_cfi_apex29/libwavextractor.a
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_shared_cfi/libstagefright_httplive.so prebuiltlibs/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_shared_cfi/libstagefright_httplive.so
mkdir -p prebuiltlibs/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_static_cfi/libstagefright_httplive.a prebuiltlibs/frameworks/av/media/libstagefright/httplive/libstagefright_httplive/android_x86_x86_64_static_cfi/libstagefright_httplive.a
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_shared_cfi/libmediaplayerservice.so prebuiltlibs/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_shared_cfi/libmediaplayerservice.so
mkdir -p prebuiltlibs/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_static_cfi/libmediaplayerservice.a prebuiltlibs/frameworks/av/media/libmediaplayerservice/libmediaplayerservice/android_x86_x86_64_static_cfi/libmediaplayerservice.a
mkdir -p prebuiltlibs/frameworks/av/media/mediaserver/mediaserver/android_x86_x86_64/ && mv out/soong/.intermediates/frameworks/av/media/mediaserver/mediaserver/android_x86_x86_64/mediaserver prebuiltlibs/frameworks/av/media/mediaserver/mediaserver/android_x86_x86_64/mediaserver
mkdir -p prebuiltlibs/frameworks/av/cmds/screenrecord/screenrecord/android_x86_64/ && mv out/soong/.intermediates/frameworks/av/cmds/screenrecord/screenrecord/android_x86_64/screenrecord prebuiltlibs/frameworks/av/cmds/screenrecord/screenrecord/android_x86_64/screenrecord

printf "cc_prebuilt_library {\n  name: \"libstagefright\",\n  shared_libs: [\"libstagefright_framecapture_utils\",\"libaudioutils\",\"libbase\",\"libbinder\",\"libbinder_ndk\",\"libcamera_client\",\"libcodec2\",\"libcodec2_vndk\",\"libcutils\",\"libdatasource\",\"libdl\",\"libdl_android\",\"libgui\",\"liblog\",\"libmedia\",\"libmedia_codeclist\",\"libmedia_omx\",\"libmedia_omx_client\",\"libaudioclient\",\"libmediametrics\",\"libui\",\"libutils\",\"libmedia_helper\",\"libsfplugin_ccodec\",\"libsfplugin_ccodec_utils\",\"libstagefright_codecbase\",\"libstagefright_foundation\",\"libstagefright_omx_utils\",\"libRScpp\",\"libhidlallocatorutils\",\"libhidlbase\",\"libhidlmemory\",\"android.hidl.allocator@1.0\",\"android.hardware.cas.native@1.0\",\"android.hardware.drm@1.0\",\"android.hardware.media.omx@1.0\",\"framework-permission-aidl-cpp\",\"libaudioclient_aidl_conversion\"],\n  static_libs: [\"libstagefright_esds\",\"libstagefright_color_conversion\",\"libyuv_static\",\"libstagefright_mediafilter\",\"libstagefright_webm\",\"libstagefright_timedtext\",\"libogg\",\"libwebm\",\"libstagefright_id3\",\"framework-permission-aidl-cpp\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n  export_shared_lib_headers: [\"libgui\",\"libhidlmemory\",\"libmedia\",\"android.hidl.allocator@1.0\",\"framework-permission-aidl-cpp\"],\n  export_include_dirs: [\"include\"],\n  version_script: \"exports.lds\",\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libcameraservice\",\n  shared_libs: [\"libbase\",\"libdl\",\"libexif\",\"libui\",\"liblog\",\"libutilscallstack\",\"libutils\",\"libbinder\",\"libactivitymanager_aidl\",\"libpermission\",\"libcutils\",\"libmedia\",\"libmediautils\",\"libcamera_client\",\"libcamera_metadata\",\"libdynamic_depth\",\"libfmq\",\"libgui\",\"libhardware\",\"libhidlbase\",\"libimage_io\",\"libjpeg\",\"libmedia_codeclist\",\"libmedia_omx\",\"libmemunreachable\",\"libsensorprivacy\",\"libstagefright\",\"libstagefright_foundation\",\"libxml2\",\"libyuv\",\"android.frameworks.cameraservice.common@2.0\",\"android.frameworks.cameraservice.service@2.0\",\"android.frameworks.cameraservice.service@2.1\",\"android.frameworks.cameraservice.service@2.2\",\"android.frameworks.cameraservice.device@2.0\",\"android.frameworks.cameraservice.device@2.1\",\"android.hardware.camera.common@1.0\",\"android.hardware.camera.provider@2.4\",\"android.hardware.camera.provider@2.5\",\"android.hardware.camera.provider@2.6\",\"android.hardware.camera.provider@2.7\",\"android.hardware.camera.device@3.2\",\"android.hardware.camera.device@3.3\",\"android.hardware.camera.device@3.4\",\"android.hardware.camera.device@3.5\",\"android.hardware.camera.device@3.6\",\"android.hardware.camera.device@3.7\",\"media_permission-aidl-cpp\"],\n  static_libs: [\"libprocessinfoservice_aidl\",\"libbinderthreadstateutils\",\"media_permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"libbinder\",\"libactivitymanager_aidl\",\"libpermission\",\"libcamera_client\",\"libfmq\",\"libsensorprivacy\"],\n  export_include_dirs: [\".\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcameraservice.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/camera/libcameraservice/Android.bp
printf "cc_prebuilt_binary {\n  name: \"cameraserver\",\n  shared_libs: [\"libcameraservice\",\"liblog\",\"libutils\",\"libui\",\"libgui\",\"libbinder\",\"libhidlbase\",\"android.hardware.camera.common@1.0\",\"android.hardware.camera.provider@2.4\",\"android.hardware.camera.provider@2.5\",\"android.hardware.camera.provider@2.6\",\"android.hardware.camera.provider@2.7\",\"android.hardware.camera.device@1.0\",\"android.hardware.camera.device@3.2\",\"android.hardware.camera.device@3.4\"],\n  compile_multilib: \"first\",\n  init_rc: [\"cameraserver.rc\"],\n  vintf_fragments: [\"manifest_android.frameworks.cameraservice.service@2.2.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"cameraserver\"],\n}\n" >> prebuiltlibs/frameworks/av/camera/cameraserver/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediaextractorservice\",\n  shared_libs: [\"libdatasource\",\"libmedia\",\"libstagefright\",\"libstagefright_foundation\",\"libbinder\",\"libutils\",\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediaextractorservice.so\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediaextractor/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mediaextractor\",\n  shared_libs: [\"libmedia\",\"libmediaextractorservice\",\"libmediautils\",\"libbinder\",\"libutils\",\"liblog\",\"libavservices_minijail\"],\n  init_rc: [\"mediaextractor.rc\"],\n  required: [\"mediaextractor.policy\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediaextractor\"],\n}\n" >> prebuiltlibs/frameworks/av/services/mediaextractor/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libmediandk\",\n  llndk: {\n    symbol_file: \"libmediandk.map.txt\",\n  },\n  static_libs: [\"libgrallocusage\",\"libnativehelper_lazy\"],\n  header_libs: [\"jni_headers\"],\n  shared_libs: [\"android.hardware.graphics.bufferqueue@1.0\",\"android.hidl.token@1.0-utils\",\"libandroid_runtime_lazy\",\"libbase\",\"libdatasource\",\"libmedia\",\"libmediadrm\",\"libmedia_omx\",\"libmedia_jni_utils\",\"libstagefright\",\"libstagefright_foundation\",\"liblog\",\"libutils\",\"libcutils\",\"libnativewindow\",\"libhidlbase\",\"libgui\",\"libui\",\"libmediandk_utils\"],\n  export_header_lib_headers: [\"jni_headers\"],\n  export_include_dirs: [\"include\",\"include_platform\"],\n  export_shared_lib_headers: [\"libgui\"],\n  version_script: \"libmediandk.map.txt\",\n  stubs: {\n    symbol_file: \"libmediandk.map.txt\",\n    versions: [\"29\"],\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libmediandk.so\"],\n}\n" >> prebuiltlibs/frameworks/av/media/ndk/Android.bp
printf "cc_prebuilt_library {\n  name: \"libaacextractor\",\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_foundation\",\"libstagefright_metadatautils\",\"libutils\"],\n  host_supported: true,\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libaacextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libaacextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/aac/Android.bp
printf "cc_prebuilt_library {\n  name: \"libamrextractor\",\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_foundation\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libamrextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libamrextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/amr/Android.bp
printf "cc_prebuilt_library {\n  name: \"libflacextractor\",\n  shared_libs: [\"liblog\",\"libbase\",\"libbinder_ndk\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libaudioutils\",\"libFLAC\",\"libstagefright_foundation\",\"libstagefright_metadatautils\",\"libutils\"],\n  host_supported: true,\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libflacextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libflacextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/flac/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediaformatshaper\",\n  shared_libs: [\"liblog\",\"libutils\"],\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  min_sdk_version: \"29\",\n  apex_available: [\"//apex_available:platform\",\"com.android.media\"],\n  version_script: \"exports.lds\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediaformatshaper.a\"],\n  },\n  shared: {\n    srcs: [\"libmediaformatshaper.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediaformatshaper/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmediatranscoder\",\n  min_sdk_version: \"29\",\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  static_libs: [\"libarect\"],\n  shared_libs: [\"libbase\",\"libcutils\",\"libmediandk\",\"libnativewindow\",\"libutils\",\"libbinder_ndk\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediatranscoder.a\"],\n  },\n  shared: {\n    srcs: [\"libmediatranscoder.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediatranscoding/transcoder/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmidiextractor\",\n  shared_libs: [\"liblog\",\"libbase\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libmedia_midiiowrapper\",\"libsonivoxwithoutjet\",\"libstagefright_foundation\",\"libwatchdog\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmidiextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libmidiextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/midi/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmkvextractor\",\n  shared_libs: [\"liblog\",\"libstagefright_flacdec\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_foundation_colorutils_ndk\",\"libstagefright_foundation\",\"libstagefright_metadatautils\",\"libwebm\",\"libutils\"],\n  host_supported: true,\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmkvextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libmkvextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/mkv/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmp3extractor\",\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libutils\",\"libstagefright_id3\",\"libstagefright_foundation\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmp3extractor.a\"],\n  },\n  shared: {\n    srcs: [\"libmp3extractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/mp3/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmp4extractor\",\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_esds\",\"libstagefright_foundation\",\"libstagefright_id3\",\"libutils\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmp4extractor.a\"],\n  },\n  shared: {\n    srcs: [\"libmp4extractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/mp4/Android.bp
printf "cc_prebuilt_library {\n  name: \"libmpeg2extractor\",\n  shared_libs: [\"liblog\",\"libbase\",\"libcgrouprc#29\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\",\"libvndksupport#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  host_supported: true,\n  static_libs: [\"android.hardware.cas@1.0\",\"android.hardware.cas.native@1.0\",\"android.hidl.allocator@1.0\",\"android.hidl.memory@1.0\",\"android.hidl.token@1.0\",\"android.hidl.token@1.0-utils\",\"libcutils\",\"libhidlbase\",\"libhidlmemory\",\"libjsoncpp\",\"libprocessgroup\",\"libstagefright_esds\",\"libstagefright_foundation_without_imemory\",\"libstagefright_mpeg2extractor\",\"libstagefright_mpeg2support_nocrypto\",\"libutils\"],\n  apex_available: [\"com.android.media\",\"test_com.android.media\"],\n  static: {\n    apex_available: [\"//apex_available:platform\"],\n    srcs: [\"libmpeg2extractor.a\"],\n  },\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  shared: {\n    srcs: [\"libmpeg2extractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/mpeg2/Android.bp
printf "cc_prebuilt_library {\n  name: \"liboggextractor\",\n  shared_libs: [\"liblog\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libstagefright_foundation\",\"libstagefright_metadatautils\",\"libutils\",\"libvorbisidec\"],\n  host_supported: true,\n  use_apex_name_macro: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"liboggextractor.a\"],\n  },\n  shared: {\n    srcs: [\"liboggextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/ogg/Android.bp
printf "cc_prebuilt_library {\n  name: \"libwavextractor\",\n  shared_libs: [\"liblog\",\"libbase\",\"libbinder_ndk\"],\n  min_sdk_version: \"29\",\n  relative_install_path: \"extractors\",\n  compile_multilib: \"first\",\n  version_script: \"exports.lds\",\n  target: {\n    android: {\n      shared_libs: [\"libmediandk#29\"],\n    },\n    host: {\n      static_libs: [\"libutils\",\"libmediandk_format\",\"libmedia_ndkformatpriv\"],\n    },\n    darwin: {\n      enabled: false,\n    },\n  },\n  sanitize: {\n    cfi: true,\n    misc_undefined: [\"unsigned-integer-overflow\",\"signed-integer-overflow\"],\n  },\n  static_libs: [\"libaudioutils\",\"libfifo\",\"libstagefright_foundation\"],\n  host_supported: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libwavextractor.a\"],\n  },\n  shared: {\n    srcs: [\"libwavextractor.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/extractors/wav/Android.bp
printf "cc_prebuilt_library {\n  name: \"libstagefright_httplive\",\n  sanitize: {\n    misc_undefined: [\"signed-integer-overflow\",\"unsigned-integer-overflow\"],\n    cfi: true,\n  },\n  shared_libs: [\"liblog\",\"libcrypto\",\"libcutils\",\"libdatasource\",\"libmedia\",\"libmediandk\",\"libstagefright\",\"libstagefright_foundation\",\"libutils\",\"libhidlbase\",\"libhidlmemory\",\"android.hardware.cas@1.0\",\"android.hardware.cas.native@1.0\",\"android.hidl.allocator@1.0\"],\n  static_libs: [\"libstagefright_id3\",\"libstagefright_metadatautils\",\"libstagefright_mpeg2support\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libstagefright_httplive.a\"],\n  },\n  shared: {\n    srcs: [\"libstagefright_httplive.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libstagefright/httplive/Android.bp
printf "cc_prebuilt_library {\n  shared_libs: [\"android.hardware.media.c2@1.0\",\"android.hardware.media.omx@1.0\",\"av-types-aidl-cpp\",\"framework-permission-aidl-cpp\",\"libaudioclient_aidl_conversion\",\"libbase\",\"libactivitymanager_aidl\",\"libandroid_net\",\"libaudioclient\",\"libbinder\",\"libcamera_client\",\"libcodec2_client\",\"libcrypto\",\"libcutils\",\"libdatasource\",\"libdl\",\"libdrmframework\",\"libgui\",\"libhidlbase\",\"liblog\",\"libmedia\",\"libmedia_codeclist\",\"libmedia_omx\",\"libmediadrm\",\"libmediametrics\",\"libmediautils\",\"libmemunreachable\",\"libnetd_client\",\"libpowermanager\",\"libstagefright\",\"libstagefright_foundation\",\"libstagefright_httplive\",\"libutils\"],\n  static_libs: [\"libplayerservice_datasource\",\"libstagefright_nuplayer\",\"libstagefright_rtsp\",\"libstagefright_timedtext\",\"framework-permission-aidl-cpp\"],\n  export_shared_lib_headers: [\"libmedia\",\"framework-permission-aidl-cpp\"],\n  name: \"libmediaplayerservice\",\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libmediaplayerservice.a\"],\n  },\n  shared: {\n    srcs: [\"libmediaplayerservice.so\"],\n  },\n}\n" >> prebuiltlibs/frameworks/av/media/libmediaplayerservice/Android.bp
printf "cc_prebuilt_binary {\n  name: \"mediaserver\",\n  shared_libs: [\"android.hardware.media.omx@1.0\",\"libandroidicu\",\"libfmq\",\"libbinder\",\"libhidlbase\",\"liblog\",\"libmediaplayerservice\",\"libresourcemanagerservice\",\"libutils\"],\n  compile_multilib: \"prefer32\",\n  init_rc: [\"mediaserver.rc\"],\n  vintf_fragments: [\"manifest_media_c2_software.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"mediaserver\"],\n}\n" >> prebuiltlibs/frameworks/av/media/mediaserver/Android.bp
printf "cc_prebuilt_binary {\n  name: \"screenrecord\",\n  shared_libs: [\"libstagefright\",\"libmedia\",\"libmediandk\",\"libmedia_omx\",\"libutils\",\"libbinder\",\"libstagefright_foundation\",\"libjpeg\",\"libui\",\"libgui\",\"libcutils\",\"liblog\",\"libEGL\",\"libGLESv2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"screenrecord\"],\n}\n" >> prebuiltlibs/frameworks/av/cmds/screenrecord/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/av/ninja && rsync -ar out/soong/ninja/frameworks/av/ prebuiltlibs/frameworks/av/ninja/frameworks_av-13
touch prebuiltlibs/frameworks/av/ninja/.find-ignore
tar cfJ frameworks_av-13.tar.xz -C prebuiltlibs/frameworks/av/ .
ls -l frameworks_av-13.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/frameworks/native/libs/renderengine/librenderengine/android_x86_64_static/librenderengine.a \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine/android_x86_64_static_lto-thin/libcompositionengine.a \
  out/soong/.intermediates/frameworks/native/services/surfaceflinger/surfaceflinger/android_x86_64/surfaceflinger \
  

mkdir -p prebuiltlibs/frameworks/native/libs/renderengine/librenderengine/android_x86_64_static/ && mv out/soong/.intermediates/frameworks/native/libs/renderengine/librenderengine/android_x86_64_static/librenderengine.a prebuiltlibs/frameworks/native/libs/renderengine/librenderengine/android_x86_64_static/librenderengine.a
mkdir -p prebuiltlibs/frameworks/native/libs/renderengine/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/libs/renderengine/include/ prebuiltlibs/frameworks/native/libs/renderengine/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine/android_x86_64_static_lto-thin/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine/android_x86_64_static_lto-thin/libcompositionengine.a prebuiltlibs/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine/android_x86_64_static_lto-thin/libcompositionengine.a
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/CompositionEngine/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" frameworks/native/services/surfaceflinger/CompositionEngine/include/ prebuiltlibs/frameworks/native/services/surfaceflinger/CompositionEngine/include
mkdir -p prebuiltlibs/frameworks/native/services/surfaceflinger/surfaceflinger/android_x86_64/ && mv out/soong/.intermediates/frameworks/native/services/surfaceflinger/surfaceflinger/android_x86_64/surfaceflinger prebuiltlibs/frameworks/native/services/surfaceflinger/surfaceflinger/android_x86_64/surfaceflinger

printf "cc_prebuilt_library_static {\n  name: \"librenderengine\",\n  shared_libs: [\"libbase\",\"libcutils\",\"libEGL\",\"libGLESv1_CM\",\"libGLESv2\",\"libgui\",\"liblog\",\"libnativewindow\",\"libprocessgroup\",\"libsync\",\"libui\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  double_loadable: true,\n  clang: true,\n  whole_static_libs: [\"libskia_renderengine\"],\n  lto: {\n    thin: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"librenderengine.a\"],\n}\n" >> prebuiltlibs/frameworks/native/libs/renderengine/Android.bp
printf "cc_prebuilt_library {\n  name: \"libcompositionengine\",\n  shared_libs: [\"android.hardware.graphics.allocator@2.0\",\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.composer@2.2\",\"android.hardware.graphics.composer@2.3\",\"android.hardware.graphics.composer@2.4\",\"android.hardware.power@1.0\",\"android.hardware.power@1.3\",\"libbase\",\"libcutils\",\"libgui\",\"liblayers_proto\",\"liblog\",\"libnativewindow\",\"libprotobuf-cpp-lite\",\"libSurfaceFlingerProp\",\"libtimestats\",\"libui\",\"libutils\"],\n  static_libs: [\"libmath\",\"librenderengine\",\"libtrace_proto\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libcompositionengine.a\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/CompositionEngine/Android.bp
printf "cc_prebuilt_binary {\n  name: \"surfaceflinger\",\n  shared_libs: [\"libcutils\",\"liblog\",\"libpng\",\"libz\",\"android.hardware.configstore-utils\",\"android.hardware.configstore@1.0\",\"android.hardware.configstore@1.1\",\"android.hardware.graphics.allocator@2.0\",\"android.hardware.graphics.allocator@3.0\",\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.composer@2.2\",\"android.hardware.graphics.composer@2.3\",\"android.hardware.graphics.composer@2.4\",\"android.hardware.power@1.0\",\"android.hardware.power@1.3\",\"android.hardware.power-V1-cpp\",\"libbase\",\"libbinder\",\"libEGL\",\"libfmq\",\"libGLESv1_CM\",\"libGLESv2\",\"libgui\",\"libhidlbase\",\"liblayers_proto\",\"libnativewindow\",\"libprocessgroup\",\"libprotobuf-cpp-lite\",\"libsync\",\"libtimestats\",\"libui\",\"libinput\",\"libutils\",\"libSurfaceFlingerProp\",\"android.frameworks.displayservice@1.0\",\"libdisplayservicehidl\"],\n  group_static_libs: true,\n  target: {\n    android: {\n      shared_libs: [\"libEGL\",\"libGLESv2\",\"libvulkan\",\"libnativewindow\"],\n      export_shared_lib_headers: [\"libvulkan\"],\n    },\n  },\n  export_shared_lib_headers: [\"android.hardware.graphics.allocator@2.0\",\"android.hardware.graphics.allocator@3.0\",\"android.hardware.graphics.common@1.2\",\"android.hardware.graphics.composer@2.1\",\"android.hardware.graphics.composer@2.2\",\"android.hardware.graphics.composer@2.3\",\"android.hardware.graphics.composer@2.4\",\"android.hardware.power@1.3\",\"libhidlbase\",\"libtimestats\"],\n  required: [\"libgralloctypes\"],\n  lto: {\n    thin: true,\n  },\n  whole_program_vtables: true,\n  pgo: {\n    sampling: true,\n    profile_file: \"surfaceflinger/surfaceflinger.profdata\",\n  },\n  sanitize: {\n    fuzzer: false,\n  },\n  init_rc: [\"surfaceflinger.rc\"],\n  logtags: [\"EventLog/EventLogTags.logtags\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"surfaceflinger\"],\n}\n" >> prebuiltlibs/frameworks/native/services/surfaceflinger/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/frameworks/native/ninja && rsync -ar out/soong/ninja/frameworks/native/ prebuiltlibs/frameworks/native/ninja/frameworks_native-13
touch prebuiltlibs/frameworks/native/ninja/.find-ignore
tar cfJ frameworks_native-13.tar.xz -C prebuiltlibs/frameworks/native/ .
ls -l frameworks_native-13.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
