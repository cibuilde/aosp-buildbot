set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth device/google/cuttlefish
clone_depth device/google/cuttlefish_prebuilts
clone_depth_platform packages/modules/Virtualization

rsync -a -r $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64/ .
echo "building microdroid_bootloader^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_02.ninja microdroid_bootloader,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/packages/modules/Virtualization/microdroid_bootloader^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_prebuilts -> device_google_cuttlefish_prebuilts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
