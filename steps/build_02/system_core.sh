set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform external/avb
clone_depth_platform external/boringssl
clone_depth_platform external/compiler-rt
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/selinux
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_sparse_exclude system/extras "!/simpleperf/scripts" "!/simpleperf/testdata" "!/simpleperf/demo" "!/simpleperf/doc" "!/memory_replay/traces" "!/ioshark/*.tgz" "!/ioshark/*.tar.gz"
clone_depth_platform system/gsid
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/vold

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_vendor_ramdisk_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^android_x86_x86_64_static_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils_sockets^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libdm/libdm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfstab^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/extras/libfscrypt/libfscrypt^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/system/logging/logwrapper/liblogwrap^android_x86_64_static/ .

echo "building libcutils^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_recovery_x86_64_static

echo "building libcutils^android_vendor_ramdisk_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_vendor_ramdisk_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor_ramdisk_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_vendor_ramdisk_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_vendor_ramdisk_x86_64_static

echo "building libcutils^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static

echo "building libcutils^android_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex10000

echo "building libcutils^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex29

echo "building libcutils^android_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_apex30

echo "building libcutils^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_64_static_cfi_apex29

echo "building libcutils^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static

echo "building libcutils^android_x86_x86_64_static_apex10000"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_x86_64_static_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_x86_64_static_apex10000.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex10000

echo "building libcutils^android_x86_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex29

echo "building libcutils^android_x86_x86_64_static_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,android_x86_x86_64_static_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^android_x86_x86_64_static_apex30.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^android_x86_x86_64_static_apex30

echo "building libcutils^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libcutils,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libcutils^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/libcutils/libcutils^linux_glibc_x86_64_static

echo "building libfs_mgr^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libfs_mgr,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libfs_mgr^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_recovery_x86_64_static

echo "building libfs_mgr^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libfs_mgr,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/core/libfs_mgr^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/core/fs_mgr/libfs_mgr^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/core/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 system_core.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_avb.tar.zst" ]; then
  echo "Compressing external/avb -> external_avb.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_avb.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/avb/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst" ]; then
  echo "Compressing external/e2fsprogs -> external_e2fsprogs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_e2fsprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/e2fsprogs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_selinux.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_vold.tar.zst" ]; then
  echo "Compressing system/vold -> system_vold.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_vold.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/vold/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
