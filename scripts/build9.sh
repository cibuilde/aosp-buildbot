source $GITHUB_WORKSPACE/envsetup.sh
df -h

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


du -ah -d1 out/soong |sort -h
