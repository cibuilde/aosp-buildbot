set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth device/google/cuttlefish_prebuilts

echo "building cuttlefish_crosvm_bootloader^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja cuttlefish_crosvm_bootloader,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_prebuilts/cuttlefish_crosvm_bootloader^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ device_google_cuttlefish_prebuilts.tar.xz -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.xz -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi
rm -rf aosp