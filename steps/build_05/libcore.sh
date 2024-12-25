set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform libcore

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building notices-for-stubs-jar^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja notices-for-stubs-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/libcore/notices-for-stubs-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ libcore.tar.zst -C $GITHUB_WORKSPACE/artifacts/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 libcore.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/libcore.tar.zst -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
