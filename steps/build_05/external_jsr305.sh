set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/jsr305
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building jsr305^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja jsr305,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jsr305/jsr305^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/jsr305/jsr305^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jsr305/jsr305^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_jsr305.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/jsr305/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_jsr305.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsr305.tar.zst" ]; then
  echo "Compressing external/jsr305 -> external_jsr305.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsr305.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsr305/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
