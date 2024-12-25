set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse prebuilts/jdk/jdk8 linux-x86
clone_depth_platform tools/apksig

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building apksig^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja apksig,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/apksig/apksig^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/tools/apksig/apksig^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/apksig/apksig^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ tools_apksig.tar.zst -C $GITHUB_WORKSPACE/artifacts/tools/apksig/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 tools_apksig.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk8 -> prebuilts_jdk_jdk8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apksig.tar.zst" ]; then
  echo "Compressing tools/apksig -> tools_apksig.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/tools_apksig.tar.zst -C $GITHUB_WORKSPACE/aosp/tools/apksig/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
