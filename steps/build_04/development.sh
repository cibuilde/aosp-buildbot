set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform development

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building platform_tools_version^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja platform_tools_version,
mkdir -p $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/development/platform_tools_version^.output . $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ development.tar.zst -C $GITHUB_WORKSPACE/artifacts/development/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 development.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/development.tar.zst" ]; then
  echo "Compressing development -> development.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/development.tar.zst -C $GITHUB_WORKSPACE/aosp/development/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp