set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform external/e2fsprogs
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building libext2_blkid^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_blkid,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_blkid^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_recovery_x86_64_static

echo "building libext2_blkid^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_blkid,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_blkid^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_vendor_ramdisk_x86_64_static

echo "building libext2_blkid^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_blkid,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_blkid^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^android_x86_64_static

echo "building libext2_blkid^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_blkid,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_blkid^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_static

echo "building libext2_com_err^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_com_err,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_com_err^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_recovery_x86_64_static

echo "building libext2_com_err^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_com_err,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_com_err^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_vendor_ramdisk_x86_64_static

echo "building libext2_com_err^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_com_err,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_com_err^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^android_x86_64_static

echo "building libext2_com_err^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_com_err,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_com_err^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_static

echo "building libext2_e2p^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_e2p,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_e2p^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_recovery_x86_64_static

echo "building libext2_e2p^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_e2p,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_e2p^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_vendor_ramdisk_x86_64_static

echo "building libext2_e2p^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_e2p,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_e2p^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^android_x86_64_static

echo "building libext2_e2p^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_e2p,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_e2p^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_static

echo "building libext2_misc^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_misc,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_misc^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^android_recovery_x86_64_static

echo "building libext2_misc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_misc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_misc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^android_x86_64_static

echo "building libext2_misc^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_misc,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_misc^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/libext2_misc^linux_glibc_x86_64_static

echo "building libext2_quota^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_quota,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_quota^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_recovery_x86_64_static

echo "building libext2_quota^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_quota,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_quota^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_vendor_ramdisk_x86_64_static

echo "building libext2_quota^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_quota,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_quota^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^android_x86_64_static

echo "building libext2_quota^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_quota,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_quota^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/support/libext2_quota^linux_glibc_x86_64_static

echo "building libext2_uuid^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static

echo "building libext2_uuid^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_vendor_ramdisk_x86_64_static

echo "building libext2_uuid^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static

echo "building libext2_uuid^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static_apex10000

echo "building libext2_uuid^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_x86_64_static

echo "building libext2_uuid^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2_uuid,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2_uuid^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_static

echo "building libext2fs^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2fs,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2fs^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_recovery_x86_64_static

echo "building libext2fs^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2fs,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2fs^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_vendor_ramdisk_x86_64_static

echo "building libext2fs^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2fs,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2fs^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^android_x86_64_static

echo "building libext2fs^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libext2fs,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/e2fsprogs/libext2fs^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/ext2fs/libext2fs^linux_glibc_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_e2fsprogs.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.xz -C $GITHUB_WORKSPACE/aosp/external/e2fsprogs/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp