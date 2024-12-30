set -e

echo "entering system/core"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth_platform build/soong
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/brotli
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/icu
clone_depth_platform external/libcap
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gsid
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/lmkd
clone_depth_platform system/tools/hidl
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/libavb^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/libavb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/brotli/libbrotli^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++fs^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++fs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/libstatslog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/bootstat/libbootstat^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/sysprop/libcom.android.sysprop.init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/sysprop/libcom.android.sysprop.init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libdm/libdm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libdm/libdm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_avb/libfs_avb^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_mgr^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/libinit^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/libinit^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libkeyutils/libkeyutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/liblp/liblp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libmodprobe/libmodprobe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libmodprobe/libmodprobe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoserializer/libpropertyinfoserializer^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/libfec/libfec^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/libfec/libfec^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/libfscrypt/libfscrypt^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/gsi_aidl_interface-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/libgsi^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/libgsi^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/libgsi^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/libgsi^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/lmkd/liblmkd_utils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/lmkd/liblmkd_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/hidl/utils/libhidl-gen-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_x86_64_static/ .

echo "building bootstat^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja bootstat,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/bootstat/bootstat^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/bootstat^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/bootstat/bootstat^android_x86_64

echo "building init_second_stage^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja init_second_stage,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/init_second_stage^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/init_second_stage^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/init/init_second_stage^android_recovery_x86_64

echo "building init_second_stage^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja init_second_stage,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/init_second_stage^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/init_second_stage^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/init/init_second_stage^android_x86_64

echo "building libbinderwrapper^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbinderwrapper,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libbinderwrapper/libbinderwrapper^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libbinderwrapper^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libbinderwrapper/libbinderwrapper^android_x86_64_shared

echo "building libfs_mgr^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libfs_mgr,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libfs_mgr^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_shared

echo "building libfs_mgr^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libfs_mgr,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libfs_mgr^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_x86_64_shared

echo "building libgatekeeper_aidl^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libgatekeeper_aidl,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/gatekeeperd/libgatekeeper_aidl^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libgatekeeper_aidl^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/gatekeeperd/libgatekeeper_aidl^android_x86_64_shared

echo "building liblp^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja liblp,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/liblp^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_recovery_x86_64_shared

echo "building liblp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja liblp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/liblp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_x86_64_shared

echo "building libsnapshot^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libsnapshot,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libsnapshot^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot^android_x86_64_static

echo "building libstoraged^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstoraged,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/storaged/libstoraged^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/system/core/libstoraged^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/storaged/libstoraged^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 system_core.tar.zst --clobber

du -ah -d1 system_core*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst" ]; then
  echo "Compressing bootable/recovery -> bootable_recovery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_brotli.tar.zst" ]; then
  echo "Compressing external/brotli -> external_brotli.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_brotli.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/brotli/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcap.tar.zst" ]; then
  echo "Compressing external/libcap -> external_libcap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcap/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.zst" ]; then
  echo "Compressing system/extras -> system_extras.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_extras.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst" ]; then
  echo "Compressing system/libprocinfo -> system_libprocinfo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libprocinfo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libprocinfo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_lmkd.tar.zst" ]; then
  echo "Compressing system/memory/lmkd -> system_memory_lmkd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_lmkd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/lmkd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi

rm -rf aosp
