set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform frameworks/ex
clone_depth_platform platform/frameworks/ex


echo "building sample_camera_extensions.xml^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja sample_camera_extensions.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/frameworks/ex/sample_camera_extensions.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/ex/camera2/extensions/sample/sample_camera_extensions.xml^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_frameworks_ex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/frameworks/ex/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_frameworks_ex.tar.zst --clobber

du -ah -d1 platform_frameworks_ex*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst" ]; then
  echo "Compressing frameworks/ex -> frameworks_ex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_ex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/ex/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_frameworks_ex.tar.zst" ]; then
  echo "Compressing platform/frameworks/ex -> platform_frameworks_ex.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_frameworks_ex.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/frameworks/ex/ .
fi

rm -rf aosp
