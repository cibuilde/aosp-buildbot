
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

echo "Preparing for bootable/recovery"

clone_depth_platform bionic
clone_depth_platform bootable/recovery
clone_depth_platform external/boringssl
clone_depth_platform external/bsdiff
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libdivsufsort
clone_depth_platform external/libdrm
clone_depth_platform external/libpng
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding


echo "building init_recovery.rc^android_recovery_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja init_recovery.rc,android_recovery_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/init_recovery.rc^android_recovery_x86_64.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/init_recovery.rc^android_recovery_x86_64.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64 $GITHUB_WORKSPACE/artifacts/bootable/recovery/init_recovery.rc^android_recovery_x86_64/addition_copy_files.output

echo "building librecovery_fastboot^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_fastboot,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/librecovery_fastboot^android_recovery_x86_64_static/addition_copy_files.output

echo "building libimgdiff^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libimgdiff,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/applypatch/libimgdiff^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libimgdiff^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/applypatch/libimgdiff^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libimgdiff^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/applypatch/libimgdiff^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/applypatch/libimgdiff^linux_glibc_x86_64_static/addition_copy_files.output

echo "building libbootloader_message^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_recovery_x86_64_static/addition_copy_files.output

echo "building libbootloader_message^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message^android_x86_64_static/addition_copy_files.output

echo "building libbootloader_message_vendor^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libbootloader_message_vendor,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message_vendor^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libbootloader_message_vendor^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/bootloader_message/libbootloader_message_vendor^android_recovery_x86_64_static/addition_copy_files.output

echo "building libfusesideload^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libfusesideload,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libfusesideload^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libfusesideload^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/fuse_sideload/libfusesideload^android_recovery_x86_64_static/addition_copy_files.output

echo "building libminui^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libminui,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/minui/libminui^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libminui^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/minui/libminui^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libminui^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/minui/libminui^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/minui/libminui^android_x86_x86_64_static/addition_copy_files.output

echo "building libotautil^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libotautil,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_recovery_x86_64_static/addition_copy_files.output

echo "building libotautil^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libotautil,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^android_x86_64_static/addition_copy_files.output

echo "building libotautil^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libotautil,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^linux_glibc_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/libotautil^linux_glibc_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^linux_glibc_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/otautil/libotautil^linux_glibc_x86_64_static/addition_copy_files.output

echo "building librecovery_ui^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_ui,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui^android_recovery_x86_64_static/addition_copy_files.output

echo "building librecovery_ui_default^android_recovery_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja librecovery_ui_default,android_recovery_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui_default^android_recovery_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/bootable/recovery/librecovery_ui_default^android_recovery_x86_64_static.output $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static $GITHUB_WORKSPACE/artifacts/bootable/recovery/recovery_ui/librecovery_ui_default^android_recovery_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/bootable/recovery/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 bootable_recovery.tar.zst --clobber

du -ah -d1 bootable_recovery*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst" ]; then
  echo "Compressing bootable/recovery -> bootable_recovery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bootable_recovery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bootable/recovery/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_bsdiff.tar.zst" ]; then
  echo "Compressing external/bsdiff -> external_bsdiff.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bsdiff.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bsdiff/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libdivsufsort.tar.zst" ]; then
  echo "Compressing external/libdivsufsort -> external_libdivsufsort.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libdivsufsort.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libdivsufsort/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libdrm.tar.zst" ]; then
  echo "Compressing external/libdrm -> external_libdrm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libdrm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libdrm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
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


rm -rf aosp
