set -e

echo "entering external/google-fonts/carrois-gothic-sc"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-fonts/carrois-gothic-sc
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building CarroisGothicSC-Regular.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja CarroisGothicSC-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_google-fonts_carrois-gothic-sc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_google-fonts_carrois-gothic-sc.tar.zst --clobber

du -ah -d1 external_google-fonts_carrois-gothic-sc*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.zst" ]; then
  echo "Compressing external/google-fonts/carrois-gothic-sc -> external_google-fonts_carrois-gothic-sc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/google-fonts/carrois-gothic-sc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
