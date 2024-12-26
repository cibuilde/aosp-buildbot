set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform external/compiler-rt
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .

echo "building libaudioutils_fixedfft^android_vendor.31_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudioutils_fixedfft,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/media/libaudioutils_fixedfft^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_64_static

echo "building libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudioutils_fixedfft,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/media/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static

echo "building libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudioutils_fixedfft,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/system/media/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/system/media/audio_utils/libaudioutils_fixedfft^android_vendor.31_x86_x86_64_static_cfi

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/media/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 system_media.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
