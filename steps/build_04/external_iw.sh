set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/iw

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building iw_version^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja iw_version,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/iw/iw_version^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/iw/iw_version^.output . $GITHUB_WORKSPACE/artifacts/external/iw/iw_version^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_iw.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/iw/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_iw.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_iw.tar.zst" ]; then
  echo "Compressing external/iw -> external_iw.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_iw.tar.zst -C $GITHUB_WORKSPACE/aosp/external/iw/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
