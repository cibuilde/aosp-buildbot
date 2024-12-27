set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/lzma
clone_sparse prebuilts/build-tools linux-x86/bin linux-x86/lib64 path common
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtbegin_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/crtend_so^android_x86_x86_64_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_static_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_static_apex31/ .

echo "building liblzma^android_recovery_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_recovery_x86_64_shared

echo "building liblzma^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_vendor.31_x86_64_static

echo "building liblzma^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_vendor.31_x86_x86_64_static

echo "building liblzma^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_shared

echo "building liblzma^android_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_64_shared_apex31

echo "building liblzma^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_shared

echo "building liblzma^android_x86_x86_64_shared_apex31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja liblzma,android_x86_x86_64_shared_apex31
mkdir -p $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_shared_apex31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/external/lzma/liblzma^android_x86_x86_64_shared_apex31.output . $GITHUB_WORKSPACE/artifacts/external/lzma/C/liblzma^android_x86_x86_64_shared_apex31

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/lzma/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 external_lzma.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_lzma.tar.zst" ]; then
  echo "Compressing external/lzma -> external_lzma.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_lzma.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/lzma/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
