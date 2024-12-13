set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/providers/MediaProvider

echo "building preinstalled-packages-com.android.providers.media.module.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-com.android.providers.media.module.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_providers_MediaProvider.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst" ]; then
  echo "Compressing packages/providers/MediaProvider -> packages_providers_MediaProvider.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
