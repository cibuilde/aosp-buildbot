set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/grpc-grpc
clone_depth_platform external/rust/crates/bytes
clone_depth_platform external/rust/crates/cfg-if
clone_depth_platform external/rust/crates/futures
clone_depth_platform external/rust/crates/futures-channel
clone_depth_platform external/rust/crates/futures-core
clone_depth_platform external/rust/crates/futures-executor
clone_depth_platform external/rust/crates/futures-io
clone_depth_platform external/rust/crates/futures-macro
clone_depth_platform external/rust/crates/futures-sink
clone_depth_platform external/rust/crates/futures-task
clone_depth_platform external/rust/crates/futures-util
clone_depth_platform external/rust/crates/grpcio
clone_depth_platform external/rust/crates/grpcio-sys
clone_depth_platform external/rust/crates/instant
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/libz-sys
clone_depth_platform external/rust/crates/lock_api
clone_depth_platform external/rust/crates/log
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/num_cpus
clone_depth_platform external/rust/crates/parking_lot
clone_depth_platform external/rust/crates/parking_lot_core
clone_depth_platform external/rust/crates/pin-project
clone_depth_platform external/rust/crates/pin-project-lite
clone_depth_platform external/rust/crates/pin-utils
clone_depth_platform external/rust/crates/proc-macro-hack
clone_depth_platform external/rust/crates/proc-macro-nested
clone_depth_platform external/rust/crates/protobuf
clone_depth_platform external/rust/crates/scopeguard
clone_depth_platform external/rust/crates/slab
clone_depth_platform external/rust/crates/smallvec
clone_depth_platform external/zlib
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/libfutures^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/libfutures^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/libfutures_channel^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/libfutures_channel^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/libfutures_core^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/libfutures_core^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/libfutures_executor^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/libfutures_executor^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/libfutures_io^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/libfutures_io^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/libfutures_macro^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/libfutures_sink^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/libfutures_sink^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/libfutures_task^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/libfutures_task^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/libfutures_util^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/libfutures_util^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/liblibz_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libz-sys/liblibz_sys^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/liblock_api^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lock_api/liblock_api^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/log/liblog_rust^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/libparking_lot^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/libparking_lot^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/libpin_utils^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/copy_proc-macro-nested_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/libproc_macro_nested^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/libproc_macro_nested^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/copy_protobuf_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/libscopeguard^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/scopeguard/libscopeguard^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/libslab^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/libslab^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib/ .

echo "building libgrpcio^android_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libgrpcio,android_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio/libgrpcio^android_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/grpcio/libgrpcio^android_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio/libgrpcio^android_x86_64_rlib_rlib-std

echo "building libgrpcio^android_x86_x86_64_rlib_rlib-std"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libgrpcio,android_x86_x86_64_rlib_rlib-std
mkdir -p $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio/libgrpcio^android_x86_x86_64_rlib_rlib-std
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/rust/crates/grpcio/libgrpcio^android_x86_x86_64_rlib_rlib-std.output . $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio/libgrpcio^android_x86_x86_64_rlib_rlib-std

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_rust_crates_grpcio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/rust/crates/grpcio/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_rust_crates_grpcio.tar.zst --clobber

du -ah -d1 external_rust_crates_grpcio*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst" ]; then
  echo "Compressing external/rust/crates/bytes -> external_rust_crates_bytes.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bytes/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst" ]; then
  echo "Compressing external/rust/crates/cfg-if -> external_rust_crates_cfg-if.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_cfg-if.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/cfg-if/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures -> external_rust_crates_futures.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-channel.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-channel -> external_rust_crates_futures-channel.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-channel.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-channel/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-core.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-core -> external_rust_crates_futures-core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-executor.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-executor -> external_rust_crates_futures-executor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-executor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-executor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-io.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-io -> external_rust_crates_futures-io.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-io.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-io/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-macro.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-macro -> external_rust_crates_futures-macro.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-macro.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-macro/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-sink.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-sink -> external_rust_crates_futures-sink.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-sink.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-sink/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-task.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-task -> external_rust_crates_futures-task.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-task.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-task/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_futures-util.tar.zst" ]; then
  echo "Compressing external/rust/crates/futures-util -> external_rust_crates_futures-util.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_futures-util.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/futures-util/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio -> external_rust_crates_grpcio.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio-sys -> external_rust_crates_grpcio-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_instant.tar.zst" ]; then
  echo "Compressing external/rust/crates/instant -> external_rust_crates_instant.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_instant.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/instant/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/libz-sys -> external_rust_crates_libz-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libz-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libz-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_lock_api.tar.zst" ]; then
  echo "Compressing external/rust/crates/lock_api -> external_rust_crates_lock_api.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_lock_api.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/lock_api/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst" ]; then
  echo "Compressing external/rust/crates/log -> external_rust_crates_log.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_log.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/log/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst" ]; then
  echo "Compressing external/rust/crates/num_cpus -> external_rust_crates_num_cpus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/num_cpus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot.tar.zst" ]; then
  echo "Compressing external/rust/crates/parking_lot -> external_rust_crates_parking_lot.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/parking_lot/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot_core.tar.zst" ]; then
  echo "Compressing external/rust/crates/parking_lot_core -> external_rust_crates_parking_lot_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_parking_lot_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/parking_lot_core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-project.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-project -> external_rust_crates_pin-project.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-project.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-project/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-project-lite.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-project-lite -> external_rust_crates_pin-project-lite.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-project-lite.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-project-lite/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_pin-utils.tar.zst" ]; then
  echo "Compressing external/rust/crates/pin-utils -> external_rust_crates_pin-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_pin-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/pin-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro-hack -> external_rust_crates_proc-macro-hack.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-hack.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro-hack/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-nested.tar.zst" ]; then
  echo "Compressing external/rust/crates/proc-macro-nested -> external_rust_crates_proc-macro-nested.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_proc-macro-nested.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/proc-macro-nested/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst" ]; then
  echo "Compressing external/rust/crates/protobuf -> external_rust_crates_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_scopeguard.tar.zst" ]; then
  echo "Compressing external/rust/crates/scopeguard -> external_rust_crates_scopeguard.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_scopeguard.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/scopeguard/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_slab.tar.zst" ]; then
  echo "Compressing external/rust/crates/slab -> external_rust_crates_slab.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_slab.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/slab/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst" ]; then
  echo "Compressing external/rust/crates/smallvec -> external_rust_crates_smallvec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/smallvec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi

rm -rf aosp
