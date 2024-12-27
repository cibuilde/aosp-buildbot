set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_30_core-for-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_31_core-for-system-modules^android_common/ .

echo "building sdk_public_30_system_modules^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja sdk_public_30_system_modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_30_system_modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/prebuilts/sdk/sdk_public_30_system_modules^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_30_system_modules^android_common

echo "building sdk_public_31_system_modules^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja sdk_public_31_system_modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_31_system_modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/prebuilts/sdk/sdk_public_31_system_modules^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_31_system_modules^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
