source $GITHUB_WORKSPACE/envsetup.sh
df -h

GOROOT=$TOP/prebuilts/go/linux-x86 $GITHUB_WORKSPACE/soong_ui --make-mode --skip-ninja --skip-kati --skip-soong-tests --skip-write-modules -j1 TARGET_PRODUCT=aosp_x86_64 TARGET_BUILD_VARIANT=eng ALLOW_MISSING_DEPENDENCIES=true BUILD_BROKEN_DISABLE_BAZEL=1 nothing

start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin \
  out/soong/.intermediates/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin \
  out/soong/.intermediates/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin \
  out/soong/.intermediates/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so \
  out/soong/.intermediates/external/perfetto/traced/android_x86_64/traced \
  out/soong/.intermediates/external/perfetto/traced_probes/android_x86_64/traced_probes \
  out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a \
  out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a \
  out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a \
  out/soong/.intermediates/external/perfetto/perfetto/android_x86_64/perfetto \
  out/soong/.intermediates/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto \
  

mkdir -p prebuiltlibs/external/perfetto/ipc_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin prebuiltlibs/external/perfetto/ipc_plugin/linux_glibc_x86_64/ipc_plugin
mkdir -p prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin prebuiltlibs/external/perfetto/perfetto_src_protozero_protoc_plugin_cppgen_plugin/linux_glibc_x86_64/perfetto_src_protozero_protoc_plugin_cppgen_plugin
mkdir -p prebuiltlibs/external/perfetto/protozero_plugin/linux_glibc_x86_64/ && mv out/soong/.intermediates/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin prebuiltlibs/external/perfetto/protozero_plugin/linux_glibc_x86_64/protozero_plugin
mkdir -p prebuiltlibs/external/perfetto/libperfetto/android_x86_64_shared/ && mv out/soong/.intermediates/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so prebuiltlibs/external/perfetto/libperfetto/android_x86_64_shared/libperfetto.so
mkdir -p prebuiltlibs/external/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/include/ prebuiltlibs/external/perfetto/include
mkdir -p prebuiltlibs/external/perfetto/traced/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/traced/android_x86_64/traced prebuiltlibs/external/perfetto/traced/android_x86_64/traced
mkdir -p prebuiltlibs/external/perfetto/traced_probes/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/traced_probes/android_x86_64/traced_probes prebuiltlibs/external/perfetto/traced_probes/android_x86_64/traced_probes
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static_apex31/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_x86_64_static_apex31/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static/ && mv out/soong/.intermediates/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a prebuiltlibs/external/perfetto/libperfetto_client_experimental/android_x86_64_static/libperfetto_client_experimental.a
mkdir -p prebuiltlibs/external/perfetto/include
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/perfetto/include/ prebuiltlibs/external/perfetto/include
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers/gen prebuiltlibs/external/perfetto/
rsync -ar out/soong/.intermediates/external/perfetto/perfetto_src_base_version_gen_h/gen prebuiltlibs/external/perfetto/
mkdir -p prebuiltlibs/external/perfetto/perfetto/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/perfetto/android_x86_64/perfetto prebuiltlibs/external/perfetto/perfetto/android_x86_64/perfetto
mkdir -p prebuiltlibs/external/perfetto/trigger_perfetto/android_x86_64/ && mv out/soong/.intermediates/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto prebuiltlibs/external/perfetto/trigger_perfetto/android_x86_64/trigger_perfetto

printf "cc_prebuilt_binary {\n  name: \"ipc_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"ipc_plugin\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"perfetto_src_protozero_protoc_plugin_cppgen_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"perfetto_src_protozero_protoc_plugin_cppgen_plugin\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"protozero_plugin\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  host_supported: true,\n  device_supported: false,\n  srcs: [\"protozero_plugin\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_library_shared {\n  name: \"libperfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n      shared_libs: [\"liblog\"],\n    },\n  },\n  host_supported: true,\n  export_include_dirs: [\"include\",\"include/perfetto/base/build_configs/android_tree\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto.so\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"traced\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libperfetto\"],\n  init_rc: [\"perfetto.rc\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"traced_probes\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libperfetto\"],\n  required: [\"libperfetto_android_internal\",\"mm_events\",\"traced_perf\",\"trigger_perfetto\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"traced_probes\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_library_static {\n  name: \"libperfetto_client_experimental\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\"],\n  export_include_dirs: [\"include\",\"include/perfetto/base/build_configs/android_tree\",\"gen\",\"gen/external/perfetto\",\"gen/external/perfetto/protos\"],\n  apex_available: [\"//apex_available:platform\",\"com.android.art\",\"com.android.art.debug\"],\n  min_sdk_version: \"S\",\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libperfetto_client_experimental.a\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"perfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\",\"libz\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"perfetto\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp
printf "cc_prebuilt_binary {\n  name: \"trigger_perfetto\",\n  target: {\n    android: {\n      lto: {\n        thin: true,\n      },\n    },\n  },\n  shared_libs: [\"liblog\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"trigger_perfetto\"],\n}\n" >> prebuiltlibs/external/perfetto/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/perfetto/ninja && rsync -ar out/soong/ninja/external/perfetto/ prebuiltlibs/external/perfetto/ninja/external_perfetto-5
touch prebuiltlibs/external/perfetto/ninja/.find-ignore
tar cfJ external_perfetto-5.tar.xz -C prebuiltlibs/external/perfetto/ .
ls -l external_perfetto-5.tar.xz
end=`date +%s`
echo $((end-start))
start=`date +%s`
./prebuilts/build-tools/linux-x86/bin/ninja -f out/soong/build.ninja \
  out/soong/.intermediates/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a \
  

mkdir -p prebuiltlibs/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/ && mv out/soong/.intermediates/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a prebuiltlibs/external/wayland/libwayland_client_static/android_x86_64_static_apex10000/libwayland_client_static.a
mkdir -p prebuiltlibs/external/wayland/src
rsync -ar --exclude=".git" --exclude="Android.bp" --exclude="Android.mk" external/wayland/src/ prebuiltlibs/external/wayland/src
rsync -ar out/soong/.intermediates/external/wayland/wayland_core_client_protocol_headers/gen prebuiltlibs/external/wayland/

printf "cc_prebuilt_library_static {\n  name: \"libwayland_client_static\",\n  static_libs: [\"libffi\"],\n  export_include_dirs: [\"src\",\"gen\"],\n  vendor_available: true,\n  apex_available: [\"//apex_available:platform\",\"com.android.virt\"],\n  strip: {\n    none: true,\n  },\n  multiple_variants: true,\n  prefer: true,\n  srcs: [\"libwayland_client_static.a\"],\n}\n" >> prebuiltlibs/external/wayland/Android.bp

df -h
clean_out_intermediates
mkdir -p prebuiltlibs/external/wayland/ninja && rsync -ar out/soong/ninja/external/wayland/ prebuiltlibs/external/wayland/ninja/external_wayland-5
touch prebuiltlibs/external/wayland/ninja/.find-ignore
tar cfJ external_wayland-5.tar.xz -C prebuiltlibs/external/wayland/ .
ls -l external_wayland-5.tar.xz
end=`date +%s`
echo $((end-start))

du -ah -d1 out/soong |sort -h
