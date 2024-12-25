set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/javaparser
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building javaparser^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja javaparser,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javaparser/javaparser^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/javaparser/javaparser^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/javaparser/javaparser^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_javaparser.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/javaparser/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_javaparser.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_javaparser.tar.zst" ]; then
  echo "Compressing external/javaparser -> external_javaparser.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_javaparser.tar.zst -C $GITHUB_WORKSPACE/aosp/external/javaparser/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
