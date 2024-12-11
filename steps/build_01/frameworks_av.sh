set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform art
clone_depth_platform bionic
clone_sparse cts libs/json
clone_depth_platform external/boringssl
clone_depth_platform external/compiler-rt
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/parameter-framework
clone_depth_platform external/sonivox
clone_depth_platform external/tinyxml2
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

echo "building codecs_g711dec^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja codecs_g711dec,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/g711/decoder/codecs_g711dec^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/codecs_g711dec^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/g711/decoder/codecs_g711dec^android_x86_64_static_cfi_apex29

echo "building com.android.media-mediatranscoding.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.media-mediatranscoding.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media-mediatranscoding.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/com.android.media-mediatranscoding.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media-mediatranscoding.rc^android_x86_64

echo "building com.android.media.swcodec-ld.config.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.media.swcodec-ld.config.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec-ld.config.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/com.android.media.swcodec-ld.config.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec-ld.config.txt^android_x86_64

echo "building com.android.media.swcodec-mediaswcodec.rc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.media.swcodec-mediaswcodec.rc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/com.android.media.swcodec-mediaswcodec.rc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media.swcodec-mediaswcodec.rc^android_x86_64

echo "building libAAudio_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libAAudio_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libAAudio_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libAAudio_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/libAAudio_headers^

echo "building libaudiopolicyengineconfigurable_pfwwrapper^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libaudiopolicyengineconfigurable_pfwwrapper,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_64_static

echo "building libaudiopolicyengineconfigurable_pfwwrapper^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libaudiopolicyengineconfigurable_pfwwrapper,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_x86_64_static

echo "building libcamera2ndk_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcamera2ndk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libcamera2ndk_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/ndk/libcamera2ndk_headers^

echo "building libcodec2^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcodec2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libcodec2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static

echo "building libcodec2^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcodec2,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libcodec2^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_64_static_apex29

echo "building libcodec2^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcodec2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libcodec2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_static

echo "building libcpustats^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libcpustats,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libcpustats/libcpustats^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libcpustats^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libcpustats/libcpustats^android_x86_64_static

echo "building libdrmutility^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdrmutility,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libdrmutility^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_64_static

echo "building libdrmutility^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libdrmutility,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libdrmutility^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_x86_64_static

echo "building libeffectsconfig^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libeffectsconfig,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libeffectsconfig^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_x86_64_static

echo "building libfwdlock-common^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_64_static

echo "building libfwdlock-common^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-common,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-common^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_x86_64_static

echo "building libfwdlock-converter^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-converter,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-converter^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_64_static

echo "building libfwdlock-converter^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-converter,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-converter^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_x86_64_static

echo "building libfwdlock-decoder^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-decoder,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-decoder^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_64_static

echo "building libfwdlock-decoder^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libfwdlock-decoder,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libfwdlock-decoder^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_x86_64_static

echo "building libmedia_helper^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_helper,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_helper^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_static

echo "building libmedia_helper^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_helper,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_helper^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_static

echo "building libmedia_midiiowrapper^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_midiiowrapper,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_midiiowrapper^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static

echo "building libmedia_midiiowrapper^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_midiiowrapper,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_midiiowrapper^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi

echo "building libmedia_midiiowrapper^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_midiiowrapper,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_midiiowrapper^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi_apex29

echo "building libmedia_midiiowrapper^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_midiiowrapper,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_midiiowrapper^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_x86_64_static

echo "building libmedia_midiiowrapper^android_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_midiiowrapper,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_midiiowrapper^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_x86_64_static_cfi

echo "building libmedia_ndkformatpriv^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_ndkformatpriv,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_ndkformatpriv^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_ndkformatpriv^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_ndkformatpriv^android_x86_64_static_cfi

echo "building libmedia_ndkformatpriv^android_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmedia_ndkformatpriv,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_ndkformatpriv^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmedia_ndkformatpriv^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_ndkformatpriv^android_x86_x86_64_static_cfi

echo "building libmediandk_format^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmediandk_format,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_format^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmediandk_format^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_format^android_x86_64_static_cfi

echo "building libmediandk_format^android_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmediandk_format,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_format^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmediandk_format^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_format^android_x86_x86_64_static_cfi

echo "building libmediandk_headers^"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libmediandk_headers,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_headers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libmediandk_headers^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_headers^

echo "building libregistermsext^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libregistermsext,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/mediaserver/libregistermsext^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libregistermsext^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/mediaserver/libregistermsext^android_x86_x86_64_static

echo "building libstagefright_amrnb_common^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnb_common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnb_common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static

echo "building libstagefright_amrnb_common^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnb_common,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnb_common^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_64_static_apex29

echo "building libstagefright_amrnb_common^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnb_common,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnb_common^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_x86_x86_64_static

echo "building libstagefright_amrnbdec^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbdec,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbdec^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_64_static

echo "building libstagefright_amrnbdec^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbdec,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbdec^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_64_static_cfi_apex29

echo "building libstagefright_amrnbdec^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbdec,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbdec^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_x86_x86_64_static

echo "building libstagefright_amrnbenc^android_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbenc,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbenc^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_64_static

echo "building libstagefright_amrnbenc^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbenc,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbenc^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_64_static_cfi_apex29

