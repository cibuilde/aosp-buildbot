set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/google-fonts/dancing-script

echo "building DancingScript-Bold.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja DancingScript-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64

echo "building DancingScript-Regular.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja DancingScript-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_dancing-script.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_dancing-script.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_dancing-script.tar.xz -C $GITHUB_WORKSPACE/aosp/external/google-fonts/dancing-script/ .
fi
rm -rf aosp