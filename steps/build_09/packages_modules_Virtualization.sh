set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/Virtualization
clone_depth_platform system/sepolicy

rsync -a -r $GITHUB_WORKSPACE/artifacts/system/sepolicy/plat_sepolicy_and_mapping.sha256_gen^/ .

echo "building microdroid_precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja microdroid_precompiled_sepolicy.plat_sepolicy_and_mapping.sha256,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/Virtualization/microdroid_precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/microdroid/microdroid_precompiled_sepolicy.plat_sepolicy_and_mapping.sha256^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Virtualization/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 packages_modules_Virtualization.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst" ]; then
  echo "Compressing packages/modules/Virtualization -> packages_modules_Virtualization.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Virtualization.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Virtualization/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst" ]; then
  echo "Compressing system/sepolicy -> system_sepolicy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_sepolicy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/sepolicy/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp