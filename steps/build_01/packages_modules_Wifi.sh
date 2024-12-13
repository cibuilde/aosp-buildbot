set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/Wifi

echo "building wifi.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja wifi.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/service/wifi.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/Wifi/wifi.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/service/wifi.rc^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Wifi.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Wifi/ .

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst" ]; then
  echo "Compressing packages/modules/Wifi -> packages_modules_Wifi.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Wifi.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/modules/Wifi/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
