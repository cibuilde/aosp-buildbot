set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform packages/providers/MediaProvider

echo "building preinstalled-packages-com.android.providers.media.module.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-com.android.providers.media.module.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_providers_MediaProvider.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi
rm -rf aosp