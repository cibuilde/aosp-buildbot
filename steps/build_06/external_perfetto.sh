set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/ipc_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/protozero_plugin^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .

echo "building perfetto_protos_perfetto_common_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_common_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^

echo "building perfetto_protos_perfetto_common_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_common_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^

echo "building perfetto_protos_perfetto_common_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_common_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_common_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen^

echo "building perfetto_protos_perfetto_common_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_common_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_android_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_android_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^

echo "building perfetto_protos_perfetto_config_android_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_android_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_android_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_android_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^

echo "building perfetto_protos_perfetto_config_android_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_android_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^

echo "building perfetto_protos_perfetto_config_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_ftrace_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_ftrace_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^

echo "building perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_ftrace_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_ftrace_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_ftrace_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^

echo "building perfetto_protos_perfetto_config_ftrace_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_ftrace_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_gpu_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_gpu_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^

echo "building perfetto_protos_perfetto_config_gpu_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_gpu_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_gpu_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_gpu_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^

echo "building perfetto_protos_perfetto_config_gpu_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_gpu_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_inode_file_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_inode_file_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^

echo "building perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_inode_file_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_inode_file_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_inode_file_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^

echo "building perfetto_protos_perfetto_config_inode_file_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_inode_file_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_interceptors_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_interceptors_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^

echo "building perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_interceptors_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_interceptors_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_interceptors_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^

echo "building perfetto_protos_perfetto_config_interceptors_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_interceptors_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_power_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_power_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^

echo "building perfetto_protos_perfetto_config_power_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_power_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_power_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_power_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^

echo "building perfetto_protos_perfetto_config_power_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_power_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_process_stats_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_process_stats_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^

echo "building perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_process_stats_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_process_stats_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_process_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^

echo "building perfetto_protos_perfetto_config_process_stats_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_process_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_profiling_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_profiling_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^

echo "building perfetto_protos_perfetto_config_profiling_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_profiling_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_profiling_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_profiling_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^

echo "building perfetto_protos_perfetto_config_profiling_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_profiling_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_sys_stats_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_sys_stats_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^

echo "building perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_sys_stats_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_sys_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^

echo "building perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_sys_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_track_event_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_track_event_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^

echo "building perfetto_protos_perfetto_config_track_event_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_track_event_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^

echo "building perfetto_protos_perfetto_config_track_event_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_track_event_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^

echo "building perfetto_protos_perfetto_config_track_event_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_track_event_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^

echo "building perfetto_protos_perfetto_config_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen^

echo "building perfetto_protos_perfetto_config_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_config_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^

echo "building perfetto_protos_perfetto_ipc_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^

echo "building perfetto_protos_perfetto_ipc_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^

echo "building perfetto_protos_perfetto_ipc_ipc_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_ipc_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^

echo "building perfetto_protos_perfetto_ipc_ipc_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_ipc_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^

echo "building perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^

echo "building perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^

echo "building perfetto_protos_perfetto_trace_android_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_android_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^

echo "building perfetto_protos_perfetto_trace_android_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_android_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_chrome_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_chrome_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^

echo "building perfetto_protos_perfetto_trace_chrome_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_chrome_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_filesystem_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_filesystem_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^

echo "building perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_filesystem_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_ftrace_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_ftrace_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^

echo "building perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_ftrace_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_gpu_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_gpu_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^

echo "building perfetto_protos_perfetto_trace_gpu_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_gpu_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_interned_data_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_interned_data_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^

echo "building perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_interned_data_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_minimal_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_minimal_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^

echo "building perfetto_protos_perfetto_trace_minimal_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_minimal_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_non_minimal_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_non_minimal_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^

echo "building perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_perfetto_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_perfetto_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^

echo "building perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_perfetto_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_power_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_power_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^

echo "building perfetto_protos_perfetto_trace_power_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_power_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_profiling_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_profiling_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^

echo "building perfetto_protos_perfetto_trace_profiling_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_profiling_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_ps_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_ps_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^

echo "building perfetto_protos_perfetto_trace_ps_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_ps_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_sys_stats_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_sys_stats_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^

echo "building perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_system_info_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_system_info_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^

echo "building perfetto_protos_perfetto_trace_system_info_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_system_info_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^

echo "building perfetto_protos_perfetto_trace_track_event_cpp_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_track_event_cpp_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^

echo "building perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_track_event_cpp_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^

echo "building perfetto_protos_perfetto_trace_track_event_zero_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_track_event_zero_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^

echo "building perfetto_protos_perfetto_trace_track_event_zero_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_protos_perfetto_trace_track_event_zero_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^

echo "building perfetto_src_perfetto_cmd_protos_gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_src_perfetto_cmd_protos_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^

echo "building perfetto_src_perfetto_cmd_protos_gen_headers^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto_src_perfetto_cmd_protos_gen_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_perfetto.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
