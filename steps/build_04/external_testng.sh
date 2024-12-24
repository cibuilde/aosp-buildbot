set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/testng
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building testng-generated-srcs^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja testng-generated-srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/testng/testng-generated-srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/testng/testng-generated-srcs^.output . $GITHUB_WORKSPACE/artifacts/external/testng/testng-generated-srcs^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_testng.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/testng/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_testng.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_testng.tar.zst" ]; then
  echo "Compressing external/testng -> external_testng.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_testng.tar.zst -C $GITHUB_WORKSPACE/aosp/external/testng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
