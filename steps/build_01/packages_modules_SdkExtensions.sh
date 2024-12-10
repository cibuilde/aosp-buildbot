set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_depth_platform packages/modules/SdkExtensions

echo "building derive_classpath.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_classpath.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_classpath.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_classpath/derive_classpath.rc^android_x86_64

echo "building derive_sdk.rc^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja derive_sdk.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/packages/modules/SdkExtensions/derive_sdk.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/derive_sdk/derive_sdk.rc^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ packages_modules_SdkExtensions.tar.xz -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.xz -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi
rm -rf aosp