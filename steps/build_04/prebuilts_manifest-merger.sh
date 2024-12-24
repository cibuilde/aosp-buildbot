set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform prebuilts/manifest-merger
clone_depth_platform tools/build

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building manifest-merger-jars^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja manifest-merger-jars,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_manifest-merger.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_manifest-merger.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst" ]; then
  echo "Compressing prebuilts/manifest-merger -> prebuilts_manifest-merger.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/manifest-merger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_build.tar.zst" ]; then
  echo "Compressing tools/build -> tools_build.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/tools_build.tar.zst -C $GITHUB_WORKSPACE/aosp/tools/build/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
