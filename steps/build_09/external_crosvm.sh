
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

echo "Preparing for external/crosvm"

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth device/generic/vulkan-cereal
clone_depth_platform external/crosvm
clone_depth_platform external/libcap
clone_depth_platform external/libdrm
clone_depth_platform external/libepoxy
clone_depth_platform external/libffi
clone_depth_platform external/minigbm
clone_depth_platform external/rust/crates/android_log-sys
clone_depth_platform external/rust/crates/async-task
clone_depth_platform external/rust/crates/async-trait
clone_depth_platform external/rust/crates/bitflags
clone_depth_platform external/rust/crates/bytes
clone_depth_platform external/rust/crates/downcast-rs
clone_depth_platform external/rust/crates/futures
clone_depth_platform external/rust/crates/futures-channel
clone_depth_platform external/rust/crates/futures-core
clone_depth_platform external/rust/crates/futures-executor
clone_depth_platform external/rust/crates/futures-io
clone_depth_platform external/rust/crates/futures-macro
clone_depth_platform external/rust/crates/futures-sink
clone_depth_platform external/rust/crates/futures-task
clone_depth_platform external/rust/crates/futures-util
clone_depth_platform external/rust/crates/intrusive-collections
clone_depth_platform external/rust/crates/itoa
clone_depth_platform external/rust/crates/libc
clone_depth_platform external/rust/crates/memchr
clone_depth_platform external/rust/crates/memoffset
clone_depth_platform external/rust/crates/num_cpus
clone_depth_platform external/rust/crates/paste
clone_depth_platform external/rust/crates/pin-project
clone_depth_platform external/rust/crates/pin-project-lite
clone_depth_platform external/rust/crates/pin-utils
clone_depth_platform external/rust/crates/proc-macro-hack
clone_depth_platform external/rust/crates/proc-macro-nested
clone_depth_platform external/rust/crates/protobuf
clone_depth_platform external/rust/crates/remain
clone_depth_platform external/rust/crates/ryu
clone_depth_platform external/rust/crates/serde
clone_depth_platform external/rust/crates/serde_derive
clone_depth_platform external/rust/crates/serde_json
clone_depth_platform external/rust/crates/slab
clone_depth_platform external/rust/crates/smallvec
clone_depth_platform external/rust/crates/thiserror
clone_depth_platform external/rust/crates/thiserror-impl
clone_depth_platform external/virglrenderer
clone_depth_platform external/wayland
clone_depth_platform libcore
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/logging

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/device/generic/vulkan-cereal/stream-servers/libgfxstream_backend^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/assertions/libassertions^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/assertions/libassertions^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/assertions/libassertions^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/bit_field/libbit_field^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/bit_field/bit_field_derive/libbit_field_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/data_model/libdata_model^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/data_model/libdata_model^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/data_model/libdata_model^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/enumn/libenumn^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/gpu_display/libdisplay_wl^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/io_uring/libio_uring^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/protos/libprotos^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/protos/libcdisk_spec_proto^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/protos/libcdisk_spec_proto^android_x86_64_source_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sync/libsync_rust^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sync/libsync_rust^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sync/libsync_rust^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sys_util/libsys_util^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/sys_util/poll_token_derive/libpoll_token_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/syscall_defines/libsyscall_defines^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/tempfile/libtempfile^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/tempfile/libtempfile^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/crosvm/tempfile/libtempfile^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libdrm/libdrm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libepoxy/libepoxy^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libffi/libffi^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minigbm/libgbm^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/android_log-sys/libandroid_log_sys^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/async-task/libasync_task^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/async-trait/libasync_trait^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bytes/libbytes^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/downcast-rs/libdowncast_rs^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-channel/libfutures_channel^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-core/libfutures_core^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-executor/libfutures_executor^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-io/libfutures_io^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-macro/libfutures_macro^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-sink/libfutures_sink^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-task/libfutures_task^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures-util/libfutures_util^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/futures/libfutures^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/intrusive-collections/libintrusive_collections^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/libitoa^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/libitoa^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/itoa/libitoa^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memoffset/libmemoffset^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/num_cpus/libnum_cpus^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/paste/libpaste^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-project-lite/libpin_project_lite^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/pin-utils/libpin_utils^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-hack/libproc_macro_hack^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/copy_proc-macro-nested_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro-nested/libproc_macro_nested^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/libprotobuf_codegen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf-codegen/protoc-gen-rust^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/copy_protobuf_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/protobuf/libprotobuf^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/remain/libremain^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/libryu^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/libryu^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/ryu/libryu^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/libserde^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/libserde^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde/libserde^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_derive/libserde_derive^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/libserde_json^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/libserde_json^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/serde_json/libserde_json^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/slab/libslab^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/smallvec/libsmallvec^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/syn/libsyn^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror-impl/libthiserror_impl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/thiserror/libthiserror^android_x86_64_rlib_rlib-std_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/virglrenderer/libvirglrenderer^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/wayland/libwayland_client_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_rs.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcompiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liblibc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/liballoc.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcfg_if.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libpanic_abort.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunwind.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libhashbrown.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libstd^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libterm^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libgetopts^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libunicode_width.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_dylib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libtest^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libprofiler_builtins.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libcore.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/libbacktrace_sys.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/rust/librustc_demangle.rust_sysroot^android_x86_64_rlib_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .

