set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

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
clone_sparse prebuilts/clang/host/linux-x86 clang-r416183b1 clang-r416183b soong
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/core
clone_depth_platform system/logging
clone_depth_platform system/media

echo "building libpdfium-agg^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-agg,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-agg^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_64_static

echo "building libpdfium-agg^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-agg,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-agg^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-agg^android_x86_x86_64_static

echo "building libpdfium-cmaps^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-cmaps,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-cmaps^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_64_static

echo "building libpdfium-cmaps^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-cmaps,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-cmaps^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/cmaps/libpdfium-cmaps^android_x86_x86_64_static

echo "building libpdfium-edit^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-edit,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-edit^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_64_static

echo "building libpdfium-edit^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-edit,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-edit^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/edit/libpdfium-edit^android_x86_x86_64_static

echo "building libpdfium-fdrm^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fdrm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fdrm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_64_static

echo "building libpdfium-fdrm^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fdrm,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fdrm^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fdrm/libpdfium-fdrm^android_x86_x86_64_static

echo "building libpdfium-font^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-font,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-font^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_64_static

echo "building libpdfium-font^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-font,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-font^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/font/libpdfium-font^android_x86_x86_64_static

echo "building libpdfium-formfiller^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-formfiller,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-formfiller^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_64_static

echo "building libpdfium-formfiller^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-formfiller,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-formfiller^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/formfiller/libpdfium-formfiller^android_x86_x86_64_static

echo "building libpdfium-fpdfdoc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfdoc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdfdoc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_64_static

echo "building libpdfium-fpdfdoc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfdoc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdfdoc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfdoc/libpdfium-fpdfdoc^android_x86_x86_64_static

echo "building libpdfium-fpdfsdk^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfsdk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdfsdk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_64_static

echo "building libpdfium-fpdfsdk^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdfsdk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdfsdk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/libpdfium-fpdfsdk^android_x86_x86_64_static

echo "building libpdfium-fpdftext^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdftext,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdftext^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_64_static

echo "building libpdfium-fpdftext^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fpdftext,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fpdftext^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdftext/libpdfium-fpdftext^android_x86_x86_64_static

echo "building libpdfium-fxcodec^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcodec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxcodec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_64_static

echo "building libpdfium-fxcodec^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcodec,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxcodec^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcodec/libpdfium-fxcodec^android_x86_x86_64_static

echo "building libpdfium-fxcrt^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcrt,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxcrt^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_64_static

echo "building libpdfium-fxcrt^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxcrt,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxcrt^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxcrt/libpdfium-fxcrt^android_x86_x86_64_static

echo "building libpdfium-fxge^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxge,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxge^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_64_static

echo "building libpdfium-fxge^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxge,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxge^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fxge/libpdfium-fxge^android_x86_x86_64_static

echo "building libpdfium-fxjs^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxjs,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxjs^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_64_static

echo "building libpdfium-fxjs^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-fxjs,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-fxjs^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fxjs/libpdfium-fxjs^android_x86_x86_64_static

echo "building libpdfium-lcms2^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-lcms2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-lcms2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_64_static

echo "building libpdfium-lcms2^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-lcms2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-lcms2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-lcms2^android_x86_x86_64_static

echo "building libpdfium-libopenjpeg2^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-libopenjpeg2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-libopenjpeg2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_64_static

echo "building libpdfium-libopenjpeg2^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-libopenjpeg2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-libopenjpeg2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-libopenjpeg2^android_x86_x86_64_static

echo "building libpdfium-page^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-page,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-page^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_64_static

echo "building libpdfium-page^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-page,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-page^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/page/libpdfium-page^android_x86_x86_64_static

echo "building libpdfium-parser^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-parser,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-parser^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_64_static

echo "building libpdfium-parser^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-parser,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-parser^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/parser/libpdfium-parser^android_x86_x86_64_static

echo "building libpdfium-pwl^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-pwl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-pwl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_64_static

echo "building libpdfium-pwl^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-pwl,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-pwl^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/fpdfsdk/pwl/libpdfium-pwl^android_x86_x86_64_static

echo "building libpdfium-render^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-render,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-render^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_64_static

echo "building libpdfium-render^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-render,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-render^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/core/fpdfapi/render/libpdfium-render^android_x86_x86_64_static

echo "building libpdfium-skia_shared^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-skia_shared,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-skia_shared^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_64_static

echo "building libpdfium-skia_shared^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-skia_shared,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-skia_shared^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-skia_shared^android_x86_x86_64_static

echo "building libpdfium-third_party-base^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-third_party-base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-third_party-base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_64_static

echo "building libpdfium-third_party-base^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libpdfium-third_party-base,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/pdfium/libpdfium-third_party-base^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/external/pdfium/third_party/libpdfium-third_party-base^android_x86_x86_64_static

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_pdfium.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/pdfium/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_freetype.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_freetype.tar.xz -C $GITHUB_WORKSPACE/aosp/external/freetype/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_icu.tar.xz -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_libjpeg-turbo.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libjpeg-turbo/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pdfium.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_pdfium.tar.xz -C $GITHUB_WORKSPACE/aosp/external/pdfium/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_zlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
rm -rf aosp