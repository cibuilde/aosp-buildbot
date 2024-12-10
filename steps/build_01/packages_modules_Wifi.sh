set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform packages/modules/Wifi

echo "building wifi.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja wifi.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/service/wifi.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Wifi/wifi.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/service/wifi.rc^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Wifi.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
rm -rf aosp