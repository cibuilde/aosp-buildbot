set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/neven

echo "building RFFspeed_501.bmd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFspeed_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFspeed_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64

echo "building RFFstd_501.bmd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFstd_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFstd_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_neven.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/neven/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_neven.tar.zst" ]; then
  echo "Compressing external/neven -> external_neven.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_neven.tar.zst -C $GITHUB_WORKSPACE/aosp/external/neven/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
