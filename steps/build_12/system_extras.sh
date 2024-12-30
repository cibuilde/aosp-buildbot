set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/rust/crates/android_log-sys
clone_depth_platform external/rust/crates/android_logger
clone_depth_platform external/rust/crates/anyhow
clone_depth_platform external/rust/crates/byteorder
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/chrono
clone_depth_platform external/rust/crates/crc32fast
clone_depth_platform external/rust/crates/env_logger
clone_depth_platform external/rust/crates/flate2
clone_depth_platform external/rust/crates/getrandom
clone_depth_platform external/rust/crates/itoa
clone_depth_platform external/rust/crates/lazy_static
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libz-sys
clone_depth_platform external/rust/crates/log
clone_depth_platform external/rust/crates/macaddr
clone_depth_platform external/rust/crates/num-integer
clone_depth_platform external/rust/crates/num-traits
clone_depth_platform external/rust/crates/ppv-lite86
clone_depth_platform external/rust/crates/rand
clone_depth_platform external/rust/crates/rand_chacha
clone_depth_platform external/rust/crates/rand_core
clone_depth_platform external/rust/crates/ryu
clone_depth_platform external/rust/crates/serde
clone_depth_platform external/rust/crates/serde_derive
clone_depth_platform external/rust/crates/serde_json
clone_depth_platform external/rust/crates/thiserror
clone_depth_platform external/rust/crates/thiserror-impl
clone_depth_platform external/rust/crates/uuid
clone_depth_platform external/rust/crates/zip
clone_depth_platform external/rust/cxx
clone_depth_platform external/zlib
clone_depth_platform frameworks/native
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/server_configurable_flags

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/libandroid_logger^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/libanyhow^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/libanyhow^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/byteorder/libbyteorder^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/chrono/libchrono^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/crc32fast/libcrc32fast^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/libenv_logger^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/flate2/libflate2^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/getrandom/libgetrandom^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/libitoa^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/liblibz_sys^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/macaddr/libmacaddr^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num-integer/libnum_integer^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/libnum_traits^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/ppv-lite86/libppv_lite86^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rand/librand^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_chacha/librand_chacha^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rand_core/librand_core^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/libryu^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/libserde^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/libserde_json^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/libthiserror_impl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/uuid/libuuid^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/zip/libzip^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxx^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxxbridge05^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/macro/libcxxbridge_macro^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_ndk_sys^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/rust/libbinder_rs^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/bindings/libbase/libprofcollect_libbase_rust^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/bindings/libflags/libprofcollect_libflags_rust^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/simpleperf/libsimpleperf_profcollect^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/simpleperf/libsimpleperf_profcollect_bindgen^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/simpleperf/libsimpleperf_profcollect_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/simpleperf/libsimpleperf_profcollect_rust^android_x86_64_rlib_dylib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/profcollectd/libprofcollectd/profcollectd_aidl_interface-rust^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_64_shared/ .

echo "building libprofcollectd^android_x86_64_dylib"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libprofcollectd,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/libprofcollectd^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/system/extras/libprofcollectd^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/libprofcollectd/libprofcollectd^android_x86_64_dylib

echo "building profcollectctl^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja profcollectctl,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/profcollectctl^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/system/extras/profcollectctl^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/profcollectctl^android_x86_64

echo "building profcollectd^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja profcollectd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/profcollectd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/system/extras/profcollectd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/profcollectd/profcollectd^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/extras/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_12 system_extras.tar.zst --clobber

du -ah -d1 system_extras*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/android_log-sys -> external_rust_crates_android_log-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/android_log-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_android_logger.tar.zst" ]; then
  echo "Compressing external/rust/crates/android_logger -> external_rust_crates_android_logger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_android_logger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/android_logger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_anyhow.tar.zst" ]; then
  echo "Compressing external/rust/crates/anyhow -> external_rust_crates_anyhow.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_anyhow.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/anyhow/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_byteorder.tar.zst" ]; then
  echo "Compressing external/rust/crates/byteorder -> external_rust_crates_byteorder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_byteorder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/byteorder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_chrono.tar.zst" ]; then
  echo "Compressing external/rust/crates/chrono -> external_rust_crates_chrono.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_chrono.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/chrono/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_crc32fast.tar.zst" ]; then
  echo "Compressing external/rust/crates/crc32fast -> external_rust_crates_crc32fast.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_crc32fast.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/crc32fast/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst" ]; then
  echo "Compressing external/rust/crates/env_logger -> external_rust_crates_env_logger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_env_logger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/env_logger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_flate2.tar.zst" ]; then
  echo "Compressing external/rust/crates/flate2 -> external_rust_crates_flate2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_flate2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/flate2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_getrandom.tar.zst" ]; then
  echo "Compressing external/rust/crates/getrandom -> external_rust_crates_getrandom.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_getrandom.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/getrandom/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst" ]; then
  echo "Compressing external/rust/crates/itoa -> external_rust_crates_itoa.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/itoa/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst" ]; then
  echo "Compressing external/rust/crates/lazy_static -> external_rust_crates_lazy_static.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lazy_static.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lazy_static/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/libz-sys -> external_rust_crates_libz-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libz-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_macaddr.tar.zst" ]; then
  echo "Compressing external/rust/crates/macaddr -> external_rust_crates_macaddr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_macaddr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/macaddr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_num-integer.tar.zst" ]; then
  echo "Compressing external/rust/crates/num-integer -> external_rust_crates_num-integer.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_num-integer.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/num-integer/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_num-traits.tar.zst" ]; then
  echo "Compressing external/rust/crates/num-traits -> external_rust_crates_num-traits.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_num-traits.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/num-traits/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_ppv-lite86.tar.zst" ]; then
  echo "Compressing external/rust/crates/ppv-lite86 -> external_rust_crates_ppv-lite86.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_ppv-lite86.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/ppv-lite86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_rand.tar.zst" ]; then
  echo "Compressing external/rust/crates/rand -> external_rust_crates_rand.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_rand.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/rand/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_rand_chacha.tar.zst" ]; then
  echo "Compressing external/rust/crates/rand_chacha -> external_rust_crates_rand_chacha.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_rand_chacha.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/rand_chacha/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_rand_core.tar.zst" ]; then
  echo "Compressing external/rust/crates/rand_core -> external_rust_crates_rand_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_rand_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/rand_core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_ryu.tar.zst" ]; then
  echo "Compressing external/rust/crates/ryu -> external_rust_crates_ryu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_ryu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/ryu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde -> external_rust_crates_serde.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde_derive -> external_rust_crates_serde_derive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde_derive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde_derive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_serde_json.tar.zst" ]; then
  echo "Compressing external/rust/crates/serde_json -> external_rust_crates_serde_json.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_serde_json.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/serde_json/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror -> external_rust_crates_thiserror.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror-impl -> external_rust_crates_thiserror-impl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror-impl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_uuid.tar.zst" ]; then
  echo "Compressing external/rust/crates/uuid -> external_rust_crates_uuid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_uuid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/uuid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_zip.tar.zst" ]; then
  echo "Compressing external/rust/crates/zip -> external_rust_crates_zip.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_zip.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/zip/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst" ]; then
  echo "Compressing external/rust/cxx -> external_rust_cxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_cxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/cxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_server_configurable_flags.tar.zst" ]; then
  echo "Compressing system/server_configurable_flags -> system_server_configurable_flags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_server_configurable_flags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/server_configurable_flags/ .
fi

rm -rf aosp
