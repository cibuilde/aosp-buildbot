
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

echo "Preparing for frameworks/native"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/bc
clone_depth_platform external/bcc
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcap
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/libs/net
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bpf
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/server_configurable_flags
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge_lazy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativebridge/libnativebridge_lazy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader_lazy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader_lazy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++fs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++fs^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_common_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_inode_file_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_interceptors_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_process_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_config_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_ipc_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_ipc_wire_protocol_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_android_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_chrome_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_filesystem_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ftrace_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_gpu_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_interned_data_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_non_minimal_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_perfetto_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_power_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_profiling_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_ps_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_sys_stats_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_system_info_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_cpp_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_protos_perfetto_trace_track_event_zero_gen_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/perfetto_src_base_version_gen_h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/lib-platform-compat-native-api^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/1.0/android.frameworks.stats@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/stats/aidl/android.frameworks.stats-V1-ndk_platform^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/idlcli/libidlcli^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/attestation/libattestation^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/attestation/libattestation^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_vendor.31_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/graphicsenv/libgraphicsenv^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_vendor.31_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_vendor.31_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_vendor.31_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/math/libmath^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/math/libmath^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/math/libmath^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/math/libmath^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui-types^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui-types^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui-types^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL_getProcAddress^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL_blobCache^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/gpuservice/gpumem/libgpumem^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/gpuservice/gpustats/libgfxstats^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/gpuservice/tracing/libgpumemtracer^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/inputflinger/reporter/libinputreporter^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsatomsproto/libtimestats_atoms_proto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/atrace/1.0/android.hardware.atrace@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/4.0/android.hardware.graphics.allocator@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.1/android.hardware.graphics.mapper@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/classifier/1.0/android.hardware.input.classifier@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/input/common/1.0/android.hardware.input.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/1.0/android.hardware.memtrack@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/memtrack/aidl/android.hardware.memtrack-V1-ndk_platform^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V2-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.0/android.hardware.vibrator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.1/android.hardware.vibrator@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.2/android.hardware.vibrator@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/1.3/android.hardware.vibrator@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/vibrator/aidl/android.hardware.vibrator-V2-ndk_platform^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libkll/libkll^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libkll/libkll^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libkll/proto/libkll-protos^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libkll/proto/libkll-protos^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatspull/libstatspull^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libgrallocusage/libgrallocusage^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/server_configurable_flags/libflags/server_configurable_flags^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_x86_x86_64_shared/ .

echo "building atrace^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja atrace,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/atrace/atrace^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/atrace^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/atrace/atrace^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/atrace^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/atrace/atrace^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/atrace/atrace^android_x86_64/addition_copy_files.output

echo "building idlcli^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja idlcli,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/idlcli^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/idlcli^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/idlcli^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/idlcli^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/idlcli^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/idlcli/idlcli^android_x86_64/addition_copy_files.output

echo "building libbufferqueueconverter^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferqueueconverter,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferqueueconverter^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferqueueconverter^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libbufferqueueconverter^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferqueueconverter,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/bufferqueueconverter/libbufferqueueconverter^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libgralloctypes^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgralloctypes,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libgralloctypes^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgralloctypes,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libgralloctypes^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgralloctypes,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_64_shared/addition_copy_files.output

echo "building libgralloctypes^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgralloctypes,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgralloctypes^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gralloc/types/libgralloctypes^android_x86_x86_64_shared/addition_copy_files.output

echo "building libgui^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgui,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgui^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgui^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libgui^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgui,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgui^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgui^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libinput^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinput,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinput^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinput^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_64_shared/addition_copy_files.output

echo "building libinput^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinput,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinput^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinput^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/input/libinput^android_x86_x86_64_shared/addition_copy_files.output

echo "building libnativewindow^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libnativewindow,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libnativewindow^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libnativewindow^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared/addition_copy_files.output

echo "building libnativewindow^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libnativewindow,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libnativewindow^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libnativewindow^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared/addition_copy_files.output

echo "building libui^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libui,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libui^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libui,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libui^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libui,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_64_shared/addition_copy_files.output

echo "building libui^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libui,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libui^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/ui/libui^android_x86_x86_64_shared/addition_copy_files.output

echo "building libbufferhub^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferhub,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhub^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhub^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared/addition_copy_files.output

echo "building libbufferhub^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferhub,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhub^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhub^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared/addition_copy_files.output

echo "building libbufferhubqueue^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferhubqueue,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhubqueue^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhubqueue^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared/addition_copy_files.output

echo "building libbufferhubqueue^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libbufferhubqueue,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhubqueue^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libbufferhubqueue^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared/addition_copy_files.output

echo "building libEGL^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libEGL,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libEGL^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libEGL^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_64_shared/addition_copy_files.output

echo "building libEGL^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libEGL,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libEGL^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libEGL^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared/addition_copy_files.output

