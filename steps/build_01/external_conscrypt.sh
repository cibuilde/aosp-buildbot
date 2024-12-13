set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/conscrypt

echo "building com.android.conscrypt.ld.config.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.conscrypt.ld.config.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/conscrypt/com.android.conscrypt.ld.config.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