echo "building libbase_rust^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbase_rust,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/base/libbase_rust^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libbase_rust^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/base/libbase_rust^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libbase_rust^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/base/libbase_rust^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/base/libbase_rust^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libcros_async^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libcros_async,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/cros_async/libcros_async^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libcros_async^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/cros_async/libcros_async^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libcros_async^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/cros_async/libcros_async^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/cros_async/libcros_async^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libdisk^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdisk,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/disk/libdisk^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libdisk^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/disk/libdisk^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libdisk^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/disk/libdisk^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/disk/libdisk^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libfuse_rust^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libfuse_rust,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/fuse/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/fuse/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/fuse/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/fuse/libfuse_rust^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libgpu_display^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libgpu_display,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/libgpu_display^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libgpu_display^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/libgpu_display^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libgpu_display^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/libgpu_display^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/gpu_display/libgpu_display^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libhypervisor^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libhypervisor,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/hypervisor/libhypervisor^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libhypervisor^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/hypervisor/libhypervisor^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libhypervisor^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/hypervisor/libhypervisor^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/hypervisor/libhypervisor^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libio_uring^android_x86_64_dylib"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libio_uring,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libio_uring^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libio_uring^android_x86_64_dylib.output $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib/addition_copy_files.output

echo "building libio_uring^android_x86_64_dylib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libio_uring,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libio_uring^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libio_uring^android_x86_64_dylib_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/io_uring/libio_uring^android_x86_64_dylib_apex10000/addition_copy_files.output

echo "building libkernel_loader^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkernel_loader,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_loader/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_loader/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_loader/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/kernel_loader/libkernel_loader^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libkvm^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkvm,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm/libkvm^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkvm^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm/libkvm^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkvm^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm/libkvm^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm/libkvm^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libkvm_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libkvm_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm_sys/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm_sys/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm_sys/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/kvm_sys/libkvm_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja liblinux_input_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/linux_input_sys/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/linux_input_sys/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/linux_input_sys/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/linux_input_sys/liblinux_input_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libnet_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnet_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/net_sys/libnet_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libnet_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/net_sys/libnet_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libnet_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/net_sys/libnet_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/net_sys/libnet_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libnet_util^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnet_util,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/net_util/libnet_util^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libnet_util^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/net_util/libnet_util^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libnet_util^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/net_util/libnet_util^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/net_util/libnet_util^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libpower_monitor^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libpower_monitor,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/power_monitor/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/power_monitor/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/power_monitor/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/power_monitor/libpower_monitor^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libresources^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libresources,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/resources/libresources^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libresources^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/resources/libresources^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libresources^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/resources/libresources^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/resources/libresources^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja librutabaga_gfx,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/rutabaga_gfx/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/rutabaga_gfx/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/rutabaga_gfx/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/rutabaga_gfx/librutabaga_gfx^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libsys_util^android_x86_64_dylib"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libsys_util,android_x86_64_dylib
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libsys_util^android_x86_64_dylib.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libsys_util^android_x86_64_dylib.output $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib/addition_copy_files.output

echo "building libsys_util^android_x86_64_dylib_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libsys_util,android_x86_64_dylib_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libsys_util^android_x86_64_dylib_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libsys_util^android_x86_64_dylib_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/sys_util/libsys_util^android_x86_64_dylib_apex10000/addition_copy_files.output

echo "building libusb_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libusb_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_sys/libusb_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libusb_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_sys/libusb_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libusb_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_sys/libusb_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_sys/libusb_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libusb_util^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libusb_util,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_util/libusb_util^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libusb_util^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_util/libusb_util^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libusb_util^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_util/libusb_util^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/usb_util/libusb_util^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libvfio_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libvfio_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/vfio_sys/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/vfio_sys/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/vfio_sys/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/vfio_sys/libvfio_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libvhost^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libvhost,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/vhost/libvhost^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvhost^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/vhost/libvhost^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvhost^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/vhost/libvhost^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/vhost/libvhost^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libvirtio_sys,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/virtio_sys/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/virtio_sys/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/virtio_sys/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/virtio_sys/libvirtio_sys^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libvm_control^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libvm_control,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_control/libvm_control^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvm_control^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_control/libvm_control^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvm_control^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_control/libvm_control^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_control/libvm_control^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output

