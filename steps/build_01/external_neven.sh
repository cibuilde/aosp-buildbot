set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/neven


echo "building RFFspeed_501.bmd^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFspeed_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFspeed_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64

echo "building RFFstd_501.bmd^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFstd_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFstd_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_neven.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/neven/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_neven.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_neven.tar.zst" ]; then
  echo "Compressing external/neven -> external_neven.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_neven.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/neven/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
