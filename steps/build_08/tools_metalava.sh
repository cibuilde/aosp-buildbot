set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform tools/metalava

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_common/ .

echo "building metalava^linux_glibc_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja metalava,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/tools/metalava/metalava^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_x86_64

echo "building private-stub-annotations^"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja private-stub-annotations,
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/metalava/private-stub-annotations^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/tools/metalava/private-stub-annotations^.output . $GITHUB_WORKSPACE/artifacts/tools/metalava/private-stub-annotations^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/metalava/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 tools_metalava.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_metalava.tar.zst" ]; then
  echo "Compressing tools/metalava -> tools_metalava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/metalava/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
