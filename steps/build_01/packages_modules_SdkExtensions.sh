set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/SdkExtensions

echo "building derive_classpath.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_classpath.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_classpath.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64

echo "building derive_sdk.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_sdk.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_sdk.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_SdkExtensions.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.xz" ]; then
  echo "Compressing packages/modules/SdkExtensions -> packages_modules_SdkExtensions.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
