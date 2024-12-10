set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/neven

echo "building RFFspeed_501.bmd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFspeed_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFspeed_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFspeed_501.bmd^android_x86_64

echo "building RFFstd_501.bmd^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja RFFstd_501.bmd,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/neven/RFFstd_501.bmd^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/neven/RFFstd_501.bmd^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_neven.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/neven/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_neven.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_neven.tar.xz -C $GITHUB_WORKSPACE/aosp/external/neven/ .
fi
rm -rf aosp