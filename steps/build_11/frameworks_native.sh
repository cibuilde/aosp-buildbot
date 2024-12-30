set -e

echo "entering frameworks/native"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libpng
clone_depth_platform external/libxml2
clone_depth_platform external/perfetto
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/skia
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/hardware/interfaces
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/bt
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding
clone_depth_platform system/vold

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/libavb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libpng/libpng^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/perfetto/libperfetto_client_experimental^android_x86_64_static/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/skia/libskia_renderengine^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-cppstream-protos^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/java/libincremental_aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/protoutil/libprotoutil^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/protoutil/libprotoutil^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/bufferhub/1.0/android.frameworks.bufferhub@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/displayservice/1.0/android.frameworks.displayservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/schedulerservice/1.0/android.frameworks.schedulerservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/hardware/interfaces/sensorservice/1.0/android.frameworks.sensorservice@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/libSurfaceFlingerProp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/sysprop/libSurfaceFlingerProperties^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbatterystats_aidl^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderdebug/libbinderdebug^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binderthreadstate/libbinderthreadstateutils^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhub/libbufferhub^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libbufferhubqueue/libbufferhubqueue^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/dumpstate/libdumpstateaidl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/dumpstate/libdumpstateutil^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/dumpsys/libdumpsys^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/dumputils/libdumputils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/incidentcompanion/libincidentcompanion^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vr/libpdx_default_transport/libpdx_default_transport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensor/libsensor^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensor/libsensor^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/utils/libserviceutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/utils/libserviceutils^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/libtimestats^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/surfaceflinger/TimeStats/timestatsproto/libtimestats_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/cmds/surfacereplayer/proto/libtrace_proto^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/vulkan/libvulkan/libvulkan^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/utils/android.hardware.configstore-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.0/android.hardware.configstore@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/configstore/1.1/android.hardware.configstore@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.0/android.hardware.dumpstate@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/dumpstate/1.1/android.hardware.dumpstate@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/3.0/android.hardware.graphics.allocator@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.2/android.hardware.graphics.composer@2.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.3/android.hardware.graphics.composer@2.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/composer/2.4/android.hardware.graphics.composer@2.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/3.0/android.hardware.graphics.mapper@3.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/aidl/android.hardware.power-V1-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.0/android.hardware.power@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.1/android.hardware.power@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.2/android.hardware.power@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.3/android.hardware.power@1.3^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/power/1.3/android.hardware.power@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/default/android.hardware.sensors@1.0-convert^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/1.0/android.hardware.sensors@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.0/android.hardware.sensors@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/sensors/2.1/android.hardware.sensors@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/libhardware_legacy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/libhardware_legacy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_session_state_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/libapex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_client^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libdm/libdm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/verity/libverity_tree^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/vold/libvold_binder^android_x86_64_static/ .

echo "building dumpstate^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja dumpstate,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpstate/dumpstate^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/dumpstate^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/dumpstate/dumpstate^android_x86_64

echo "building libcompositionengine^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libcompositionengine,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libcompositionengine^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/CompositionEngine/libcompositionengine^android_x86_64_static_lto-thin

echo "building libdisplayservicehidl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libdisplayservicehidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/displayservice/libdisplayservicehidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libdisplayservicehidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/displayservice/libdisplayservicehidl^android_x86_64_shared

echo "building libframetimeline^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libframetimeline,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libframetimeline^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/FrameTimeline/libframetimeline^android_x86_64_static_lto-thin

echo "building libgui^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libgui,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libgui^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_x86_64_shared

echo "building libgui^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libgui,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libgui^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared

echo "building liblayers_proto^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja liblayers_proto,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/liblayers_proto^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_shared

echo "building liblayers_proto^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja liblayers_proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/liblayers_proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/layerproto/liblayers_proto^android_x86_64_static

echo "building libnativedisplay^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libnativedisplay,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libnativedisplay^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_64_shared

echo "building libnativedisplay^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libnativedisplay,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libnativedisplay^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/nativedisplay/libnativedisplay^android_x86_x86_64_shared

echo "building librenderengine^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja librenderengine,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/renderengine/librenderengine^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/librenderengine^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/libs/renderengine/librenderengine^android_x86_64_static

echo "building libschedulerservicehidl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libschedulerservicehidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libschedulerservicehidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_64_shared

echo "building libschedulerservicehidl^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libschedulerservicehidl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libschedulerservicehidl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/schedulerservice/libschedulerservicehidl^android_x86_x86_64_shared

echo "building libsensorservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsensorservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/libsensorservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libsensorservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/libsensorservice^android_x86_64_shared

echo "building libsensorservice^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsensorservice,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/libsensorservice^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libsensorservice^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/libsensorservice^android_x86_x86_64_shared

echo "building libsensorservicehidl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsensorservicehidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libsensorservicehidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_64_shared

echo "building libsensorservicehidl^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsensorservicehidl,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/libsensorservicehidl^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/hidl/libsensorservicehidl^android_x86_x86_64_shared

echo "building otapreopt_chroot^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja otapreopt_chroot,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_chroot^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/otapreopt_chroot^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/cmds/installd/otapreopt_chroot^android_x86_64

echo "building sensorservice^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja sensorservice,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/sensorservice^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/sensorservice^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/sensorservice/sensorservice^android_x86_64

echo "building surfaceflinger^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja surfaceflinger,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/surfaceflinger^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/native/surfaceflinger^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/native/services/surfaceflinger/surfaceflinger^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/native/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 frameworks_native.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst" ]; then
  echo "Compressing external/e2fsprogs -> external_e2fsprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/e2fsprogs/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_perfetto.tar.zst" ]; then
  echo "Compressing external/perfetto -> external_perfetto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_perfetto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/perfetto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_skia.tar.zst" ]; then
  echo "Compressing external/skia -> external_skia.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_skia.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/skia/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_apex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_vold.tar.zst" ]; then
  echo "Compressing system/vold -> system_vold.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_vold.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/vold/ .
fi

rm -rf aosp
