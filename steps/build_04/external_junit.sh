
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

echo "Preparing for external/junit"

clone_depth_platform external/hamcrest
clone_depth_platform external/junit
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/hamcrest/hamcrest-core/hamcrest^linux_glibc_common/ .

echo "building junit^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja junit,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/junit/junit^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/junit/junit^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/junit/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_junit.tar.zst --clobber

du -ah -d1 external_junit*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_hamcrest.tar.zst" ]; then
  echo "Compressing external/hamcrest -> external_hamcrest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_hamcrest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/hamcrest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_junit.tar.zst" ]; then
  echo "Compressing external/junit -> external_junit.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/junit/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
