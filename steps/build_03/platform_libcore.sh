set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform libcore
clone_depth_platform platform/libcore

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building notices-for-stubs-jar^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja notices-for-stubs-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/libcore/notices-for-stubs-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/notices-for-stubs-jar^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_libcore.tar.zst --clobber

du -ah -d1 platform_libcore*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_libcore.tar.zst" ]; then
  echo "Compressing platform/libcore -> platform_libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/libcore/ .
fi

rm -rf aosp
