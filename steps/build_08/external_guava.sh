set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/guava

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guava/guava-android-host^linux_glibc_common/ .

echo "building guava^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja guava,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/guava/guava^android_common.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common

echo "building guava^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja guava,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/guava/guava^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/guava/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_guava.tar.zst --clobber

du -ah -d1 external_guava*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi

rm -rf aosp
