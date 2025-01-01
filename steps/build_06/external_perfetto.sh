set -e

echo "entering external/perfetto"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/StatsD
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_base_version_gen_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_perfetto_cmd_gen_cc_config_descriptor^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_perfetto_cmd_protos_gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_perfetto_cmd_protos_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .

echo "building libperfetto^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libperfetto,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/libperfetto^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/libperfetto^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/perfetto/libperfetto^android_x86_64_shared/addition_copy_files.output

echo "building libstatslog_perfetto^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libstatslog_perfetto,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin.output $GITHUB_WORKSPACE/artifacts/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin $GITHUB_WORKSPACE/artifacts/external/perfetto/libstatslog_perfetto^android_x86_64_static_lto-thin/addition_copy_files.output

echo "building perfetto^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja perfetto,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/perfetto^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/perfetto/perfetto^android_x86_64/addition_copy_files.output

echo "building statslog_perfetto.cpp^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog_perfetto.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/statslog_perfetto.cpp^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.cpp^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/statslog_perfetto.cpp^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.cpp^ $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.cpp^/addition_copy_files.output

echo "building statslog_perfetto.h^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog_perfetto.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/statslog_perfetto.h^.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/statslog_perfetto.h^.output $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.h^ $GITHUB_WORKSPACE/artifacts/external/perfetto/statslog_perfetto.h^/addition_copy_files.output

echo "building traced^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja traced,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/traced^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/traced^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/traced^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/traced^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/perfetto/traced^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/perfetto/traced^android_x86_64/addition_copy_files.output

echo "building traced_probes^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja traced_probes,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/traced_probes^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/traced_probes^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/traced_probes^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/traced_probes^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/perfetto/traced_probes^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/perfetto/traced_probes^android_x86_64/addition_copy_files.output

echo "building trigger_perfetto^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja trigger_perfetto,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/perfetto/trigger_perfetto^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/trigger_perfetto^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/perfetto/trigger_perfetto^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/perfetto/trigger_perfetto^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/perfetto/trigger_perfetto^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/perfetto/trigger_perfetto^android_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/perfetto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_perfetto.tar.zst --clobber

du -ah -d1 external_perfetto*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
