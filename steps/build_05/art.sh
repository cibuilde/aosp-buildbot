
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

echo "Preparing for art"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform dalvik
clone_depth_platform external/cpu_features
clone_depth_platform external/dlmalloc
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/perfetto
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libartpalette/libartpalette^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/perfetto_hprof/art_perfetto_hprof_operator_srcs^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/sigchainlib/libsigchain^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/cpp-define-generator/cpp-define-generator-asm-support^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl_android^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_base_version_gen_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libnativehelper/libnativehelper^android_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libnativehelper/libnativehelper^android_x86_x86_64_shared_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building dalvikvm^android_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja dalvikvm,android_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/dalvikvm^android_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/dalvikvm^android_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_64_apex31/addition_copy_files.output

echo "building dalvikvm^android_x86_x86_64_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja dalvikvm,android_x86_x86_64_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/dalvikvm^android_x86_x86_64_apex31.output . $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/dalvikvm^android_x86_x86_64_apex31.output $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31 $GITHUB_WORKSPACE/artifacts/art/dalvikvm/dalvikvm^android_x86_x86_64_apex31/addition_copy_files.output

echo "building libartpalette^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libartpalette,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libartpalette^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libartpalette^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libartpalette^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libartpalette,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libartpalette^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libartpalette^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libartpalette/libartpalette^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building libnativebridge^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnativebridge,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libnativebridge^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libnativebridge^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libnativebridge^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libnativebridge,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libnativebridge^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libnativebridge^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/libnativebridge/libnativebridge^android_x86_x86_64_shared_apex31/addition_copy_files.output

echo "building art-apex-cache-info^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja art-apex-cache-info,
mkdir -p $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/art-apex-cache-info^.output . $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/art-apex-cache-info^.output $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^ $GITHUB_WORKSPACE/artifacts/art/odrefresh/art-apex-cache-info^/addition_copy_files.output

echo "building libperfetto_hprof^android_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libperfetto_hprof,android_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libperfetto_hprof^android_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libperfetto_hprof^android_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_64_static_apex31/addition_copy_files.output

echo "building libperfetto_hprof^android_x86_x86_64_static_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libperfetto_hprof,android_x86_x86_64_static_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libperfetto_hprof^android_x86_x86_64_static_apex31.output . $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libperfetto_hprof^android_x86_x86_64_static_apex31.output $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31 $GITHUB_WORKSPACE/artifacts/art/perfetto_hprof/libperfetto_hprof^android_x86_x86_64_static_apex31/addition_copy_files.output

echo "building libsigchain^android_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsigchain,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libsigchain^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libsigchain^android_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_64_shared_apex31/addition_copy_files.output

echo "building libsigchain^android_x86_x86_64_shared_apex31"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsigchain,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/art/libsigchain^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/art/libsigchain^android_x86_x86_64_shared_apex31.output $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31 $GITHUB_WORKSPACE/artifacts/art/sigchainlib/libsigchain^android_x86_x86_64_shared_apex31/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/art/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 art.tar.zst --clobber

du -ah -d1 art*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/dalvik.tar.zst" ]; then
  echo "Compressing dalvik -> dalvik.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/dalvik.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/dalvik/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
