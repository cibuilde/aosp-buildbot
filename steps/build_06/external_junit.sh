set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/hamcrest
clone_depth_platform external/junit
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/hamcrest/hamcrest-core/hamcrest^linux_glibc_common/ .

echo "building junit^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja junit,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/junit/junit^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/junit/junit^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/junit/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_junit.tar.zst --clobber

du -ah -d1| sort -h

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
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp