set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_sparse cts libs/json
clone_depth_platform dalvik
clone_depth_platform external/boringssl
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lz4
clone_depth_platform external/lzma
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform external/vixl
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libcore
clone_depth_platform libnativehelper
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libsysprop
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/artifacts/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/compiler/art_compiler_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/dex2oat/art_dex2oat_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libartbase/art_libartbase_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/art_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/tools/cpp-define-generator/cpp-define-generator-asm-support^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libdexfile/dexfile_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/runtime/libart_mterp.x86_64ng^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/art/libelffile/libelffiled^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features-utils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/cpu_features/libcpu_features^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_base_version_gen_h^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building art-apex-cache-info^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja art-apex-cache-info,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/art-apex-cache-info^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^

echo "building libart-dex2oat^android_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-dex2oat,android_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-dex2oat^android_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_64_static_lto-thin_apex31

echo "building libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libart-dex2oat,android_x86_x86_64_static_lto-thin_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libart-dex2oat^android_x86_x86_64_static_lto-thin_apex31

echo "building libartbase^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbase,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_64_static_apex31

echo "building libartbase^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbase,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^android_x86_x86_64_static_apex31

echo "building libartbase^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbase,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbase^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbase^linux_glibc_x86_64_static

echo "building libartbased^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartbased,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbased^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartbased^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libartbase/libartbased^linux_glibc_x86_64_static

echo "building libartd-compiler^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartd-compiler,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/compiler/libartd-compiler^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartd-compiler^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/compiler/libartd-compiler^linux_glibc_x86_64_static

echo "building libartd-dex2oat^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartd-dex2oat,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dex2oat/libartd-dex2oat^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartd-dex2oat^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/dex2oat/libartd-dex2oat^linux_glibc_x86_64_static

echo "building libartd^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libartd,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/libartd^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libartd^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/runtime/libartd^linux_glibc_x86_64_static

echo "building libdexfile^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfile,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_64_static_apex31

echo "building libdexfile^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfile,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^android_x86_x86_64_static_apex31

echo "building libdexfile^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfile,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfile^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfile^linux_glibc_x86_64_static

echo "building libdexfiled^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libdexfiled,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfiled^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libdexfiled^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/art/libdexfile/libdexfiled^linux_glibc_x86_64_static

echo "building libnativeloader^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_64_shared_current

echo "building libnativeloader^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libnativeloader,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libnativeloader^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current

echo "building libperfetto_hprof^android_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libperfetto_hprof,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31

echo "building libperfetto_hprof^android_x86_x86_64_static_apex31"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libperfetto_hprof,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libperfetto_hprof^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31

echo "building libsigchain^android_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libsigchain,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libsigchain^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_current

echo "building libsigchain^android_x86_x86_64_shared_current"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libsigchain,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/libsigchain^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_current

echo "building statslog_art.cpp^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_art.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/statslog_art.cpp^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.cpp^

echo "building statslog_art.h^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_art.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/statslog_art.h^.output . $GITHUB_WORKSPACE/artifacts/art/runtime/statslog_art.h^

echo "building statslog_odrefresh.cpp^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_odrefresh.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/statslog_odrefresh.cpp^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.cpp^

echo "building statslog_odrefresh.h^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_odrefresh.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/art/statslog_odrefresh.h^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/statslog_odrefresh.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 art.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst" ]; then
  echo "Compressing external/cpu_features -> external_cpu_features.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_cpu_features.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/cpu_features/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst" ]; then
  echo "Compressing external/dlmalloc -> external_dlmalloc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_dlmalloc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/dlmalloc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lz4.tar.zst" ]; then
  echo "Compressing external/lz4 -> external_lz4.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lz4.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lz4/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vixl.tar.zst" ]; then
  echo "Compressing external/vixl -> external_vixl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vixl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vixl/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst" ]; then
  echo "Compressing system/libsysprop -> system_libsysprop.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libsysprop.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libsysprop/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
