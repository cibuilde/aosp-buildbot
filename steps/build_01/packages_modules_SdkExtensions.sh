set -e

echo "entering packages/modules/SdkExtensions"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/SdkExtensions
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building derive_classpath.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_classpath.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_classpath.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64

echo "building derive_sdk.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_sdk.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_sdk.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 packages_modules_SdkExtensions.tar.zst --clobber

du -ah -d1 packages_modules_SdkExtensions*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst" ]; then
  echo "Compressing packages/modules/SdkExtensions -> packages_modules_SdkExtensions.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
