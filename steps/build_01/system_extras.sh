set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform bionic
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/squashfs-tools
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building checkpoint_gc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja checkpoint_gc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/checkpoint_gc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/checkpoint_gc/checkpoint_gc^android_x86_64

echo "building cppreopts.sh^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja cppreopts.sh,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/cppreopts.sh^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/cppreopts.sh^android_x86_64

echo "building fstab.postinstall^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja fstab.postinstall,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/fstab.postinstall^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/fstab.postinstall^android_x86_64

echo "building libext4_utils^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_recovery_x86_64_static

echo "building libext4_utils^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^android_x86_64_static

echo "building libext4_utils^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_64_static

echo "building libext4_utils^linux_glibc_x86_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext4_utils,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libext4_utils^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/libext4_utils^linux_glibc_x86_static

echo "building libfec^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_recovery_x86_64_static

echo "building libfec^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^android_x86_64_static

echo "building libfec^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_64_static

echo "building libfec^linux_glibc_x86_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfec,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfec^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfec/libfec^linux_glibc_x86_static

echo "building libfscrypt^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfscrypt,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static

echo "building libfscrypt^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfscrypt,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libfscrypt^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static

echo "building libjsonpbparse^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libjsonpbparse,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libjsonpbparse^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/libjsonpb/parse/libjsonpbparse^android_x86_64_static

echo "building libnativehelper_ndk_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libnativehelper_ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libnativehelper_ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/libnativehelper_ndk_headers^

echo "building libsquashfs_utils^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_recovery_x86_64_static

echo "building libsquashfs_utils^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^android_x86_64_static

echo "building libsquashfs_utils^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_64_static

echo "building libsquashfs_utils^linux_glibc_x86_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libsquashfs_utils,linux_glibc_x86_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libsquashfs_utils^linux_glibc_x86_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/squashfs_utils/libsquashfs_utils^linux_glibc_x86_static

echo "building libverity_tree^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libverity_tree,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_recovery_x86_64_static

echo "building libverity_tree^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libverity_tree,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/libverity_tree^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/extras/verity/libverity_tree^android_x86_64_static

echo "building mke2fs.conf^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mke2fs.conf,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_recovery_x86_64

echo "building mke2fs.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mke2fs.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/mke2fs.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/ext4_utils/mke2fs.conf^android_x86_64

echo "building ndk_jni.h^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ndk_jni.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/ndk_jni.h^.output . $GITHUB_WORKSPACE/artifacts/system/extras/module_ndk_libs/libnativehelper/ndk_jni.h^

echo "building preloads_copy.sh^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preloads_copy.sh,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/extras/preloads_copy.sh^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/extras/cppreopts/preloads_copy.sh^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_extras.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/extras/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.xz -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_protobuf.tar.xz -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_squashfs-tools.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_squashfs-tools.tar.xz -C $GITHUB_WORKSPACE/aosp/external/squashfs-tools/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/libnativehelper.tar.xz -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_extras.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_extras.tar.xz -C $GITHUB_WORKSPACE/aosp/system/extras/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp