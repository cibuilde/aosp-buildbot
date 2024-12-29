set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/testng
clone_depth_platform platform/external/testng

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building testng-generated-srcs^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja testng-generated-srcs,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/testng/testng-generated-srcs^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/external/testng/testng-generated-srcs^.output . $GITHUB_WORKSPACE/artifacts/external/testng/testng-generated-srcs^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/testng/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_external_testng.tar.zst --clobber

du -ah -d1 platform_external_testng*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_testng.tar.zst" ]; then
  echo "Compressing external/testng -> external_testng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/testng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_testng.tar.zst" ]; then
  echo "Compressing platform/external/testng -> platform_external_testng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/testng/ .
fi

rm -rf aosp
