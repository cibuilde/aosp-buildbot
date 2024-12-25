set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building perfetto_protos_perfetto_common_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen^

echo "building perfetto_protos_perfetto_common_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_common_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_android_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen^

echo "building perfetto_protos_perfetto_config_android_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_android_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_ftrace_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen^

echo "building perfetto_protos_perfetto_config_ftrace_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_ftrace_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_gpu_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen^

echo "building perfetto_protos_perfetto_config_gpu_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_gpu_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_inode_file_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen^

echo "building perfetto_protos_perfetto_config_inode_file_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_inode_file_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_interceptors_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen^

echo "building perfetto_protos_perfetto_config_interceptors_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_interceptors_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen^

echo "building perfetto_protos_perfetto_config_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_perfetto_config_descriptor^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_perfetto_config_descriptor,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_perfetto_config_descriptor^

echo "building perfetto_protos_perfetto_config_power_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen^

echo "building perfetto_protos_perfetto_config_power_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_power_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_process_stats_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen^

echo "building perfetto_protos_perfetto_config_process_stats_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_process_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_profiling_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen^

echo "building perfetto_protos_perfetto_config_profiling_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_profiling_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_sys_stats_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen^

echo "building perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_sys_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_lite_gen_headers^

echo "building perfetto_protos_perfetto_config_track_event_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen^

echo "building perfetto_protos_perfetto_config_track_event_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_config_track_event_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_android_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen^

echo "building perfetto_protos_perfetto_trace_android_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_android_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_chrome_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen^

echo "building perfetto_protos_perfetto_trace_chrome_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_chrome_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_filesystem_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen^

echo "building perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_filesystem_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_ftrace_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen^

echo "building perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ftrace_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_gpu_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen^

echo "building perfetto_protos_perfetto_trace_gpu_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_gpu_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_interned_data_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen^

echo "building perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_interned_data_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_minimal_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen^

echo "building perfetto_protos_perfetto_trace_minimal_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_minimal_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_non_minimal_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen^

echo "building perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_perfetto_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen^

echo "building perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_perfetto_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_power_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen^

echo "building perfetto_protos_perfetto_trace_power_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_power_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_profiling_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen^

echo "building perfetto_protos_perfetto_trace_profiling_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_profiling_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_ps_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen^

echo "building perfetto_protos_perfetto_trace_ps_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_ps_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_sys_stats_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen^

echo "building perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_system_info_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen^

echo "building perfetto_protos_perfetto_trace_system_info_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_system_info_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_lite_gen_headers^

echo "building perfetto_protos_perfetto_trace_track_event_lite_gen^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_lite_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen^

echo "building perfetto_protos_perfetto_trace_track_event_lite_gen_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_protos_perfetto_trace_track_event_lite_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_lite_gen_headers^

echo "building perfetto_src_base_version_gen_h^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja perfetto_src_base_version_gen_h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_base_version_gen_h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/perfetto/perfetto_src_base_version_gen_h^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_base_version_gen_h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_perfetto.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
