set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-fonts/carrois-gothic-sc

echo "building CarroisGothicSC-Regular.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja CarroisGothicSC-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_carrois-gothic-sc.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.zst" ]; then
  echo "Compressing external/google-fonts/carrois-gothic-sc -> external_google-fonts_carrois-gothic-sc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.zst -C $GITHUB_WORKSPACE/aosp/external/google-fonts/carrois-gothic-sc/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
