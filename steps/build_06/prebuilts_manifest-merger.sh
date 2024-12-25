set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform prebuilts/manifest-merger

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_common/ .

echo "building manifest-merger^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja manifest-merger,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 prebuilts_manifest-merger.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst" ]; then
  echo "Compressing prebuilts/manifest-merger -> prebuilts_manifest-merger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/manifest-merger/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
