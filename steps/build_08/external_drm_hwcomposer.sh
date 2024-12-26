set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/drm_hwcomposer
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .

echo "building libdrmhwc_utils^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libdrmhwc_utils,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_64_static

echo "building libdrmhwc_utils^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libdrmhwc_utils,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/drm_hwcomposer/libdrmhwc_utils^android_vendor.31_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_drm_hwcomposer.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/drm_hwcomposer/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_drm_hwcomposer.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_drm_hwcomposer.tar.zst" ]; then
  echo "Compressing external/drm_hwcomposer -> external_drm_hwcomposer.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_drm_hwcomposer.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/drm_hwcomposer/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
