

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


mkdir -p prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex31/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex31/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex31/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex10000/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex10000/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex10000/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_recovery_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_recovery_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_recovery_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor_ramdisk_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_vendor.31_x86_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_product.31_x86_64_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_product.31_x86_64_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_product.31_x86_64_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_apex30/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_apex30/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_64_static_cfi_apex29/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/ && cp out/soong/.intermediates/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/android_x86_x86_64_static_apex30/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_static/ && cp out/soong/.intermediates/external/libcxx/libc++_static/linux_glibc_x86_static/libc++_static.a prebuiltlibs/external/libcxx/libc++_static/linux_glibc_x86_static/libc++_static.a
mkdir -p prebuiltlibs/external/libcxx/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/libcxx/include/ prebuiltlibs/external/libcxx/include
mkdir -p prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex31/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex31/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex31/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex31/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex31/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex10000/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex10000/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex10000/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_recovery_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_recovery_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_recovery_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor.31_x86_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_product.31_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_product.31_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_product.31_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_64_shared_apex29/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_64_shared_apex29/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex29/ && cp out/soong/.intermediates/external/libcxx/libc++/android_x86_x86_64_shared_apex29/libc++.so prebuiltlibs/external/libcxx/libc++/android_x86_x86_64_shared_apex29/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/libc++.so prebuiltlibs/external/libcxx/libc++/android_vendor_ramdisk_x86_64_shared/libc++.so
mkdir -p prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_shared/ && cp out/soong/.intermediates/external/libcxx/libc++/linux_glibc_x86_shared/libc++.so prebuiltlibs/external/libcxx/libc++/linux_glibc_x86_shared/libc++.so

printf "cc_prebuilt_library_static {\n  name: \"libc++_static\",\n  host_supported: true,\n  export_include_dirs: [\"include\"],\n  stl: \"none\",\n  target: {\n    linux_bionic: {\n      enabled: true,\n    },\n    windows: {\n      enabled: true,\n    },\n  },\n  vendor_available: true,\n  product_available: true,\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  native_bridge_supported: true,\n  whole_static_libs: [\"libc++abi\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libc++_static.a\"],\n}\ncc_prebuilt_library_shared {\n  name: \"libc++\",\n  host_supported: true,\n  vendor_available: true,\n  product_available: true,\n  native_bridge_supported: true,\n  vndk: {\n    enabled: true,\n    support_system_process: true,\n  },\n  ramdisk_available: true,\n  vendor_ramdisk_available: true,\n  recovery_available: true,\n  apex_available: [\"//apex_available:platform\",\"//apex_available:anyapex\"],\n  min_sdk_version: \"apex_inherit\",\n  whole_static_libs: [\"libc++_static\"],\n  stl: \"none\",\n  pgo: {\n    sampling: true,\n  },\n  target: {\n    android: {\n      pgo: {\n        profile_file: \"libc++/libc++.profdata\",\n      },\n    },\n    darwin: {\n      unexported_symbols_list: \"lib/libc++unexp.exp\",\n      force_symbols_not_weak_list: \"lib/notweak.exp\",\n      force_symbols_weak_list: \"lib/weak.exp\",\n    },\n    linux_bionic: {\n      enabled: true,\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  export_include_dirs: [\"include\"],\n  srcs: [\"libc++.so\"],\n}\n" >> prebuiltlibs/external/libcxx/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/libcxx/ninja && rsync -ar out/soong/ninja/external/libcxx/ prebuiltlibs/external/libcxx/ninja/external_libcxx-3
touch prebuiltlibs/external/libcxx/ninja/.find-ignore
tar cfJ external_libcxx-3.tar.xz -C prebuiltlibs/external/libcxx/ .
ls -l external_libcxx-3.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so \


mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/ && cp out/soong/.intermediates/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so prebuiltlibs/external/rust/crates/proc-macro-error-attr/libproc_macro_error_attr/linux_glibc_x86_64/libproc_macro_error_attr.so

