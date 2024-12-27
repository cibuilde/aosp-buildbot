set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/SdkExtensions

rsync -a -r $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/gen_sdk/extensions_db.pb^/ .

echo "building extensions_db^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja extensions_db,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/gen_sdk/extensions_db^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/packages/modules/SdkExtensions/extensions_db^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/gen_sdk/extensions_db^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/SdkExtensions/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 packages_modules_SdkExtensions.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst" ]; then
  echo "Compressing packages/modules/SdkExtensions -> packages_modules_SdkExtensions.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_SdkExtensions.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/SdkExtensions/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
