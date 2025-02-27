
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

echo "Preparing for external/one-true-awk"

clone_depth_platform external/one-true-awk
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building awkgram.tab.c^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja awkgram.tab.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awkgram.tab.c^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awkgram.tab.c^.output $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^ $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^/addition_copy_files.output

echo "building awkgram.tab.h^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja awkgram.tab.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awkgram.tab.h^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awkgram.tab.h^.output $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^ $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^/addition_copy_files.output

echo "building proctab.c^"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja proctab.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/proctab.c^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/proctab.c^.output $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^ $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^/addition_copy_files.output

echo "building awk-maketab^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja awk-maketab,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awk-maketab^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awk-maketab^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awk-maketab^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/one-true-awk/awk-maketab^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awk-maketab^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awk-maketab^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_one-true-awk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_one-true-awk.tar.zst --clobber

du -ah -d1 external_one-true-awk*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst" ]; then
  echo "Compressing external/one-true-awk -> external_one-true-awk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/one-true-awk/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi


rm -rf aosp
