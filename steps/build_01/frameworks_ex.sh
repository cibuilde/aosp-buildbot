set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform frameworks/ex

echo "building sample_camera_extensions.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja sample_camera_extensions.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/ex/sample_camera_extensions.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_ex.tar.xz -C $GITHUB_WORKSPACE/artifacts/frameworks/ex/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_ex.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_ex.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/ex/ .
fi
rm -rf aosp