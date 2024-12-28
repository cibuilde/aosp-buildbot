set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/providers/MediaProvider


echo "building preinstalled-packages-com.android.providers.media.module.xml^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-com.android.providers.media.module.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_providers_MediaProvider.tar.zst --clobber

du -ah -d1 packages_providers_MediaProvider*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst" ]; then
  echo "Compressing packages/providers/MediaProvider -> packages_providers_MediaProvider.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi

rm -rf aosp
