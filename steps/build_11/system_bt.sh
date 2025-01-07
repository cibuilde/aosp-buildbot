
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for system/bt"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/aac
clone_depth_platform external/boringssl
clone_depth_platform external/flatbuffers
clone_depth_platform external/grpc-grpc
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/rust/crates/grpcio
clone_depth_platform external/rust/crates/grpcio-sys
clone_depth_platform external/tinyxml2
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/hardware/interfaces
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/aac/libFraunhoferAAC^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/aac/libFraunhoferAAC^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/libflatbuffers-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flatbuffers/libflatbuffers-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/grpc-grpc/libgrpc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/libandroid_logger^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_logger/libandroid_logger^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/libanyhow^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/anyhow/libanyhow^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/libenv_logger^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/env_logger/libenv_logger^android_x86_x86_64_rlib_rlib-std/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/libfutures^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/libfutures^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/grpc_rust_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-compiler/libgrpcio_compiler^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpcio_sys^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_wrap^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio-sys/libgrpc_bindgen^android_x86_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio/libgrpcio^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/grpcio/libgrpcio^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/instant/libinstant^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^android_x86_x86_64_rlib_rlib-std/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/libmio^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/mio/libmio^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/libnix^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nix/libnix^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num-derive/libnum_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/libnum_traits^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num-traits/libnum_traits^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/libparking_lot^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot/libparking_lot^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/parking_lot_core/libparking_lot_core^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/paste/libpaste^linux_glibc_x86_64/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/libprotobuf_codegen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/copy_protobuf_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/libthiserror_impl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio-macros/libtokio_macros^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio/libtokio^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/tokio/libtokio^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxx^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxx^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxxbridge05^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/libcxxbridge05^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/cxx/macro/libcxxbridge_macro^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tinyxml2/libtinyxml2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tinyxml2/libtinyxml2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/enums/bluetooth/libbt-platform-protos-lite^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.0/android.hardware.bluetooth@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/1.1/android.hardware.bluetooth@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/a2dp/1.0/android.hardware.bluetooth.a2dp@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.0/android.hardware.bluetooth.audio@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/bluetooth/audio/2.1/android.hardware.bluetooth.audio@2.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/bta/libbt-bta^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/bta/libbt-bta^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/btcore/libbtcore^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/btcore/libbtcore^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/btif/libbtif^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/btif/libbtif^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/common/libbt-common^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/common/libbt-common^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/device/libbtdevice^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/device/libbtdevice^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/g722/libg722codec^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/g722/libg722codec^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/sbc/decoder/libbt-sbc-decoder^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/embdrv/sbc/encoder/libbt-sbc-encoder^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbluetooth_gd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbluetooth_gd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/BluetoothGeneratedPackets_rust^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_packets^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_packets^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_facade_proto^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_facade_proto^android_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_facade_proto^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/libbt_facade_proto^android_x86_x86_64_source/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbt-protos-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/proto/libbt-protos-lite^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/common/libbt_common^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/common/libbt_common^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/common/libbt_common_sys_prop_cxx^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/facade/libbt_facade_helpers^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/facade/libbt_facade_helpers^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/gddi/libgddi^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/gddi/libgddi^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/gddi/libgddi_macros^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hal^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hal^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hal/libbt_hidl_hal_cxx^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hci/libbt_hci^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hci/libbt_hci^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hci/libbt_hci_custom_types^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/hci/libbt_hci_custom_types^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/main/libbt_main^android_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/main/libbt_main^android_x86_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_shim_ffi^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_shim_ffi^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbluetooth_rust_interop^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbluetooth_rust_interop^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/gd/rust/shim/libbt_callbacks_cxx^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/hci/libbt-hci^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/hci/libbt-hci^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/main/libbte^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/main/libbte^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/osi/libosi^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/osi/libosi^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/stack/libbt-stack^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/stack/libbt-stack^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/types/libbluetooth-types^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/types/libbluetooth-types^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/udrv/libudrv-uipc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/udrv/libudrv-uipc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/utils/libbt-utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/bt/utils/libbt-utils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/1.0/android.system.suspend@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/hardware/interfaces/suspend/aidl/android.system.suspend.control-V1-ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_static/ .

echo "building libbluetooth^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libbluetooth,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/bt/libbluetooth^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/system/bt/libbluetooth^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_64_shared/addition_copy_files.output

echo "building libbluetooth^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libbluetooth,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/system/bt/libbluetooth^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/system/bt/libbluetooth^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/bt/main/libbluetooth^android_x86_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/bt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 system_bt.tar.zst --clobber

du -ah -d1 system_bt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_aac.tar.zst" ]; then
  echo "Compressing external/aac -> external_aac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_aac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/aac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst" ]; then
  echo "Compressing external/flatbuffers -> external_flatbuffers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flatbuffers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flatbuffers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst" ]; then
  echo "Compressing external/grpc-grpc -> external_grpc-grpc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_grpc-grpc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/grpc-grpc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libchrome.tar.zst" ]; then
  echo "Compressing external/libchrome -> external_libchrome.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libchrome.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libchrome/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio -> external_rust_crates_grpcio.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/grpcio-sys -> external_rust_crates_grpcio-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_grpcio-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/grpcio-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst" ]; then
  echo "Compressing system/hardware/interfaces -> system_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
