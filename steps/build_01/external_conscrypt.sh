set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/conscrypt

echo "building com.android.conscrypt.ld.config.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.conscrypt.ld.config.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/conscrypt/com.android.conscrypt.ld.config.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/apex/com.android.conscrypt.ld.config.txt^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_conscrypt.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_conscrypt.tar.xz -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi
rm -rf aosp