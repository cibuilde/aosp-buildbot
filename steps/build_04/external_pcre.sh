set -e

echo "entering external/pcre"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_depth_platform external/pcre
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_recovery_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_recovery_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pcre/libpcre2^android_recovery_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pcre/libpcre2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pcre/libpcre2^android_x86_x86_64_static/ .

echo "building libpcre2^android_recovery_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_recovery_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_recovery_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_recovery_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_recovery_x86_64_shared

echo "building libpcre2^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_64_shared

echo "building libpcre2^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_64_static

echo "building libpcre2^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_x86_64_shared

echo "building libpcre2^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_vendor.31_x86_x86_64_static

echo "building libpcre2^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_x86_64_shared

echo "building libpcre2^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libpcre2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/pcre/libpcre2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pcre/libpcre2^android_x86_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_pcre.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/pcre/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_pcre.tar.zst --clobber

du -ah -d1 external_pcre*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pcre.tar.zst" ]; then
  echo "Compressing external/pcre -> external_pcre.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pcre.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pcre/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi

rm -rf aosp
