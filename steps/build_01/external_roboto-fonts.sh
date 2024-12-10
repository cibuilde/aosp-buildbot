set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/roboto-fonts

echo "building Roboto-Regular.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja Roboto-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/roboto-fonts/Roboto-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/roboto-fonts/Roboto-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/roboto-fonts/Roboto-Regular.ttf^android_x86_64

echo "building RobotoStatic-Regular.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja RobotoStatic-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/roboto-fonts/RobotoStatic-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/roboto-fonts/RobotoStatic-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/roboto-fonts/RobotoStatic-Regular.ttf^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_roboto-fonts.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/roboto-fonts/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_roboto-fonts.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_roboto-fonts.tar.xz -C $GITHUB_WORKSPACE/aosp/external/roboto-fonts/ .
fi
rm -rf aosp