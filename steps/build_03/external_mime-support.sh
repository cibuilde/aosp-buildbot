set -e

echo "entering external/mime-support"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/mime-support
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building debian.mime.types.minimized^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja debian.mime.types.minimized,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mime-support/debian.mime.types.minimized^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/mime-support/debian.mime.types.minimized^android_common.output . $GITHUB_WORKSPACE/artifacts/external/mime-support/debian.mime.types.minimized^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/mime-support/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_mime-support.tar.zst --clobber

du -ah -d1 external_mime-support*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_mime-support.tar.zst" ]; then
  echo "Compressing external/mime-support -> external_mime-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/mime-support/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp