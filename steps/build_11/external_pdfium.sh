set -e

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
clone_depth_platform external/freetype
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libjpeg-turbo
clone_depth_platform external/pdfium
clone_depth_platform external/zlib
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/freetype/libft2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/freetype/libft2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libicu/libicu^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/libjpeg^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libjpeg-turbo/libjpeg^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-agg^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-agg^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxge/libpdfium-fxge^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fxge/libpdfium-fxge^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fxjs/libpdfium-fxjs^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fxjs/libpdfium-fxjs^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-lcms2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-lcms2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-skia_shared^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-skia_shared^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-third_party-base^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/pdfium/third_party/libpdfium-third_party-base^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_x86_64_shared/ .

echo "building libpdfium^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libpdfium,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/libpdfium^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/external/pdfium/libpdfium^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/libpdfium^android_x86_64_shared

echo "building libpdfium^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libpdfium,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/libpdfium^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/external/pdfium/libpdfium^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/libpdfium^android_x86_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_pdfium.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/pdfium/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 external_pdfium.tar.zst --clobber

du -ah -d1 external_pdfium*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.zst" ]; then
  echo "Compressing external/freetype -> external_freetype.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_freetype.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst" ]; then
  echo "Compressing external/libjpeg-turbo -> external_libjpeg-turbo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libjpeg-turbo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pdfium.tar.zst" ]; then
  echo "Compressing external/pdfium -> external_pdfium.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pdfium.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pdfium/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
