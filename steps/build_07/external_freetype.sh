set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform build/soong
clone_depth_platform external/freetype
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/artifacts/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building libft2^android_vendor.31_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libft2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/freetype/libft2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/freetype/libft2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/freetype/libft2^android_vendor.31_x86_64_shared

echo "building libft2^android_vendor.31_x86_x86_64_shared"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja libft2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/freetype/libft2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/freetype/libft2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/freetype/libft2^android_vendor.31_x86_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_freetype.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/freetype/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_freetype.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.zst" ]; then
  echo "Compressing external/freetype -> external_freetype.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_freetype.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
