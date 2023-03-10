source $GITHUB_WORKSPACE/envsetup.sh
df -h


mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so \
  out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a \
  out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so \
  out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a \
  out/soong/.intermediates/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_shared/netd_aidl_interface-V6-cpp.so \
  out/soong/.intermediates/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_static/netd_aidl_interface-V6-cpp.a \
  out/soong/.intermediates/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_shared/netd_aidl_interface-V7-cpp.so \
  out/soong/.intermediates/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_static/netd_aidl_interface-V7-cpp.a \
  out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_shared/netd_event_listener_interface-V1-cpp.so \
  out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_static/netd_event_listener_interface-V1-cpp.a \
  out/soong/.intermediates/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a \
  out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-V1-ndk_platform.a \
  out/soong/.intermediates/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a \
  out/soong/.intermediates/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_shared/oemnetd_aidl_interface-cpp.so \
  out/soong/.intermediates/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_static/oemnetd_aidl_interface-cpp.a \
  

mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/ && mv out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_shared_cfi/libnetdbpf.so
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/ && mv out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_64_static_cfi/libnetdbpf.a
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/ && mv out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_shared_cfi/libnetdbpf.so
mkdir -p prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/ && mv out/soong/.intermediates/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a prebuiltlibs/system/netd/libnetdbpf/libnetdbpf/android_x86_x86_64_static_cfi/libnetdbpf.a
mkdir -p prebuiltlibs/system/netd/libnetdbpf/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/netd/libnetdbpf/include/ prebuiltlibs/system/netd/libnetdbpf/include
mkdir -p prebuiltlibs/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_shared/netd_aidl_interface-V6-cpp.so prebuiltlibs/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_shared/netd_aidl_interface-V6-cpp.so
mkdir -p prebuiltlibs/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_static/netd_aidl_interface-V6-cpp.a prebuiltlibs/system/netd/server/netd_aidl_interface-V6-cpp/android_x86_64_static/netd_aidl_interface-V6-cpp.a
mkdir -p prebuiltlibs/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_shared/netd_aidl_interface-V7-cpp.so prebuiltlibs/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_shared/netd_aidl_interface-V7-cpp.so
mkdir -p prebuiltlibs/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_static/netd_aidl_interface-V7-cpp.a prebuiltlibs/system/netd/server/netd_aidl_interface-V7-cpp/android_x86_64_static/netd_aidl_interface-V7-cpp.a
mkdir -p prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_shared/netd_event_listener_interface-V1-cpp.so prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_shared/netd_event_listener_interface-V1-cpp.so
mkdir -p prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_static/netd_event_listener_interface-V1-cpp.a prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-cpp/android_x86_64_static/netd_event_listener_interface-V1-cpp.a
mkdir -p prebuiltlibs/system/netd/server/libnetd_server/android_x86_64_static_cfi/ && mv out/soong/.intermediates/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a prebuiltlibs/system/netd/server/libnetd_server/android_x86_64_static_cfi/libnetd_server.a
mkdir -p prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-ndk_platform/android_x86_64_static_cfi_com.android.resolv/ && mv out/soong/.intermediates/system/netd/server/netd_event_listener_interface-V1-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-V1-ndk_platform.a prebuiltlibs/system/netd/server/netd_event_listener_interface-V1-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-V1-ndk_platform.a
mkdir -p prebuiltlibs/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/ && mv out/soong/.intermediates/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a prebuiltlibs/system/netd/server/netd_event_listener_interface-lateststable-ndk_platform/android_x86_64_static_cfi_com.android.resolv/netd_event_listener_interface-lateststable-ndk_platform.a
mkdir -p prebuiltlibs/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_shared/oemnetd_aidl_interface-cpp.so prebuiltlibs/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_shared/oemnetd_aidl_interface-cpp.so
mkdir -p prebuiltlibs/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_static/oemnetd_aidl_interface-cpp.a prebuiltlibs/system/netd/server/oemnetd_aidl_interface-cpp/android_x86_64_static/oemnetd_aidl_interface-cpp.a

printf "cc_prebuilt_library {\n  name: \"libnetdbpf\",\n  vendor_available: false,\n  host_supported: false,\n  shared_libs: [\"libbase\",\"libbpf_android\",\"liblog\",\"libnetdutils\"],\n  export_include_dirs: [\"include\"],\n  sanitize: {\n    cfi: true,\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"libnetdbpf.a\"],\n  },\n  shared: {\n    srcs: [\"libnetdbpf.so\"],\n  },\n}\n" >> prebuiltlibs/system/netd/libnetdbpf/Android.bp
printf "\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libnetd_server\",\n  shared_libs: [\"libbpf_android\",\"libbase\",\"libbinder\",\"libnetdbpf\",\"libnetutils\",\"libnetdutils\",\"libpcap\",\"libqtaguid\",\"libssl\",\"libsysutils\",\"netd_aidl_interface-V7-cpp\",\"netd_event_listener_interface-V1-cpp\"],\n  prebuilt_aidl: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libnetd_server.a\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"netd_event_listener_interface-lateststable-ndk_platform\",\n  whole_static_libs: [\"netd_event_listener_interface-V1-ndk_platform\"],\n  apex_available: [\"com.android.resolv\"],\n  min_sdk_version: \"29\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"netd_event_listener_interface-lateststable-ndk_platform.a\"],\n}\n" >> prebuiltlibs/system/netd/server/Android.bp
printf "\n" >> prebuiltlibs/system/netd/server/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/netd/ninja && rsync -ar out/soong/ninja/system/netd/ prebuiltlibs/system/netd/ninja/system_netd-8
touch prebuiltlibs/system/netd/ninja/.find-ignore
tar cfJ system_netd-8.tar.xz -C prebuiltlibs/system/netd/ .
ls -l system_netd-8.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