echo "building libGLESv1_CM^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv1_CM,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv1_CM^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv1_CM^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared/addition_copy_files.output

echo "building libGLESv1_CM^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv1_CM,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv1_CM^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv1_CM^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared/addition_copy_files.output

echo "building libGLESv2^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv2^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared/addition_copy_files.output

echo "building libGLESv2^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv2^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared/addition_copy_files.output

echo "building libGLESv3^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv3,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv3^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv3^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_64_shared/addition_copy_files.output

echo "building libGLESv3^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libGLESv3,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv3^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libGLESv3^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/opengl/libs/libGLESv3^android_x86_x86_64_shared/addition_copy_files.output

echo "building libgpuservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libgpuservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgpuservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libgpuservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/libgpuservice^android_x86_64_shared/addition_copy_files.output

echo "building gpuservice^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja gpuservice,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/gpuservice^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/gpuservice^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/gpuservice^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/gpuservice^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/gpuservice^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/native/services/gpuservice/gpuservice^android_x86_64/addition_copy_files.output

echo "building libinputflinger_base^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputflinger_base,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger_base^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger_base^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_64_shared/addition_copy_files.output

echo "building libinputflinger_base^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputflinger_base,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger_base^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger_base^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger_base^android_x86_x86_64_shared/addition_copy_files.output

echo "building libinputflinger^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputflinger,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_64_shared/addition_copy_files.output

echo "building libinputflinger^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputflinger,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputflinger^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/libinputflinger^android_x86_x86_64_shared/addition_copy_files.output

echo "building libinputdispatcher^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputdispatcher,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputdispatcher^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputdispatcher^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_64_static/addition_copy_files.output

echo "building libinputdispatcher^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputdispatcher,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputdispatcher^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputdispatcher^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/dispatcher/libinputdispatcher^android_x86_x86_64_static/addition_copy_files.output

echo "building libinputreader^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputreader,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputreader^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputreader^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_64_shared/addition_copy_files.output

echo "building libinputreader^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libinputreader,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputreader^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libinputreader^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/inputflinger/reader/libinputreader^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmemtrackproxy^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmemtrackproxy,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libmemtrackproxy^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libmemtrackproxy^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_64_shared/addition_copy_files.output

echo "building libmemtrackproxy^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libmemtrackproxy,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libmemtrackproxy^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libmemtrackproxy^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/memtrackproxy/libmemtrackproxy^android_x86_x86_64_shared/addition_copy_files.output

echo "building libpowermanager^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libpowermanager,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libpowermanager^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libpowermanager^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared/addition_copy_files.output

echo "building libpowermanager^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libpowermanager,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libpowermanager^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libpowermanager^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstatshidl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstatshidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libstatshidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libstatshidl^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_64_shared/addition_copy_files.output

echo "building libstatshidl^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libstatshidl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libstatshidl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libstatshidl^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/stats/libstatshidl^android_x86_x86_64_shared/addition_copy_files.output

echo "building libSurfaceFlingerProp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libSurfaceFlingerProp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libSurfaceFlingerProp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libSurfaceFlingerProp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared/addition_copy_files.output

echo "building libSurfaceFlingerProp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libSurfaceFlingerProp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libSurfaceFlingerProp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libSurfaceFlingerProp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_x86_64_shared/addition_copy_files.output

echo "building libtimestats^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libtimestats,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libtimestats^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libtimestats^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared/addition_copy_files.output

echo "building libvibratorservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libvibratorservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvibratorservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvibratorservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_64_shared/addition_copy_files.output

echo "building libvibratorservice^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libvibratorservice,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvibratorservice^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvibratorservice^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/services/vibratorservice/libvibratorservice^android_x86_x86_64_shared/addition_copy_files.output

echo "building libvulkan^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libvulkan,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvulkan^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvulkan^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared/addition_copy_files.output

echo "building libvulkan^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libvulkan,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvulkan^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvulkan^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_x86_64_shared/addition_copy_files.output

echo "building libvkjson^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja libvkjson,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvkjson^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_10/frameworks/native/libvkjson^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/native/vulkan/vkjson/libvkjson^android_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 frameworks_native.tar.zst --clobber

du -ah -d1 frameworks_native*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bcc.tar.zst" ]; then
  echo "Compressing external/bcc -> external_bcc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bcc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bcc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcap.tar.zst" ]; then
  echo "Compressing external/libcap -> external_libcap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcap/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst" ]; then
  echo "Compressing frameworks/hardware/interfaces -> frameworks_hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/hardware/interfaces/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst" ]; then
  echo "Compressing frameworks/libs/net -> frameworks_libs_net.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_net.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/net/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bpf.tar.zst" ]; then
  echo "Compressing system/bpf -> system_bpf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bpf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bpf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_server_configurable_flags.tar.zst" ]; then
  echo "Compressing system/server_configurable_flags -> system_server_configurable_flags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_server_configurable_flags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/server_configurable_flags/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
