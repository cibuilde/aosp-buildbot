set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
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
clone_depth_platform external/fec
clone_depth_platform external/fmtlib
clone_depth_platform external/gflags
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcap
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libdrm
clone_depth_platform external/libpng
clone_depth_platform external/libxml2
clone_depth_platform external/lzma
clone_depth_platform external/pcre
clone_depth_platform external/protobuf
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_sparse prebuilts/rust bootstrap linux-x86/1.51.0
clone_depth_platform system/apex
clone_depth_platform system/bt
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
clone_depth_platform system/tools/mkbootimg
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_static^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_vendor_ramdisk_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_product.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/avb/libavb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/boringssl/libcrypto_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/brotli/libbrotli^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/brotli/libbrotli^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/brotli/libbrotli^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/fec/libfec_rs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gflags/libgflags^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gflags/libgflags^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/gflags/libgflags^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcap/libcap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcap/libcap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++_static^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++_static^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++fs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/protobuf/libprotobuf-cpp-lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/selinux/libselinux/libselinux^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/zlib/libz^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/allocator/2.0/android.hardware.graphics.allocator@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/graphics/mapper/2.0/android.hardware.graphics.mapper@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/1.0/android.hardware.health@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.0/android.hardware.health@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/hardware/interfaces/health/2.1/android.hardware.health@2.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexd/apex-info-list^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/proto/lib_apex_manifest_proto_lite^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/proto/lib_apex_manifest_proto_lite^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/apex/apexd/sysprop/libcom.android.sysprop.apex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/healthd/libcharger_sysprop^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/init/sysprop/libcom.android.sysprop.init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_avb/libfs_avb^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/liblp/liblp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/gsid/libgsi^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/libprocinfo/libprocinfo^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/unwinding/libbacktrace/libbacktrace_no_dex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/unwinding/libunwindstack/libunwindstack_no_dex^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/update_engine/update_metadata-protos^android_x86_64_static/ .

echo "building init_first_stage_soong^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja init_first_stage_soong,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/init_first_stage_soong^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/init/init_first_stage_soong^android_x86_64

echo "building libbatterymonitor^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterymonitor,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libbatterymonitor^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static

echo "building libbatterymonitor^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbatterymonitor,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libbatterymonitor^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static

echo "building libcrypto_utils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcrypto_utils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcrypto_utils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_64_static

echo "building libcrypto_utils^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcrypto_utils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcrypto_utils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_vendor.31_x86_x86_64_static

echo "building libcutils_bindgen^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcutils_bindgen,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcutils_bindgen^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source

echo "building libcutils_sockets^android_product.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcutils_sockets,android_product.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_product.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcutils_sockets^android_product.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_product.31_x86_64_static

echo "building libcutils_sockets^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcutils_sockets,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcutils_sockets^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_64_static

echo "building libcutils_sockets^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcutils_sockets,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libcutils_sockets^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor.31_x86_x86_64_static

echo "building libdiskconfig^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdiskconfig,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libdiskconfig^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_64_static

echo "building libdiskconfig^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdiskconfig,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libdiskconfig^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libdiskconfig/libdiskconfig^android_vendor.31_x86_x86_64_static

echo "building libfstab^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libfstab,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libfstab^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_vendor.31_x86_64_static

echo "building libfstab^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libfstab,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libfstab^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_vendor.31_x86_x86_64_static

echo "building libgrallocusage^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgrallocusage,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libgrallocusage^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static

echo "building libgrallocusage^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libgrallocusage,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libgrallocusage^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static

echo "building libhealthd_charger^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealthd_charger,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libhealthd_charger^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger^android_x86_64_static

echo "building libhealthd_draw^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libhealthd_draw,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_draw^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libhealthd_draw^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_draw^android_x86_64_static

echo "building libinit^android_recovery_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinit,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libinit^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_recovery_x86_64_static

echo "building libinit^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libinit,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libinit^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/init/libinit^android_x86_64_static

echo "building libkeyutils^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libkeyutils,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libkeyutils^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_recovery_x86_64_shared

echo "building libkeyutils^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libkeyutils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libkeyutils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libkeyutils/libkeyutils^android_x86_64_shared

echo "building libmodprobe^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmodprobe,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libmodprobe^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libmodprobe/libmodprobe^android_vendor.31_x86_64_static

echo "building libprocessgroup^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libprocessgroup,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libprocessgroup^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_64_static

echo "building libprocessgroup^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libprocessgroup,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libprocessgroup^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^android_vendor.31_x86_x86_64_static

echo "building libsysutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libsysutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libsysutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_64_static

echo "building libsysutils^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libsysutils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libsysutils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libsysutils/libsysutils^android_vendor.31_x86_x86_64_static

echo "building libusbhost^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libusbhost,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libusbhost^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_vendor.31_x86_64_static

echo "building libusbhost^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libusbhost,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libusbhost^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libusbhost/libusbhost^android_vendor.31_x86_x86_64_static

echo "building libutils^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libutils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libutils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_64_static

echo "building libutils^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libutils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libutils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutils^android_vendor.31_x86_x86_64_static

echo "building libutilscallstack^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libutilscallstack,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libutilscallstack^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_vendor.31_x86_64_static

echo "building libutilscallstack^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libutilscallstack,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/libutilscallstack^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libutils/libutilscallstack^android_vendor.31_x86_x86_64_static

echo "building snapuserd^android_recovery_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja snapuserd,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/snapuserd^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_recovery_x86_64

echo "building snapuserd^android_vendor_ramdisk_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja snapuserd,android_vendor_ramdisk_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_vendor_ramdisk_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/snapuserd^android_vendor_ramdisk_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_vendor_ramdisk_x86_64

echo "building snapuserd^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja snapuserd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/snapuserd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/snapuserd^android_x86_64

echo "building system_linker_config^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja system_linker_config,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/rootdir/system_linker_config^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/core/system_linker_config^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/rootdir/system_linker_config^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_core.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_gflags.tar.zst" ]; then
  echo "Compressing external/gflags -> external_gflags.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_gflags.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/gflags/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libdrm.tar.zst" ]; then
  echo "Compressing external/libdrm -> external_libdrm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libdrm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libdrm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
