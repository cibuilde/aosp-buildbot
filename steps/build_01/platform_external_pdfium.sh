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
clone_depth_platform external/freetype
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libjpeg-turbo
clone_depth_platform external/pdfium
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform platform/external/pdfium
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media


echo "building libpdfium-third_party-base^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-third_party-base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-third_party-base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_x86_64_static

echo "building libpdfium-third_party-base^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-third_party-base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-third_party-base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_64_static

echo "building libpdfium-skia_shared^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-skia_shared,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-skia_shared^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_x86_64_static

echo "building libpdfium-skia_shared^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-skia_shared,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-skia_shared^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_64_static

echo "building libpdfium-render^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-render,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-render^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_x86_64_static

echo "building libpdfium-render^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-render,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-render^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_64_static

echo "building libpdfium-pwl^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-pwl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-pwl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_x86_64_static

echo "building libpdfium-pwl^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-pwl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-pwl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_64_static

echo "building libpdfium-parser^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-parser,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-parser^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_x86_64_static

echo "building libpdfium-parser^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-parser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-parser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_64_static

echo "building libpdfium-page^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-page,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-page^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_x86_64_static

echo "building libpdfium-page^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-page,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-page^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_64_static

echo "building libpdfium-libopenjpeg2^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-libopenjpeg2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-libopenjpeg2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_x86_64_static

echo "building libpdfium-libopenjpeg2^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-libopenjpeg2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-libopenjpeg2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_64_static

echo "building libpdfium-lcms2^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-lcms2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-lcms2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_x86_64_static

echo "building libpdfium-lcms2^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-lcms2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-lcms2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_64_static

echo "building libpdfium-fxjs^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxjs,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxjs^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_x86_64_static

echo "building libpdfium-fxjs^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxjs,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxjs^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_64_static

echo "building libpdfium-fxge^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxge,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxge^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_x86_64_static

echo "building libpdfium-fxge^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxge,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxge^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_64_static

echo "building libpdfium-fxcrt^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcrt,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxcrt^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_x86_64_static

echo "building libpdfium-fxcrt^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcrt,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxcrt^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_64_static

echo "building libpdfium-fxcodec^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcodec,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxcodec^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_x86_64_static

echo "building libpdfium-fxcodec^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcodec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fxcodec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_64_static

echo "building libpdfium-fpdftext^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdftext,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdftext^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_x86_64_static

echo "building libpdfium-fpdftext^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdftext,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdftext^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_64_static

echo "building libpdfium-fpdfsdk^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfsdk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdfsdk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_x86_64_static

echo "building libpdfium-fpdfsdk^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfsdk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdfsdk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_64_static

echo "building libpdfium-fpdfdoc^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfdoc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdfdoc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_x86_64_static

echo "building libpdfium-fpdfdoc^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfdoc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fpdfdoc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_64_static

echo "building libpdfium-formfiller^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-formfiller,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-formfiller^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_x86_64_static

echo "building libpdfium-formfiller^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-formfiller,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-formfiller^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_64_static

echo "building libpdfium-font^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-font,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-font^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_x86_64_static

echo "building libpdfium-font^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-font,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-font^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_64_static

echo "building libpdfium-fdrm^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fdrm,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fdrm^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_x86_64_static

echo "building libpdfium-fdrm^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fdrm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-fdrm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_64_static

echo "building libpdfium-edit^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-edit,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-edit^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_x86_64_static

echo "building libpdfium-edit^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-edit,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-edit^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_64_static

echo "building libpdfium-cmaps^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-cmaps,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-cmaps^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_x86_64_static

echo "building libpdfium-cmaps^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-cmaps,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-cmaps^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_64_static

echo "building libpdfium-agg^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-agg,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-agg^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_x86_64_static

echo "building libpdfium-agg^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-agg,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/platform/external/pdfium/libpdfium-agg^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_pdfium.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/pdfium/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 platform_external_pdfium.tar.zst --clobber

du -ah -d1 platform_external_pdfium*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.zst" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_ril.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_pdfium.tar.zst" ]; then
  echo "Compressing platform/external/pdfium -> platform_external_pdfium.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_pdfium.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/pdfium/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi

rm -rf aosp
