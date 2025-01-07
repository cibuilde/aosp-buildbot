
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for packages/modules/Virtualization"

clone_depth device/google/cuttlefish
clone_project device/google/cuttlefish_prebuilts device/google/cuttlefish_prebuilts android12-gsi "/bootloader/crosvm_x86_64/u-boot.rom" "/uboot_tools/mkenvimage" "/scripts/extract-vmlinux" "/scripts/extract-ikconfig"
clone_depth_platform packages/modules/Virtualization

rsync -a -r $GITHUB_WORKSPACE/downloads/device/google/cuttlefish_prebuilts/bootloader/cuttlefish_crosvm_bootloader^android_x86_64/ .

echo "building microdroid_bootloader^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja microdroid_bootloader,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/packages/modules/Virtualization/microdroid_bootloader^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_02/packages/modules/Virtualization/microdroid_bootloader^android_x86_64.output $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64 $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_bootloader^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1 packages_modules_Virtualization*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish -> device_google_cuttlefish.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst" ]; then
  echo "Compressing device/google/cuttlefish_prebuilts -> device_google_cuttlefish_prebuilts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/device_google_cuttlefish_prebuilts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/device/google/cuttlefish_prebuilts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi


rm -rf aosp
