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

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv^android_vendor.31_x86_x86_64_static/ .

echo "building libyuv_static^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libyuv_static,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/libyuv/libyuv_static^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_vendor.31_x86_64_static

echo "building libyuv_static^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libyuv_static,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/external/libyuv/libyuv_static^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/libyuv/files/libyuv_static^android_vendor.31_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/libyuv/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 external_libyuv.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