echo "building libvm_memory^android_x86_64_rlib_rlib-std_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libvm_memory,android_x86_64_rlib_rlib-std_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_memory/libvm_memory^android_x86_64_rlib_rlib-std_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvm_memory^android_x86_64_rlib_rlib-std_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_memory/libvm_memory^android_x86_64_rlib_rlib-std_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/external/crosvm/libvm_memory^android_x86_64_rlib_rlib-std_apex10000.output $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_memory/libvm_memory^android_x86_64_rlib_rlib-std_apex10000 $GITHUB_WORKSPACE/artifacts/external/crosvm/vm_memory/libvm_memory^android_x86_64_rlib_rlib-std_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/crosvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_crosvm.tar.zst --clobber

du -ah -d1 external_crosvm*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_generic_vulkan-cereal.tar.zst" ]; then
  echo "Compressing device/generic/vulkan-cereal -> device_generic_vulkan-cereal.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_generic_vulkan-cereal.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/generic/vulkan-cereal/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_crosvm.tar.zst" ]; then
  echo "Compressing external/crosvm -> external_crosvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_crosvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/crosvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcap.tar.zst" ]; then
  echo "Compressing external/libcap -> external_libcap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libdrm.tar.zst" ]; then
  echo "Compressing external/libdrm -> external_libdrm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libdrm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libdrm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libepoxy.tar.zst" ]; then
  echo "Compressing external/libepoxy -> external_libepoxy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libepoxy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libepoxy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libffi.tar.zst" ]; then
  echo "Compressing external/libffi -> external_libffi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libffi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libffi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_minigbm.tar.zst" ]; then
  echo "Compressing external/minigbm -> external_minigbm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_minigbm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/minigbm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst" ]; then
  echo "Compressing external/rust/crates/android_log-sys -> external_rust_crates_android_log-sys.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_android_log-sys.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/android_log-sys/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_async-task.tar.zst" ]; then
  echo "Compressing external/rust/crates/async-task -> external_rust_crates_async-task.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_async-task.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/async-task/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_async-trait.tar.zst" ]; then
  echo "Compressing external/rust/crates/async-trait -> external_rust_crates_async-trait.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_async-trait.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/async-trait/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst" ]; then
  echo "Compressing external/rust/crates/bitflags -> external_rust_crates_bitflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bitflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bitflags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst" ]; then
  echo "Compressing external/rust/crates/bytes -> external_rust_crates_bytes.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_bytes.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/bytes/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_downcast-rs.tar.zst" ]; then
  echo "Compressing external/rust/crates/downcast-rs -> external_rust_crates_downcast-rs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_downcast-rs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/downcast-rs/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_intrusive-collections.tar.zst" ]; then
  echo "Compressing external/rust/crates/intrusive-collections -> external_rust_crates_intrusive-collections.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_intrusive-collections.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/intrusive-collections/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst" ]; then
  echo "Compressing external/rust/crates/itoa -> external_rust_crates_itoa.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_itoa.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/itoa/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst" ]; then
  echo "Compressing external/rust/crates/libc -> external_rust_crates_libc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_libc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/libc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst" ]; then
  echo "Compressing external/rust/crates/memchr -> external_rust_crates_memchr.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memchr.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memchr/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_memoffset.tar.zst" ]; then
  echo "Compressing external/rust/crates/memoffset -> external_rust_crates_memoffset.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_memoffset.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/memoffset/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst" ]; then
  echo "Compressing external/rust/crates/num_cpus -> external_rust_crates_num_cpus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_num_cpus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/num_cpus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_paste.tar.zst" ]; then
  echo "Compressing external/rust/crates/paste -> external_rust_crates_paste.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_paste.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/paste/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_remain.tar.zst" ]; then
  echo "Compressing external/rust/crates/remain -> external_rust_crates_remain.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_remain.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/remain/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_slab.tar.zst" ]; then
  echo "Compressing external/rust/crates/slab -> external_rust_crates_slab.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_slab.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/slab/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst" ]; then
  echo "Compressing external/rust/crates/smallvec -> external_rust_crates_smallvec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_smallvec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/smallvec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror -> external_rust_crates_thiserror.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst" ]; then
  echo "Compressing external/rust/crates/thiserror-impl -> external_rust_crates_thiserror-impl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rust_crates_thiserror-impl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rust/crates/thiserror-impl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_virglrenderer.tar.zst" ]; then
  echo "Compressing external/virglrenderer -> external_virglrenderer.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_virglrenderer.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/virglrenderer/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_wayland.tar.zst" ]; then
  echo "Compressing external/wayland -> external_wayland.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_wayland.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/wayland/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi


rm -rf aosp
