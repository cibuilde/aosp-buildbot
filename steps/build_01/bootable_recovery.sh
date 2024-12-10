set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth_platform external/boringssl
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libdrm
clone_depth_platform external/libpng
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building init_recovery.rc^android_recovery_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja init_recovery.rc,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/init_recovery.rc^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64

echo "building libbootloader_message^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static

echo "building libbootloader_message^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static

echo "building libbootloader_message_vendor^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message_vendor,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message_vendor^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static

echo "building libfusesideload^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfusesideload,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libfusesideload^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static

echo "building libotautil^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libotautil,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static

echo "building libotautil^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libotautil,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static

echo "building librecovery_fastboot^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_fastboot,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static

echo "building librecovery_ui^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_ui,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static

echo "building librecovery_ui_default^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_ui_default,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui_default^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ bootable_recovery.tar.xz -C $GITHUB_WORKSPACE/artifacts/bootable/recovery/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bootable_recovery.tar.xz -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libdrm.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libdrm.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libdrm/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libpng.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_selinux.tar.xz -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
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