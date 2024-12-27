set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/auto
clone_depth_platform external/guava
clone_depth_platform external/javapoet
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/javapoet/javapoet^linux_glibc_common/ .

echo "building auto_common^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja auto_common,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/common/auto_common^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/auto/auto_common^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/common/auto_common^linux_glibc_common

echo "building auto_value_extension^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja auto_value_extension,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_extension^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/auto/auto_value_extension^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_extension^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/auto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_auto.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javapoet.tar.zst" ]; then
  echo "Compressing external/javapoet -> external_javapoet.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javapoet.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javapoet/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
