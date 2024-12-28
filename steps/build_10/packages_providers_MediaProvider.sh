set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/auto
clone_depth_platform external/error_prone
clone_depth_platform packages/providers/MediaProvider
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/error_prone/error_prone_core^linux_glibc_common/ .

echo "building error_prone_mediaprovider_lib^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja error_prone_mediaprovider_lib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/errorprone/error_prone_mediaprovider_lib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/packages/providers/MediaProvider/error_prone_mediaprovider_lib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/errorprone/error_prone_mediaprovider_lib^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/providers/MediaProvider/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 packages_providers_MediaProvider.tar.zst --clobber

du -ah -d1 packages_providers_MediaProvider*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_error_prone.tar.zst" ]; then
  echo "Compressing external/error_prone -> external_error_prone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_error_prone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/error_prone/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst" ]; then
  echo "Compressing packages/providers/MediaProvider -> packages_providers_MediaProvider.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_providers_MediaProvider.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/providers/MediaProvider/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
