set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth device/google/cuttlefish
clone_project device/google/cuttlefish_prebuilts device/google/cuttlefish_prebuilts android12-gsi "/bootloader/crosvm_x86_64/u-boot.rom" "/uboot_tools/mkenvimage"


echo "building cuttlefish_crosvm_bootloader^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja cuttlefish_crosvm_bootloader,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/device/google/cuttlefish_prebuilts/cuttlefish_crosvm_bootloader^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf device_google_cuttlefish_prebuilts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/device/google/cuttlefish_prebuilts/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 device_google_cuttlefish_prebuilts.tar.zst --clobber

du -ah -d1 device_google_cuttlefish_prebuilts*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_prebuilts -> device_google_cuttlefish_prebuilts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi

rm -rf aosp
