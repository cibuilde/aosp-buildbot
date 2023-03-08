source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex31/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex10000/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_recovery_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_product.31_x86_64_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex29/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex30/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_static/libc++_static.a \
  out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex31/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex31/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex10000/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_recovery_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_product.31_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex29/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex29/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/libc++.so \
  out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_shared/libc++.so \
  

mkdir -p prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex31/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex31/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex10000/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex10000/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_recovery_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_recovery_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_recovery_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_product.31_x86_64_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_product.31_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_product.31_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex30/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex30/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/ && mv out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_static/ && mv out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxx/include/ prebuiltlibs/external/libcxx/include
mkdir -p prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex31/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex31/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex31/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex31/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex31/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex10000/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex10000/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_recovery_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_recovery_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_recovery_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_product.31_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_product.31_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_product.31_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex29/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex29/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex29/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex29/ && mv out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex29/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex29/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_shared/ && mv out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_shared/libc++.so prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_shared/libc++.so

printf "cc_prebuilt_library_static {\n  name: \"libc++_static\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  stl: \"none\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc++abi\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++_static.a\"],\n}\n" >> prebuiltlibs/external/libcxx/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libc++\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  whole_static_libs: [\"libc++_static\"],\n  stl: \"none\",\n  pgo: {\n    sampling: true,\n  },\n  target: {\n    android: {\n      pgo: {\n        profile_file: \"libc++/libc++.profdata\",\n      },\n    },\n    darwin: {\n      unexported_symbols_list: \"lib/libc++unexp.exp\",\n      force_symbols_not_weak_list: \"lib/notweak.exp\",\n      force_symbols_weak_list: \"lib/weak.exp\",\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  export_include_dirs: [\"include\"],\n  srcs: [\"libc++.so\"],\n}\n" >> prebuiltlibs/external/libcxx/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/libcxx/ninja && rsync -ar out/soong/ninja/external/libcxx/ prebuiltlibs/external/libcxx/ninja/external_libcxx-3
touch prebuiltlibs/external/libcxx/ninja/.find-ignore
tar cfJ external_libcxx-3.tar.xz -C prebuiltlibs/external/libcxx/ .
ls -l external_libcxx-3.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so \
  

mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so prebuiltlibs/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so

printf "rust_prebuilt_proc_macro {\n  name: \"libproc_macro_error_attr\",\n  crate_name: \"proc_macro_error_attr\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  srcs: [\"libproc_macro_error_attr.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro-error-attr/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro-error-attr/ prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja/external_rust_crates_proc-macro-error-attr-3
touch prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro-error-attr-3.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro-error-attr/ .
ls -l external_rust_crates_proc-macro-error-attr-3.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib \
  

mkdir -p prebuiltlibs/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/ && mv out/soong/.intermediates/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib prebuiltlibs/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib

printf "rust_prebuilt_rlib {\n  name: \"libsyn\",\n  crate_name: \"syn\",\n  edition: \"2018\",\n  features: [\"clone-impls\",\"default\",\"derive\",\"extra-traits\",\"full\",\"parsing\",\"printing\",\"proc-macro\",\"quote\",\"visit\",\"visit-mut\"],\n  flags: [\"--cfg syn_disable_nightly_tests\"],\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libunicode_xid\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libsyn.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/syn/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/rust/crates/syn/ninja && rsync -ar out/soong/ninja/external/rust/crates/syn/ prebuiltlibs/external/rust/crates/syn/ninja/external_rust_crates_syn-3
touch prebuiltlibs/external/rust/crates/syn/ninja/.find-ignore
tar cfJ external_rust_crates_syn-3.tar.xz -C prebuiltlibs/external/rust/crates/syn/ .
ls -l external_rust_crates_syn-3.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp \
  out/soong/.intermediates/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze \
  out/soong/.intermediates/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy \
  

mkdir -p prebuiltlibs/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp prebuiltlibs/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp
mkdir -p prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze
mkdir -p prebuiltlibs/system/sepolicy/tools/version_policy/linux_glibc_x86_64/ && mv out/soong/.intermediates/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy prebuiltlibs/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy

printf "cc_prebuilt_binary {\n  name: \"checkseapp\",\n  stl: \"none\",\n  whole_static_libs: [\"libpcre2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"checkseapp\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sepolicy-analyze\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sepolicy-analyze\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/Android.bp
printf "cc_prebuilt_binary {\n  name: \"version_policy\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"version_policy\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/system/sepolicy/ninja && rsync -ar out/soong/ninja/system/sepolicy/ prebuiltlibs/system/sepolicy/ninja/system_sepolicy-3
touch prebuiltlibs/system/sepolicy/ninja/.find-ignore
tar cfJ system_sepolicy-3.tar.xz -C prebuiltlibs/system/sepolicy/ .
ls -l system_sepolicy-3.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
