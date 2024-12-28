set -e

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
clone_depth_platform external/boringssl
clone_depth_platform external/brotli
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/jsoncpp
clone_depth_platform external/libchrome
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/lzma
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/libprocinfo
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/async_safe/libasync_safe^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/brotli/libbrotli^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/brotli/libbrotli^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/fmtlib/fmtlib^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/gwp_asan/gwp_asan_crash_handler^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/lzma/C/liblzma^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-lite^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/scudo/libscudo^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.0/android.hardware.boot@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/boot/1.1/android.hardware.boot@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libdebuggerd_handler_core^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/proto/libtombstone_proto^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/debuggerd/libtombstoned_client_static^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libprocinfo/libprocinfo^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_checker^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_dump^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_x86_64_static/ .

echo "building com.android.sysprop.init_sysprop_library^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja com.android.sysprop.init_sysprop_library,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/com.android.sysprop.init_sysprop_library^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/com.android.sysprop.init_sysprop_library^.output . $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/com.android.sysprop.init_sysprop_library^

echo "building libbatterymonitor^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbatterymonitor,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libbatterymonitor^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static

echo "building libbatterymonitor^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libbatterymonitor,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libbatterymonitor^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static

echo "building libcgrouprc^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_64_shared

echo "building libcgrouprc^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_vendor.31_x86_x86_64_shared

echo "building libcgrouprc^android_x86_64_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_x86_64_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_64_shared_29.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared_29

echo "building libcgrouprc^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared_current

echo "building libcgrouprc^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcgrouprc,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcgrouprc^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_x86_64_shared_current

echo "building libcharger_sysprop^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcharger_sysprop,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libcharger_sysprop^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcharger_sysprop^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libcharger_sysprop^android_recovery_x86_64_static

echo "building libcharger_sysprop^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcharger_sysprop,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libcharger_sysprop^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcharger_sysprop^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libcharger_sysprop^android_x86_64_static

echo "building libcom.android.sysprop.init^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcom.android.sysprop.init,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcom.android.sysprop.init^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_recovery_x86_64_static

echo "building libcom.android.sysprop.init^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libcom.android.sysprop.init,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libcom.android.sysprop.init^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_x86_64_static

echo "building libdebuggerd_handler_fallback^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_recovery_x86_64_static

echo "building libdebuggerd_handler_fallback^android_vendor_ramdisk_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_vendor_ramdisk_x86_64_static

echo "building libdebuggerd_handler_fallback^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static

echo "building libdebuggerd_handler_fallback^android_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_64_static_apex10000

echo "building libdebuggerd_handler_fallback^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static

echo "building libdebuggerd_handler_fallback^android_x86_x86_64_static_apex10000"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libdebuggerd_handler_fallback,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libdebuggerd_handler_fallback^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/libdebuggerd_handler_fallback^android_x86_x86_64_static_apex10000

echo "building libgrallocusage^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrallocusage,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libgrallocusage^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static

echo "building libgrallocusage^android_x86_64_static_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrallocusage,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libgrallocusage^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29

echo "building libgrallocusage^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libgrallocusage,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libgrallocusage^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static

echo "building libhealthd_charger_nops^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libhealthd_charger_nops,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libhealthd_charger_nops^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static

echo "building libhealthd_charger_nops^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libhealthd_charger_nops,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libhealthd_charger_nops^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static

echo "building liblp^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja liblp,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/liblp^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^linux_glibc_x86_64_shared

echo "building libprocessgroup^linux_glibc_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libprocessgroup,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libprocessgroup^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared

echo "building libsnapshot_init^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsnapshot_init,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsnapshot_init^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static

echo "building libsnapshot_init^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsnapshot_init,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsnapshot_init^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static

echo "building libsnapshot_nobinder^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsnapshot_nobinder,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsnapshot_nobinder^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static

echo "building libsync.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_26

echo "building libsync.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_27

echo "building libsync.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_28

echo "building libsync.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_29

echo "building libsync.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_30

echo "building libsync.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_31

echo "building libsync.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_REL

echo "building libsync.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_64_sdk_shared_current

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_26

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_27

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_28

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_29

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_30

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_31

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libsync.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync.ndk^android_x86_x86_64_sdk_shared_current

echo "building libsync^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_vendor.31_x86_64_shared

echo "building libsync^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_vendor.31_x86_x86_64_shared

echo "building libsync^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libsync,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libsync^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared_current

echo "building libvndksupport^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libvndksupport,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libvndksupport^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_64_shared

echo "building libvndksupport^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libvndksupport,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libvndksupport^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_x86_64_shared

echo "building libvndksupport^android_x86_64_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libvndksupport,android_x86_64_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libvndksupport^android_x86_64_shared_29.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_shared_29

echo "building libvndksupport^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libvndksupport,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libvndksupport^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_64_shared_current

echo "building libvndksupport^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libvndksupport,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/system/core/libvndksupport^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared_current

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
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi

rm -rf aosp
