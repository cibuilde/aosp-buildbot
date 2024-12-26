set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/one-true-awk

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awk-maketab^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^/ .

echo "building proctab.c^"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja proctab.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/one-true-awk/proctab.c^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/proctab.c^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_one-true-awk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_one-true-awk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst" ]; then
  echo "Compressing external/one-true-awk -> external_one-true-awk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/one-true-awk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
