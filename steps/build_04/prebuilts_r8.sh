set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform prebuilts/r8

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building r8^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja r8,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/r8/r8^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_r8.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_r8.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst" ]; then
  echo "Compressing prebuilts/r8 -> prebuilts_r8.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/r8/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
