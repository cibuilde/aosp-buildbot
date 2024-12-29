set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/mime-support
clone_depth_platform platform/external/mime-support

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building debian.mime.types.minimized^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja debian.mime.types.minimized,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mime-support/debian.mime.types.minimized^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/external/mime-support/debian.mime.types.minimized^android_common.output . $GITHUB_WORKSPACE/artifacts/external/mime-support/debian.mime.types.minimized^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/mime-support/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_external_mime-support.tar.zst --clobber

du -ah -d1 platform_external_mime-support*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_mime-support.tar.zst" ]; then
  echo "Compressing external/mime-support -> external_mime-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/mime-support/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_mime-support.tar.zst" ]; then
  echo "Compressing platform/external/mime-support -> platform_external_mime-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/mime-support/ .
fi

rm -rf aosp
