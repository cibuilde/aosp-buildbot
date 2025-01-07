
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
clone_depth_platform external/libevent
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
clone_project platform/prebuilts/rust prebuilts/rust android12-gsi "/bootstrap" "/linux-x86/1.51.0"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/brotli/libbrotli^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/brotli/libbrotli^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libmojo_jni_registration_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libchrome/libchrome-include^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_recovery_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libevent/libevent^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/aho-corasick/libaho_corasick^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/copy_bindgen_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/bindgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bindgen/libbindgen^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/bitflags/libbitflags^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cexpr/libcexpr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/cfg-if/libcfg_if^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/copy_clang-sys_build_out^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clang-sys/libclang_sys^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/clap/libclap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/either/libeither^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/glob/libglob^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazy_static/liblazy_static^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/lazycell/liblazycell^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libc/liblibc^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/libloading/liblibloading^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/memchr/libmemchr^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/nom/libnom^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/peeking_take_while/libpeeking_take_while^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/proc-macro2/libproc_macro2^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/quote/libquote^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex-syntax/libregex_syntax^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/regex/libregex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/rustc-hash/librustc_hash^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/shlex/libshlex^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/textwrap/libtextwrap^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/unicode-xid/libunicode_xid^linux_glibc_x86_64_rlib_rlib-std/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rust/crates/which/libwhich^linux_glibc_x86_64_rlib_rlib-std/ .
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
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libfstab^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_cow^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/fs_mgr/libsnapshot/libsnapshot_snapuserd^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libasyncio/libasyncio^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libasyncio/libasyncio^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libasyncio/libasyncio^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils_sockets^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc_format/libcgrouprc_format^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/extras/ext4_utils/libext4_utils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/update_engine/update_metadata-protos^android_x86_64_static/ .

echo "building tombstoned^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja tombstoned,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/tombstoned^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/tombstoned^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/tombstoned^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/tombstoned^android_x86_64.output $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/tombstoned^android_x86_64 $GITHUB_WORKSPACE/artifacts/system/core/debuggerd/tombstoned^android_x86_64/addition_copy_files.output

echo "building libsnapshot_init^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsnapshot_init,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_init^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_init^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_recovery_x86_64_static/addition_copy_files.output

echo "building libsnapshot_init^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsnapshot_init,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_init^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_init^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_init^android_x86_64_static/addition_copy_files.output

echo "building libsnapshot_nobinder^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsnapshot_nobinder,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_nobinder^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsnapshot_nobinder^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libsnapshot/libsnapshot_nobinder^android_recovery_x86_64_static/addition_copy_files.output

echo "building libbatterymonitor^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbatterymonitor,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_recovery_x86_64_static/addition_copy_files.output

echo "building libbatterymonitor^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbatterymonitor,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libbatterymonitor^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbatterymonitor,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libbatterymonitor^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libbatterymonitor,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libbatterymonitor^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libbatterymonitor^android_x86_64_static/addition_copy_files.output

echo "building libhealthd_charger_nops^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libhealthd_charger_nops,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libhealthd_charger_nops^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libhealthd_charger_nops^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_recovery_x86_64_static/addition_copy_files.output

echo "building libhealthd_charger_nops^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libhealthd_charger_nops,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libhealthd_charger_nops^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libhealthd_charger_nops^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/healthd/libhealthd_charger_nops^android_x86_64_static/addition_copy_files.output

echo "building libasyncio^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libasyncio,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libasyncio^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libasyncio,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_64_shared/addition_copy_files.output

echo "building libasyncio^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libasyncio,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libasyncio^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libasyncio/libasyncio^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcrypto_utils^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcrypto_utils,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_recovery_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_recovery_x86_64_shared/addition_copy_files.output

echo "building libcrypto_utils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcrypto_utils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared/addition_copy_files.output

echo "building libcrypto_utils^android_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcrypto_utils,android_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_64_shared_apex10000/addition_copy_files.output

echo "building libcrypto_utils^android_x86_x86_64_shared_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcrypto_utils,android_x86_x86_64_shared_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_x86_64_shared_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcrypto_utils^android_x86_x86_64_shared_apex10000.output $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000 $GITHUB_WORKSPACE/artifacts/system/core/libcrypto_utils/libcrypto_utils^android_x86_x86_64_shared_apex10000/addition_copy_files.output

echo "building libcutils^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcutils,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcutils^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcutils^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libcutils_bindgen^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcutils_bindgen,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcutils_bindgen^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcutils_bindgen^android_x86_64_source.output $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_bindgen^android_x86_64_source/addition_copy_files.output

echo "building libgrallocusage^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgrallocusage,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libgrallocusage^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgrallocusage,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libgrallocusage^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgrallocusage,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static/addition_copy_files.output

echo "building libgrallocusage^android_x86_64_static_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgrallocusage,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_64_static_apex29.output $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29 $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_64_static_apex29/addition_copy_files.output

echo "building libgrallocusage^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libgrallocusage,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libgrallocusage^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/system/core/libgrallocusage/libgrallocusage^android_x86_x86_64_static/addition_copy_files.output

echo "building libprocessgroup^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libprocessgroup,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libprocessgroup^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libprocessgroup^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/libprocessgroup^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libcgrouprc^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libcgrouprc,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libcgrouprc^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libcgrouprc^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libprocessgroup/cgrouprc/libcgrouprc^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libsparse^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsparse,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsparse^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsparse^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsparse/libsparse^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libsync^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsync,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsync^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsync^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_64_shared/addition_copy_files.output

echo "building libsync^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja libsync,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/core/libsync^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_05/system/core/libsync^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/system/core/libsync/libsync^android_x86_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_core.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libevent.tar.zst" ]; then
  echo "Compressing external/libevent -> external_libevent.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libevent.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libevent/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst" ]; then
  echo "Compressing prebuilts/rust -> prebuilts_rust.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_rust.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/rust/ .
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
