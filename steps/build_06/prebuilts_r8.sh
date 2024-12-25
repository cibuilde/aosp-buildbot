set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform prebuilts/r8

rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_common/ .

echo "building d8^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja d8,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/r8/d8^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64

echo "building r8-compat-proguard^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja r8-compat-proguard,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_r8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 prebuilts_r8.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst" ]; then
  echo "Compressing prebuilts/r8 -> prebuilts_r8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/r8/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
