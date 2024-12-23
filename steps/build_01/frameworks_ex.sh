set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform frameworks/ex


echo "building sample_camera_extensions.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja sample_camera_extensions.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/ex/sample_camera_extensions.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_ex.tar.zst -C $GITHUB_WORKSPACE/artifacts/frameworks/ex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 frameworks_ex.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst" ]; then
  echo "Compressing frameworks/ex -> frameworks_ex.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst -C $GITHUB_WORKSPACE/aosp/frameworks/ex/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
