
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

echo "Preparing for system/core"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth_platform build/soong
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/brotli
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fec
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcap
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/lzma
clone_depth_platform external/minijail
clone_depth_platform external/pcre
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/apex
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gsid
clone_depth_platform system/libbase
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/lmkd
clone_depth_platform system/tools/hidl
clone_depth_platform system/tools/mkbootimg
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_static^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/avb/libavb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fec/libfec_rs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcap/libcap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++fs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/apex-info-list^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/apex/proto/lib_apex_manifest_proto_lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_mgr^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/liblp/liblp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/sysprop/libcom.android.sysprop.init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/init/sysprop/libcom.android.sysprop.init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libdiskconfig/libdiskconfig^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libkeyutils/libkeyutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libkeyutils/libkeyutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libmodprobe/libmodprobe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libmodprobe/libmodprobe^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libmodprobe/libmodprobe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsysutils/libsysutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsysutils/libsysutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/llkd/libllkd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/mini_keyctl/libmini_keyctl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/property_service/libpropertyinfoparser/libpropertyinfoparser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/toolbox/toolbox_input_labels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/libfec/libfec^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/gsid/libgsi^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor_ramdisk_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/logwrapper/liblogwrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libbacktrace/libbacktrace_no_dex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_x86_64_static/ .

echo "building crash_dump^android_x86_64_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja crash_dump,android_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/crash_dump^android_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_64_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/crash_dump^android_x86_64_apex10000.output $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_64_apex10000 $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_64_apex10000/addition_copy_files.output

echo "building crash_dump^android_x86_x86_64_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja crash_dump,android_x86_x86_64_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/crash_dump^android_x86_x86_64_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/crash_dump^android_x86_x86_64_apex10000.output $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000 $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/crash_dump^android_x86_x86_64_apex10000/addition_copy_files.output

echo "building libtombstoned_client^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libtombstoned_client,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libtombstoned_client^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libtombstoned_client^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_64_shared/addition_copy_files.output

echo "building libtombstoned_client^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libtombstoned_client,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libtombstoned_client^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libtombstoned_client^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libtombstoned_client^android_x86_x86_64_shared/addition_copy_files.output

echo "building dmctl^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dmctl,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmctl^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/dmctl^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmctl^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/dmctl^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmctl^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmctl^android_x86_64/addition_copy_files.output

echo "building dmuserd^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja dmuserd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmuserd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/dmuserd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmuserd^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/dmuserd^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmuserd^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/tools/dmuserd^android_x86_64/addition_copy_files.output

echo "building libinit^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libinit,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libinit^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libinit^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static/addition_copy_files.output

echo "building libinit^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libinit,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libinit^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libinit^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static/addition_copy_files.output

echo "building init_first_stage_soong^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja init_first_stage_soong,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/init_first_stage_soong^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/init_first_stage_soong^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64/addition_copy_files.output

echo "building libappfuse^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libappfuse,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libappfuse^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libappfuse^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_64_shared/addition_copy_files.output

echo "building libappfuse^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libappfuse,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libappfuse^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libappfuse^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libappfuse/libappfuse^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcrypto_utils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcrypto_utils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcrypto_utils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcrypto_utils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libcrypto_utils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcrypto_utils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcrypto_utils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcrypto_utils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libcutils^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcutils,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libcutils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcutils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libcutils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcutils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libcutils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcutils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_shared/addition_copy_files.output

echo "building libcutils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcutils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcutils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_shared/addition_copy_files.output

echo "building libdiskconfig^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdiskconfig,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libdiskconfig^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdiskconfig,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libdiskconfig^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdiskconfig,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libdiskconfig^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_x86_64_shared/addition_copy_files.output

echo "building libnetutils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnetutils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libnetutils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnetutils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libnetutils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnetutils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_64_shared/addition_copy_files.output

echo "building libnetutils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libnetutils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libnetutils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libnetutils/libnetutils^android_x86_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcgrouprc^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libcgrouprc^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared/addition_copy_files.output

echo "building libcgrouprc^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup_setup^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup_setup,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup_setup^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup_setup^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libprocessgroup_setup^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup_setup,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup_setup^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup_setup^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/setup/libprocessgroup_setup^android_x86_64_shared/addition_copy_files.output

echo "building libsparse^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsparse,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libsparse^android_vendor_ramdisk_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsparse,android_vendor_ramdisk_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_vendor_ramdisk_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_vendor_ramdisk_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_vendor_ramdisk_x86_64_shared/addition_copy_files.output

echo "building libsparse^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsparse,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsparse^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_shared/addition_copy_files.output

echo "building libsysutils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsysutils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libsysutils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsysutils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libsysutils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsysutils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_64_shared/addition_copy_files.output

echo "building libsysutils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsysutils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libsysutils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_x86_x86_64_shared/addition_copy_files.output

echo "building libutils^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libutils,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libutils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libutils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libutils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libutils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libutils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libutils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_64_shared/addition_copy_files.output

echo "building libutils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libutils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/libutils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_x86_x86_64_shared/addition_copy_files.output

echo "building llkd^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja llkd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/llkd/llkd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/llkd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/llkd/llkd^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/llkd^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/llkd/llkd^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/llkd/llkd^android_x86_64/addition_copy_files.output

echo "building mini-keyctl^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja mini-keyctl,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/mini-keyctl^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/mini-keyctl^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/mini-keyctl^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/mini-keyctl^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/mini-keyctl^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/mini_keyctl/mini-keyctl^android_x86_64/addition_copy_files.output

echo "building reboot^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja reboot,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/reboot^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/reboot^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_recovery_x86_64/addition_copy_files.output

echo "building reboot^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja reboot,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/reboot^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/reboot^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/reboot/reboot^android_x86_64/addition_copy_files.output

echo "building sdcard^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdcard,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/sdcard/sdcard^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/sdcard^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/sdcard/sdcard^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/sdcard^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/sdcard/sdcard^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/sdcard/sdcard^android_x86_64/addition_copy_files.output

echo "building toolbox^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja toolbox,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_recovery_x86_64/addition_copy_files.output

echo "building toolbox^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja toolbox,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox^android_x86_64/addition_copy_files.output

echo "building toolbox_vendor^android_vendor.31_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja toolbox_vendor,android_vendor.31_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox_vendor^android_vendor.31_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/toolbox_vendor^android_vendor.31_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/toolbox/toolbox_vendor^android_vendor.31_x86_64/addition_copy_files.output

echo "building watchdogd^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja watchdogd,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/watchdogd^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/watchdogd^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_recovery_x86_64/addition_copy_files.output

echo "building watchdogd^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja watchdogd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/watchdogd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/system/core/watchdogd^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/watchdogd/watchdogd^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 system_core.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fec.tar.zst" ]; then
  echo "Compressing external/fec -> external_fec.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fec.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fec/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_minijail.tar.zst" ]; then
  echo "Compressing external/minijail -> external_minijail.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_minijail.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/minijail/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pcre.tar.zst" ]; then
  echo "Compressing external/pcre -> external_pcre.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pcre.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pcre/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst" ]; then
  echo "Compressing system/tools/mkbootimg -> system_tools_mkbootimg.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_mkbootimg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/mkbootimg/ .
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
