set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth device/google/cuttlefish
clone_depth device/google/cuttlefish_prebuilts

echo "building cuttlefish_crosvm_bootloader^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja cuttlefish_crosvm_bootloader,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_prebuilts/cuttlefish_crosvm_bootloader^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ device_google_cuttlefish_prebuilts.tar.zst -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_prebuilts -> device_google_cuttlefish_prebuilts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
