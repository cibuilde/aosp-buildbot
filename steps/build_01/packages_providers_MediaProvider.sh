set -e

echo "entering packages/providers/MediaProvider"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform packages/providers/MediaProvider
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building preinstalled-packages-com.android.providers.media.module.xml^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja preinstalled-packages-com.android.providers.media.module.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/preinstalled-packages-com.android.providers.media.module.xml^android_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_providers_MediaProvider.tar.zst --clobber

du -ah -d1 packages_providers_MediaProvider*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst" ]; then
  echo "Compressing packages/providers/MediaProvider -> packages_providers_MediaProvider.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
