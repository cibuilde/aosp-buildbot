set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/conscrypt

echo "building com.android.conscrypt.ld.config.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.conscrypt.ld.config.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/conscrypt/com.android.conscrypt.ld.config.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_conscrypt.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .

du -ah -d1

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.xz" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_conscrypt.tar.xz -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
