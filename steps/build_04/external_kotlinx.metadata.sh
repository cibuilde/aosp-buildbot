set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/kotlinx.metadata

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building kotlinx_metadata_jvm^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx_metadata_jvm,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/kotlinx.metadata/kotlinx_metadata_jvm^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/kotlinx.metadata/kotlinx_metadata_jvm^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/kotlinx.metadata/kotlinx_metadata_jvm^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_kotlinx.metadata.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/kotlinx.metadata/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_kotlinx.metadata.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinx.metadata.tar.zst" ]; then
  echo "Compressing external/kotlinx.metadata -> external_kotlinx.metadata.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinx.metadata.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinx.metadata/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
