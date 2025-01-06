
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for external/e2fsprogs"

clone_depth_platform build/soong
clone_depth_platform external/boringssl
clone_depth_platform external/e2fsprogs
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/pcre
clone_depth_platform external/selinux
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/ext2fs/libext2fs^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/support/libext2_quota^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/e2fsprogs/misc/libext2_misc^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/selinux/libselinux/libselinux^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsparse/libsparse^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .

echo "building e2fsdroid^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja e2fsdroid,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/e2fsdroid^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/e2fsdroid^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/contrib/android/e2fsdroid^linux_glibc_x86_64/addition_copy_files.output

echo "building libext2_blkid^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext2_blkid,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_blkid^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_blkid^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/blkid/libext2_blkid^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libext2_e2p^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext2_e2p,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_e2p^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_e2p^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/e2p/libext2_e2p^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libext2_com_err^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext2_com_err,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_com_err^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_com_err^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/et/libext2_com_err^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building libext2_uuid^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libext2_uuid,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_uuid^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/libext2_uuid^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/lib/uuid/libext2_uuid^linux_glibc_x86_64_shared/addition_copy_files.output

echo "building mke2fs^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja mke2fs,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/mke2fs^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/mke2fs^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/misc/mke2fs^linux_glibc_x86_64/addition_copy_files.output

echo "building resize2fs^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja resize2fs,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/resize2fs^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/e2fsprogs/resize2fs^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/resize/resize2fs^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_e2fsprogs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/e2fsprogs/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_e2fsprogs.tar.zst --clobber

du -ah -d1 external_e2fsprogs*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pcre.tar.zst" ]; then
  echo "Compressing external/pcre -> external_pcre.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pcre.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pcre/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
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


rm -rf aosp
