set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/selinux
clone_depth_platform external/tinyxml2
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform packages/modules/Gki
clone_sparse prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 sysroot lib/gcc/x86_64-linux/4.8.3 x86_64-linux/lib64 x86_64-linux/lib32
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libvintf
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/tools/hidl

rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/libkver/libkver^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/libkver/libkver^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/libkver/libkver^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/Gki/libkver/libkver^linux_glibc_x86_64_static/ .
echo "building libvintf^android_recovery_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libvintf,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/libvintf/libvintf^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_recovery_x86_64_static

echo "building libvintf^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libvintf,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/libvintf/libvintf^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_x86_64_static

echo "building libvintf^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libvintf,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/libvintf/libvintf^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^android_x86_x86_64_static

echo "building libvintf^linux_glibc_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja libvintf,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/system/libvintf/libvintf^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/libvintf/libvintf^linux_glibc_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_libvintf.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/libvintf/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 system_libvintf.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.zst -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_selinux.tar.zst" ]; then
  echo "Compressing external/selinux -> external_selinux.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_selinux.tar.zst -C $GITHUB_WORKSPACE/aosp/external/selinux/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.zst" ]; then
  echo "Compressing packages/modules/Gki -> packages_modules_Gki.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Gki.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/modules/Gki/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.zst -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libvintf.tar.zst" ]; then
  echo "Compressing system/libvintf -> system_libvintf.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libvintf.tar.zst -C $GITHUB_WORKSPACE/aosp/system/libvintf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.zst -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.zst -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst" ]; then
  echo "Compressing system/tools/hidl -> system_tools_hidl.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_hidl.tar.zst -C $GITHUB_WORKSPACE/aosp/system/tools/hidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp