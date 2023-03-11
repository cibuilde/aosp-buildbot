source $GITHUB_WORKSPACE/envsetup.sh
df -h


mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libadb_protos/android_x86_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_recovery_x86_64_shared/
mkdir -p prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/ && rsync -ar prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_static/ prebuiltlibs/packages/modules/adb/proto/libapp_processes_protos_lite/android_x86_64_shared/

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build \
  out/soong/.intermediates/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build prebuiltlibs/external/rust/crates/libsqlite3-sys/android/sqlite3_bindgen_build/linux_glibc_x86_64/sqlite3_bindgen_build
mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib prebuiltlibs/external/rust/crates/libsqlite3-sys/liblibsqlite3_sys/android_x86_64_rlib_rlib-std/liblibsqlite3_sys.rlib

printf "cc_prebuilt_binary {\n  name: \"sqlite3_bindgen_build\",\n  stl: \"none\",\n  prefer: true,\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sqlite3_bindgen_build\"],\n}\n" >> prebuiltlibs/external/rust/crates/libsqlite3-sys/android/Android.bp
printf "rust_prebuilt_rlib {\n  name: \"liblibsqlite3_sys\",\n  host_supported: true,\n  crate_name: \"libsqlite3_sys\",\n  edition: \"2018\",\n  features: [\"default\",\"min_sqlite_version_3_6_8\",\"pkg-config\",\"vcpkg\"],\n  shared_libs: [\"libsqlite\"],\n  multiple_variants: true,\n  srcs: [\"liblibsqlite3_sys.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/libsqlite3-sys/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja && rsync -ar out/soong/ninja/external/rust/crates/libsqlite3-sys/ prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja/external_rust_crates_libsqlite3-sys-9
touch prebuiltlibs/external/rust/crates/libsqlite3-sys/ninja/.find-ignore
tar cfJ external_rust_crates_libsqlite3-sys-9.tar.xz -C prebuiltlibs/external/rust/crates/libsqlite3-sys/ .
ls -l external_rust_crates_libsqlite3-sys-9.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a \
  out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so \
  out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a \
  out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so \
  

mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/librilutils.a
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/librilutils.so
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/librilutils.a
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/librilutils.so
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_64_shared/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/
mkdir -p prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/ && rsync -ar out/soong/.intermediates/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_static/gen/proto prebuiltlibs/hardware/ril/librilutils/librilutils/android_vendor.31_x86_x86_64_shared/

printf "cc_prebuilt_library {\n  name: \"librilutils\",\n  header_libs: [\"ril_headers\"],\n  export_header_lib_headers: [\"ril_headers\"],\n  vendor: true,\n  prebuilt_proto: true,\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  static: {\n    srcs: [\"librilutils.a\"],\n  },\n  shared: {\n    srcs: [\"librilutils.so\"],\n  },\n}\n" >> prebuiltlibs/hardware/ril/librilutils/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/hardware/ril/ninja && rsync -ar out/soong/ninja/hardware/ril/ prebuiltlibs/hardware/ril/ninja/hardware_ril-9
touch prebuiltlibs/hardware/ril/ninja/.find-ignore
tar cfJ hardware_ril-9.tar.xz -C prebuiltlibs/hardware/ril/ .
ls -l hardware_ril-9.tar.xz
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_shared/android.system.keystore2-V1-cpp.so \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_static/android.system.keystore2-V1-cpp.a \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_shared/android.system.keystore2-V1-ndk_platform.so \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_static/android.system.keystore2-V1-ndk_platform.a \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_shared/android.system.keystore2-V1-ndk_platform.so \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_static/android.system.keystore2-V1-ndk_platform.a \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_shared/android.system.keystore2-V1-ndk_platform.so \
  out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_static/android.system.keystore2-V1-ndk_platform.a \
  out/soong/.intermediates/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_shared/android.system.net.netd@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_static/android.system.net.netd@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_shared/android.system.net.netd@1.1.so \
  out/soong/.intermediates/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_static/android.system.net.netd@1.1.a \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_shared/android.system.suspend@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_static/android.system.suspend@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_shared/android.system.suspend@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_static/android.system.suspend@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_shared/android.system.suspend@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_static/android.system.suspend@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_shared/android.system.suspend@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_static/android.system.suspend@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service \
  out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_shared/android.system.wifi.keystore@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_static/android.system.wifi.keystore@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_shared/android.system.wifi.keystore@1.0.so \
  out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_static/android.system.wifi.keystore@1.0.a \
  out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a \
  

mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_shared/android.system.keystore2-V1-cpp.so prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_shared/android.system.keystore2-V1-cpp.so
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_static/android.system.keystore2-V1-cpp.a prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-cpp/android_x86_64_static/android.system.keystore2-V1-cpp.a
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_shared/android.system.keystore2-V1-ndk_platform.so prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_shared/android.system.keystore2-V1-ndk_platform.so
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_static/android.system.keystore2-V1-ndk_platform.a prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_x86_64_static/android.system.keystore2-V1-ndk_platform.a
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_shared/android.system.keystore2-V1-ndk_platform.so prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_shared/android.system.keystore2-V1-ndk_platform.so
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_static/android.system.keystore2-V1-ndk_platform.a prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_64_static/android.system.keystore2-V1-ndk_platform.a
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_shared/android.system.keystore2-V1-ndk_platform.so prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_shared/android.system.keystore2-V1-ndk_platform.so
mkdir -p prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_static/android.system.keystore2-V1-ndk_platform.a prebuiltlibs/system/hardware/interfaces/keystore2/aidl/android.system.keystore2-V1-ndk_platform/android_vendor.31_x86_x86_64_static/android.system.keystore2-V1-ndk_platform.a
mkdir -p prebuiltlibs/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_shared/android.system.net.netd@1.0.so prebuiltlibs/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_shared/android.system.net.netd@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_static/android.system.net.netd@1.0.a prebuiltlibs/system/hardware/interfaces/net/netd/1.0/android.system.net.netd@1.0/android_x86_64_static/android.system.net.netd@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_shared/android.system.net.netd@1.1.so prebuiltlibs/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_shared/android.system.net.netd@1.1.so
mkdir -p prebuiltlibs/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_static/android.system.net.netd@1.1.a prebuiltlibs/system/hardware/interfaces/net/netd/1.1/android.system.net.netd@1.1/android_x86_64_static/android.system.net.netd@1.1.a
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_shared/android.system.suspend@1.0.so prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_shared/android.system.suspend@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_static/android.system.suspend@1.0.a prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_64_static/android.system.suspend@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_shared/android.system.suspend@1.0.so prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_shared/android.system.suspend@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_static/android.system.suspend@1.0.a prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_vendor.31_x86_x86_64_static/android.system.suspend@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_shared/android.system.suspend@1.0.so prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_shared/android.system.suspend@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_static/android.system.suspend@1.0.a prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_64_static/android.system.suspend@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_shared/android.system.suspend@1.0.so prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_shared/android.system.suspend@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_static/android.system.suspend@1.0.a prebuiltlibs/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0/android_x86_x86_64_static/android.system.suspend@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/ && mv out/soong/.intermediates/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/android.system.suspend@1.0-service/android_x86_64/android.system.suspend@1.0-service
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_shared/android.system.wifi.keystore@1.0.so prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_shared/android.system.wifi.keystore@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_static/android.system.wifi.keystore@1.0.a prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_x86_64_static/android.system.wifi.keystore@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_shared/android.system.wifi.keystore@1.0.so prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_shared/android.system.wifi.keystore@1.0.so
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_static/android.system.wifi.keystore@1.0.a prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/android.system.wifi.keystore@1.0/android_vendor.31_x86_64_static/android.system.wifi.keystore@1.0.a
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/ && mv out/soong/.intermediates/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/libwifikeystorehal/android_x86_64_static/libwifikeystorehal.a
mkdir -p prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" system/hardware/interfaces/wifi/keystore/1.0/default/include/ prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/include

printf "\n" >> prebuiltlibs/system/hardware/interfaces/keystore2/aidl/Android.bp
printf "\n" >> prebuiltlibs/system/hardware/interfaces/keystore2/aidl/Android.bp
printf "\n" >> prebuiltlibs/system/hardware/interfaces/net/netd/1.0/Android.bp
printf "\n" >> prebuiltlibs/system/hardware/interfaces/net/netd/1.1/Android.bp
printf "\n" >> prebuiltlibs/system/hardware/interfaces/suspend/1.0/Android.bp
printf "cc_prebuilt_binary {\n  name: \"android.system.suspend@1.0-service\",\n  shared_libs: [\"libbase\",\"libbinder\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libutils\",\"android.system.suspend.control-V1-cpp\",\"android.system.suspend.control.internal-cpp\",\"android.system.suspend@1.0\",\"SuspendProperties\"],\n  relative_install_path: \"hw\",\n  init_rc: [\"android.system.suspend@1.0-service.rc\"],\n  vintf_fragments: [\"android.system.suspend@1.0-service.xml\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"android.system.suspend@1.0-service\"],\n}\n" >> prebuiltlibs/system/hardware/interfaces/suspend/1.0/default/Android.bp
printf "\n" >> prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libwifikeystorehal\",\n  shared_libs: [\"android.system.keystore2-V1-ndk_platform\",\"android.security.legacykeystore-ndk_platform\",\"android.system.wifi.keystore@1.0\",\"libbase\",\"libbinder\",\"libbinder_ndk\",\"libcrypto\",\"libcutils\",\"libhidlbase\",\"liblog\",\"libssl\",\"libutils\"],\n  export_include_dirs: [\"include\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwifikeystorehal.a\"],\n}\n" >> prebuiltlibs/system/hardware/interfaces/wifi/keystore/1.0/default/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/hardware/interfaces/ninja && rsync -ar out/soong/ninja/system/hardware/interfaces/ prebuiltlibs/system/hardware/interfaces/ninja/system_hardware_interfaces-9
touch prebuiltlibs/system/hardware/interfaces/ninja/.find-ignore
tar cfJ system_hardware_interfaces-9.tar.xz -C prebuiltlibs/system/hardware/interfaces/ .
ls -l system_hardware_interfaces-9.tar.xz
end=`date +%s`
echo $((end-start))


du -ah -d1 out/soong |sort -h
