set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform external/google-fonts/carrois-gothic-sc

echo "building CarroisGothicSC-Regular.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja CarroisGothicSC-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/CarroisGothicSC-Regular.ttf^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_carrois-gothic-sc.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/carrois-gothic-sc/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_carrois-gothic-sc.tar.xz -C $GITHUB_WORKSPACE/aosp/external/google-fonts/carrois-gothic-sc/ .
fi
rm -rf aosp