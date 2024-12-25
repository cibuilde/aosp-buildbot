set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/dagger2
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/dagger2/dagger2-bootstrap-compiler-jar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common/ .

echo "building dagger2-bootstrap-compiler^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja dagger2-bootstrap-compiler,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/dagger2/dagger2-bootstrap-compiler^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/dagger2/dagger2-bootstrap-compiler^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/dagger2/dagger2-bootstrap-compiler^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_dagger2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/dagger2/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_dagger2.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_dagger2.tar.zst" ]; then
  echo "Compressing external/dagger2 -> external_dagger2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_dagger2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/dagger2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