printf "rust_prebuilt_proc_macro {\n  name: \"libproc_macro_error_attr\",\n  crate_name: \"proc_macro_error_attr\",\n  edition: \"2018\",\n  rustlibs: [\"libproc_macro2\",\"libquote\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  srcs: [\"libproc_macro_error_attr.so\"],\n}\n" >> prebuiltlibs/external/rust/crates/proc-macro-error-attr/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja && rsync -ar out/soong/ninja/external/rust/crates/proc-macro-error-attr/ prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja/external_rust_crates_proc-macro-error-attr-3
touch prebuiltlibs/external/rust/crates/proc-macro-error-attr/ninja/.find-ignore
tar cfJ external_rust_crates_proc-macro-error-attr-3.tar.xz -C prebuiltlibs/external/rust/crates/proc-macro-error-attr/ .
ls -l external_rust_crates_proc-macro-error-attr-3.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib \


mkdir -p prebuiltlibs/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/ && cp out/soong/.intermediates/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib prebuiltlibs/external/rust/crates/syn/libsyn/linux_glibc_x86_64_rlib_rlib-std/libsyn.rlib

printf "rust_prebuilt_rlib {\n  name: \"libsyn\",\n  crate_name: \"syn\",\n  edition: \"2018\",\n  features: [\"clone-impls\",\"default\",\"derive\",\"extra-traits\",\"full\",\"parsing\",\"printing\",\"proc-macro\",\"quote\",\"visit\",\"visit-mut\"],\n  flags: [\"--cfg syn_disable_nightly_tests\"],\n  rustlibs: [\"libproc_macro2\",\"libquote\",\"libunicode_xid\"],\n  compile_multilib: \"first\",\n  multiple_variants: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"libsyn.rlib\"],\n}\n" >> prebuiltlibs/external/rust/crates/syn/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/external/rust/crates/syn/ninja && rsync -ar out/soong/ninja/external/rust/crates/syn/ prebuiltlibs/external/rust/crates/syn/ninja/external_rust_crates_syn-3
touch prebuiltlibs/external/rust/crates/syn/ninja/.find-ignore
tar cfJ external_rust_crates_syn-3.tar.xz -C prebuiltlibs/external/rust/crates/syn/ .
ls -l external_rust_crates_syn-3.tar.xz
df -h
end=`date +%s`
echo $((end-start))

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
out/soong/.intermediates/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp \
out/soong/.intermediates/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze \
out/soong/.intermediates/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy \


mkdir -p prebuiltlibs/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp prebuiltlibs/system/sepolicy/tools/checkseapp/linux_glibc_x86_64/checkseapp
mkdir -p prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/sepolicy-analyze/linux_glibc_x86_64/sepolicy-analyze
mkdir -p prebuiltlibs/system/sepolicy/tools/version_policy/linux_glibc_x86_64/ && cp out/soong/.intermediates/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy prebuiltlibs/system/sepolicy/tools/version_policy/linux_glibc_x86_64/version_policy

printf "cc_prebuilt_binary {\n  name: \"checkseapp\",\n  stl: \"none\",\n  whole_static_libs: [\"libpcre2\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"checkseapp\"],\n}\ncc_prebuilt_binary {\n  name: \"version_policy\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"version_policy\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/Android.bp
printf "cc_prebuilt_binary {\n  name: \"sepolicy-analyze\",\n  stl: \"none\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"sepolicy-analyze\"],\n}\n" >> prebuiltlibs/system/sepolicy/tools/sepolicy-analyze/Android.bp

find out/soong/.intermediates/ -maxdepth 1 -mindepth 1 ! -name 'prebuilts' ! -name 'prebuiltlibs' ! -name 'bionic' ! -name 'build' ! -name 'system' -type d -exec rm -rf {} +
if [ -d "out/soong/.intermediates/prebuiltlibs/" ]; then
  find out/soong/.intermediates/prebuiltlibs -maxdepth 1 -mindepth 1 ! -name 'bionic' -type d -exec rm -rf {} +
fi
if [ -d "out/soong/.intermediates/system/" ]; then
  find out/soong/.intermediates/system/ -maxdepth 1 -mindepth 1 ! -name 'logging' -type d -exec rm -rf {} +
fi
mkdir -p prebuiltlibs/system/sepolicy/ninja && rsync -ar out/soong/ninja/system/sepolicy/ prebuiltlibs/system/sepolicy/ninja/system_sepolicy-3
touch prebuiltlibs/system/sepolicy/ninja/.find-ignore
tar cfJ system_sepolicy-3.tar.xz -C prebuiltlibs/system/sepolicy/ .
ls -l system_sepolicy-3.tar.xz
df -h
end=`date +%s`
echo $((end-start))

echo 'bionic/'
du -ah -d1 bionic/|sort -rh
echo 'build/blueprint/'
du -ah -d1 build/blueprint/|sort -rh
echo 'build/make/'
du -ah -d1 build/make/|sort -rh
echo 'build/soong/'
du -ah -d1 build/soong/|sort -rh
echo 'external/compiler-rt/'
du -ah -d1 external/compiler-rt/|sort -rh
echo 'external/golang-protobuf/'
du -ah -d1 external/golang-protobuf/|sort -rh
echo 'external/libcxx/'
du -ah -d1 external/libcxx/|sort -rh
echo 'external/libcxxabi/'
du -ah -d1 external/libcxxabi/|sort -rh
echo 'external/rust/crates/proc-macro-error-attr/'
du -ah -d1 external/rust/crates/proc-macro-error-attr/|sort -rh
echo 'external/rust/crates/syn/'
du -ah -d1 external/rust/crates/syn/|sort -rh
echo 'external/starlark-go/'
du -ah -d1 external/starlark-go/|sort -rh
echo 'prebuilts/build-tools/'
du -ah -d1 prebuilts/build-tools/|sort -rh
echo 'prebuilts/clang-tools/'
du -ah -d1 prebuilts/clang-tools/|sort -rh
echo 'prebuilts/clang/host/linux-x86/'
du -ah -d1 prebuilts/clang/host/linux-x86/|sort -rh
echo 'prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/'
du -ah -d1 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/|sort -rh
echo 'prebuilts/rust/'
du -ah -d1 prebuilts/rust/|sort -rh
echo 'system/core/'
du -ah -d1 system/core/|sort -rh
echo 'system/logging/'
du -ah -d1 system/logging/|sort -rh
echo 'system/sepolicy/'
du -ah -d1 system/sepolicy/|sort -rh
echo 'prebuiltlibs/bionic/'
du -ah -d1 prebuiltlibs/bionic/|sort -rh
echo 'prebuiltlibs/external/arm-optimized-routines/'
du -ah -d1 prebuiltlibs/external/arm-optimized-routines/|sort -rh
echo 'prebuiltlibs/external/bc/'
du -ah -d1 prebuiltlibs/external/bc/|sort -rh
echo 'prebuiltlibs/external/brotli/'
du -ah -d1 prebuiltlibs/external/brotli/|sort -rh
echo 'prebuiltlibs/external/bzip2/'
du -ah -d1 prebuiltlibs/external/bzip2/|sort -rh
echo 'prebuiltlibs/external/crosvm/'
du -ah -d1 prebuiltlibs/external/crosvm/|sort -rh
echo 'prebuiltlibs/external/expat/'
du -ah -d1 prebuiltlibs/external/expat/|sort -rh
echo 'prebuiltlibs/external/gwp_asan/'
du -ah -d1 prebuiltlibs/external/gwp_asan/|sort -rh
echo 'prebuiltlibs/external/libcxx/'
du -ah -d1 prebuiltlibs/external/libcxx/|sort -rh
echo 'prebuiltlibs/external/libcxxabi/'
du -ah -d1 prebuiltlibs/external/libcxxabi/|sort -rh
echo 'prebuiltlibs/external/lzma/'
du -ah -d1 prebuiltlibs/external/lzma/|sort -rh
echo 'prebuiltlibs/external/mksh/'
du -ah -d1 prebuiltlibs/external/mksh/|sort -rh
echo 'prebuiltlibs/external/one-true-awk/'
du -ah -d1 prebuiltlibs/external/one-true-awk/|sort -rh
echo 'prebuiltlibs/external/pcre/'
du -ah -d1 prebuiltlibs/external/pcre/|sort -rh
echo 'prebuiltlibs/external/rust/crates/bytes/'
du -ah -d1 prebuiltlibs/external/rust/crates/bytes/|sort -rh
echo 'prebuiltlibs/external/rust/crates/codespan-reporting/'
du -ah -d1 prebuiltlibs/external/rust/crates/codespan-reporting/|sort -rh
echo 'prebuiltlibs/external/rust/crates/downcast-rs/'
du -ah -d1 prebuiltlibs/external/rust/crates/downcast-rs/|sort -rh
echo 'prebuiltlibs/external/rust/crates/either/'
du -ah -d1 prebuiltlibs/external/rust/crates/either/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/fallible-streaming-iterator/'
du -ah -d1 prebuiltlibs/external/rust/crates/fallible-streaming-iterator/|sort -rh
echo 'prebuiltlibs/external/rust/crates/glob/'
du -ah -d1 prebuiltlibs/external/rust/crates/glob/|sort -rh
echo 'prebuiltlibs/external/rust/crates/grpcio-compiler/'
du -ah -d1 prebuiltlibs/external/rust/crates/grpcio-compiler/|sort -rh
echo 'prebuiltlibs/external/rust/crates/heck/'
du -ah -d1 prebuiltlibs/external/rust/crates/heck/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lazycell/'
du -ah -d1 prebuiltlibs/external/rust/crates/lazycell/|sort -rh
echo 'prebuiltlibs/external/rust/crates/lock_api/'
du -ah -d1 prebuiltlibs/external/rust/crates/lock_api/|sort -rh
echo 'prebuiltlibs/external/rust/crates/paste/'
du -ah -d1 prebuiltlibs/external/rust/crates/paste/|sort -rh
echo 'prebuiltlibs/external/rust/crates/peeking_take_while/'
du -ah -d1 prebuiltlibs/external/rust/crates/peeking_take_while/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-error-attr/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-error-attr/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro-hack/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro-hack/|sort -rh
echo 'prebuiltlibs/external/rust/crates/proc-macro2/'
du -ah -d1 prebuiltlibs/external/rust/crates/proc-macro2/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf-codegen/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf-codegen/|sort -rh
echo 'prebuiltlibs/external/rust/crates/protobuf/'
du -ah -d1 prebuiltlibs/external/rust/crates/protobuf/|sort -rh
echo 'prebuiltlibs/external/rust/crates/quote/'
du -ah -d1 prebuiltlibs/external/rust/crates/quote/|sort -rh
echo 'prebuiltlibs/external/rust/crates/regex-syntax/'
du -ah -d1 prebuiltlibs/external/rust/crates/regex-syntax/|sort -rh
echo 'prebuiltlibs/external/rust/crates/rustc-hash/'
du -ah -d1 prebuiltlibs/external/rust/crates/rustc-hash/|sort -rh
echo 'prebuiltlibs/external/rust/crates/scopeguard/'
du -ah -d1 prebuiltlibs/external/rust/crates/scopeguard/|sort -rh
echo 'prebuiltlibs/external/rust/crates/shlex/'
du -ah -d1 prebuiltlibs/external/rust/crates/shlex/|sort -rh
echo 'prebuiltlibs/external/rust/crates/syn/'
du -ah -d1 prebuiltlibs/external/rust/crates/syn/|sort -rh
echo 'prebuiltlibs/external/rust/crates/termcolor/'
du -ah -d1 prebuiltlibs/external/rust/crates/termcolor/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-segmentation/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-segmentation/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-width/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-width/|sort -rh
echo 'prebuiltlibs/external/rust/crates/unicode-xid/'
du -ah -d1 prebuiltlibs/external/rust/crates/unicode-xid/|sort -rh
echo 'prebuiltlibs/external/scudo/'
du -ah -d1 prebuiltlibs/external/scudo/|sort -rh
echo 'prebuiltlibs/external/selinux/'
du -ah -d1 prebuiltlibs/external/selinux/|sort -rh
echo 'prebuiltlibs/external/zlib/'
du -ah -d1 prebuiltlibs/external/zlib/|sort -rh
echo 'prebuiltlibs/frameworks/rs/'
du -ah -d1 prebuiltlibs/frameworks/rs/|sort -rh
echo 'prebuiltlibs/system/bt/'
du -ah -d1 prebuiltlibs/system/bt/|sort -rh
echo 'prebuiltlibs/system/core/'
du -ah -d1 prebuiltlibs/system/core/|sort -rh
echo 'prebuiltlibs/system/sepolicy/'
du -ah -d1 prebuiltlibs/system/sepolicy/|sort -rh
