set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/libyuv

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^android_x86_x86_64_static_cfi/ .

echo "building libyuv_static^android_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja libyuv_static,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/libyuv/libyuv_static^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_64_static_cfi

echo "building libyuv_static^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja libyuv_static,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/libyuv/libyuv_static^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_64_static_cfi_apex29

echo "building libyuv_static^android_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_02.ninja libyuv_static,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_02/external/libyuv/libyuv_static^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_x86_x86_64_static_cfi

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libyuv/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_02 external_libyuv.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
