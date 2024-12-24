set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/zxing

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building zxing-core-1.7^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja zxing-core-1.7,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/zxing/zxing-core-1.7^android_common.output . $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_zxing.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/zxing/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_zxing.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_zxing.tar.zst" ]; then
  echo "Compressing external/zxing -> external_zxing.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_zxing.tar.zst -C $GITHUB_WORKSPACE/aosp/external/zxing/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