echo "building libstagefright_amrnbenc^android_x86_x86_64_static"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrnbenc,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrnbenc^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_x86_x86_64_static

echo "building libstagefright_amrwbdec^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrwbdec,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrwbdec^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_x86_64_static_cfi_apex29

echo "building libstagefright_amrwbenc^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_amrwbenc,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_amrwbenc^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_x86_64_static_cfi_apex29

echo "building libstagefright_enc_common^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_enc_common,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_enc_common^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_x86_64_static_apex29

echo "building libstagefright_esds^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_esds,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_esds^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_64_static_cfi

echo "building libstagefright_esds^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_esds,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_esds^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_64_static_cfi_apex29

echo "building libstagefright_esds^android_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_esds,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_esds^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_x86_64_static_cfi

echo "building libstagefright_flacdec^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_flacdec,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_flacdec^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_static_cfi_apex29

echo "building libstagefright_foundation^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_foundation,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_foundation^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi_apex29

echo "building libstagefright_foundation_colorutils_ndk^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_foundation_colorutils_ndk,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_foundation_colorutils_ndk^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk^android_x86_64_static_cfi_apex29

echo "building libstagefright_foundation_without_imemory^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_foundation_without_imemory,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_foundation_without_imemory^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory^android_x86_64_static_cfi_apex29

echo "building libstagefright_id3^android_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_id3,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_id3^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_64_static_cfi

echo "building libstagefright_id3^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_id3,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_id3^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_64_static_cfi_apex29

echo "building libstagefright_id3^android_x86_x86_64_static_cfi"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_id3,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_id3^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_x86_64_static_cfi

echo "building libstagefright_m4vh263dec^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_m4vh263dec,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_m4vh263dec^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_x86_64_static_apex29

echo "building libstagefright_m4vh263enc^android_x86_64_static_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_m4vh263enc,android_x86_64_static_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_x86_64_static_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_m4vh263enc^android_x86_64_static_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_x86_64_static_apex29

echo "building libstagefright_mp3dec^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libstagefright_mp3dec,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libstagefright_mp3dec^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_x86_64_static_cfi_apex29

echo "building libwatchdog^android_x86_64_static_cfi_apex29"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja libwatchdog,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libwatchdog/libwatchdog^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/libwatchdog^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libwatchdog/libwatchdog^android_x86_64_static_cfi_apex29

echo "building mediacodec.policy^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mediacodec.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediacodec.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/mediacodec.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediacodec.policy^android_x86_64

echo "building mediaextractor.policy^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mediaextractor.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaextractor/mediaextractor.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/mediaextractor.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaextractor/mediaextractor.policy^android_x86_64

echo "building mediaswcodec.policy^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mediaswcodec.policy,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec.policy^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/mediaswcodec.policy^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/mediaswcodec.policy^android_x86_64

echo "building mediaswcodec.xml^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mediaswcodec.xml,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/data/mediaswcodec.xml^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/av/mediaswcodec.xml^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/data/mediaswcodec.xml^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ frameworks_av.tar.xz -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.xz" ]; then
  echo "Compressing art -> art.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/art.tar.xz -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.xz" ]; then
  echo "Compressing bionic -> bionic.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/bionic.tar.xz -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.xz" ]; then
  echo "Compressing cts -> cts.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.xz -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.xz" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_boringssl.tar.xz -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.xz -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.xz" ]; then
  echo "Compressing external/flac -> external_flac.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_flac.tar.xz -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_fmtlib.tar.xz -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.xz" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxx.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.xz -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_parameter-framework.tar.xz" ]; then
  echo "Compressing external/parameter-framework -> external_parameter-framework.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_parameter-framework.tar.xz -C $GITHUB_WORKSPACE/aosp/external/parameter-framework/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sonivox.tar.xz" ]; then
  echo "Compressing external/sonivox -> external_sonivox.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_sonivox.tar.xz -C $GITHUB_WORKSPACE/aosp/external/sonivox/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.xz" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.xz -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.xz" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_av.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.xz" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/frameworks_native.tar.xz -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz" ]; then
  echo "Compressing hardware/libhardware -> hardware_libhardware.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz" ]; then
  echo "Compressing hardware/libhardware_legacy -> hardware_libhardware_legacy.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_libhardware_legacy.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/libhardware_legacy/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_ril.tar.xz" ]; then
  echo "Compressing hardware/ril -> hardware_ril.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/hardware_ril.tar.xz -C $GITHUB_WORKSPACE/aosp/hardware/ril/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz" ]; then
  echo "Compressing prebuilts/clang/host/linux-x86 -> prebuilts_clang_host_linux-x86.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_clang_host_linux-x86.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/clang/host/linux-x86/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.xz" ]; then
  echo "Compressing system/bt -> system_bt.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_bt.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.xz" ]; then
  echo "Compressing system/core -> system_core.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_core.tar.xz -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.xz" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_libbase.tar.xz -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.xz" ]; then
  echo "Compressing system/logging -> system_logging.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_logging.tar.xz -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.xz" ]; then
  echo "Compressing system/media -> system_media.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_media.tar.xz -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.xz" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/system_unwinding.tar.xz -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
