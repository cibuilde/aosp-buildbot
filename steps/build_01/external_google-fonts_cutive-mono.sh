set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/google-fonts/cutive-mono

echo "building CutiveMono.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja CutiveMono.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_cutive-mono.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_cutive-mono.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_cutive-mono.tar.xz -C $GITHUB_WORKSPACE/aosp/external/google-fonts/cutive-mono/ .
fi
rm -rf aosp