
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

echo "Preparing for packages/modules/SdkExtensions"

clone_depth_platform packages/modules/SdkExtensions

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30/ .

echo "building framework-sdkextensions^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja framework-sdkextensions,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/packages/modules/SdkExtensions/framework-sdkextensions^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/packages/modules/SdkExtensions/framework-sdkextensions^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30 $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/framework/framework-sdkextensions^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 packages_modules_SdkExtensions.tar.zst --clobber

du -ah -d1 packages_modules_SdkExtensions*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst" ]; then
  echo "Compressing packages/modules/SdkExtensions -> packages_modules_SdkExtensions.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi


rm -rf aosp
