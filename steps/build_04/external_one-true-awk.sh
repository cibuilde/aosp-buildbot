set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/one-true-awk
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/python/linux-x86/2.7.5

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building awkgram.tab.c^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja awkgram.tab.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/one-true-awk/awkgram.tab.c^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.c^

echo "building awkgram.tab.h^"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja awkgram.tab.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/one-true-awk/awkgram.tab.h^.output . $GITHUB_WORKSPACE/artifacts/external/one-true-awk/awkgram.tab.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_one-true-awk.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/one-true-awk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_one-true-awk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst" ]; then
  echo "Compressing external/one-true-awk -> external_one-true-awk.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_one-true-awk.tar.zst -C $GITHUB_WORKSPACE/aosp/external/one-true-awk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst" ]; then
  echo "Compressing prebuilts/python/linux-x86/2.7.5 -> prebuilts_python_linux-x86_2.7.5.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_python_linux-x86_2.7.5.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/python/linux-x86/2.7.5/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
