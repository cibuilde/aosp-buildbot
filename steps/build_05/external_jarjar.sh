set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/jarjar
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common/ .

echo "building jarjar^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja jarjar,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/jarjar/jarjar^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/jarjar/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_jarjar.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_jarjar.tar.zst" ]; then
  echo "Compressing external/jarjar -> external_jarjar.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jarjar/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp