
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

echo "Preparing for external/libopus"

clone_depth_platform external/libcxx
clone_depth_platform external/libopus
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libopus/libopus^linux_glibc_x86_64_static/ .

echo "building libopus^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja libopus,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libopus/libopus^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/libopus/libopus^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/libopus/libopus^linux_glibc_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/libopus/libopus^linux_glibc_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/external/libopus/libopus^linux_glibc_x86_64_shared $GITHUB_WORKSPACE/artifacts/external/libopus/libopus^linux_glibc_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libopus/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_libopus.tar.zst --clobber

du -ah -d1 external_libopus*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi


rm -rf aosp
