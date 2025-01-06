
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/av"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/boringssl
clone_depth_platform external/clang
clone_depth_platform external/compiler-rt
clone_depth_platform external/expat
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libogg
clone_depth_platform external/libvpx
clone_depth_platform external/libxml2
clone_depth_platform external/libyuv
clone_depth_platform external/parameter-framework
clone_depth_platform external/protobuf
clone_depth_platform external/sonic
clone_depth_platform external/sonivox
clone_depth_platform external/tremolo
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/rs
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libmemunreachable
clone_depth_platform system/netd
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flac/src/libFLAC/libFLAC^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libvpx/libwebm/libwebm^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libxml2/libxml2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/parameter-framework/libparameter^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/parameter-framework/libparameter^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/parameter-framework/libpfw_utility^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/parameter-framework/libpfw_utility^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sonivox/arm-wt-22k/libsonivoxwithoutjet^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tremolo/libvorbisidec^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/libcamera_client^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrmmetrics_full^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libmediadrm/libmediadrmmetrics_lite^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudiopolicy^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/config/libeffectsconfig^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_1/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_1/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/libstatslog_media^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/statslog_media.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnblog/libnblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_esds^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_x86_64_shared_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_without_imemory^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation_colorutils_ndk^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/id3/libstagefright_id3^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libwatchdog/libwatchdog^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/ndk/libmediandk^android_x86_x86_64_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/engineconfigurable/wrapper/libaudiopolicyengineconfigurable_pfwwrapper^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_static_com.android.media/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/native/android/libandroid^android_x86_64_shared_31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/compile/slang/llvm-rs-cc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libactivitymanager_aidl^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/ndk/libbinder_ndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/sensorprivacy/libsensorprivacy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv1_CM^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libGLESv2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/powermanager/libpowermanager^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.0/android.hardware.drm@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.1/android.hardware.drm@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.2/android.hardware.drm@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.3/android.hardware.drm@1.3_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/drm/1.4/android.hardware.drm@1.4_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware_legacy/libhardware_legacy^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/StatsD/lib/libstatssocket/libstatssocket^android_x86_64_shared_30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/libprocessgroup^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libprocessgroup/cgrouprc/libcgrouprc^android_x86_64_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libsync/libsync^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_64_shared_29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/utils/libhidlallocatorutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/android.hidl.token@1.0^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/android.hidl.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libfifo^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_static_cfi_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/camera/libcamera_metadata^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/camera/libcamera_metadata^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .

echo "building libcamera_client^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcamera_client,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcamera_client^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcamera_client^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_64_shared/addition_copy_files.output

echo "building libcamera_client^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcamera_client,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcamera_client^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcamera_client^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/camera/libcamera_client^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmediadrmmetrics_consumer^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrmmetrics_consumer,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrmmetrics_consumer^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrmmetrics_consumer^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_64_shared/addition_copy_files.output

echo "building libmediadrmmetrics_consumer^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrmmetrics_consumer,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrmmetrics_consumer^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrmmetrics_consumer^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrmmetrics_consumer^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmediadrm^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrm,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_shared/addition_copy_files.output

echo "building libmediadrm^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrm,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_64_static/addition_copy_files.output

echo "building libmediadrm^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrm,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmediadrm^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediadrm,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediadrm^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libmediadrm/libmediadrm^android_x86_x86_64_static/addition_copy_files.output

echo "building audioserver^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja audioserver,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/audioserver/audioserver^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/audioserver^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/audioserver/audioserver^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/audioserver^android_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/audioserver/audioserver^android_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/audioserver/audioserver^android_x86_64/addition_copy_files.output

echo "building libcodec2_hidl_client@1.0^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.0,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.0^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.0,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_64_static/addition_copy_files.output

echo "building libcodec2_hidl_client@1.0^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.0,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.0^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.0,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.0^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl_client@1.0^android_x86_x86_64_static/addition_copy_files.output

echo "building libcodec2_hidl_client@1.1^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.1,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.1^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.1,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_64_static/addition_copy_files.output

echo "building libcodec2_hidl_client@1.1^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.1,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.1^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.1,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.1^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl_client@1.1^android_x86_x86_64_static/addition_copy_files.output

echo "building libcodec2_hidl_client@1.2^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.2,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.2^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.2,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_64_static/addition_copy_files.output

echo "building libcodec2_hidl_client@1.2^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.2,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_hidl_client@1.2^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_hidl_client@1.2,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_hidl_client@1.2^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl_client@1.2^android_x86_x86_64_static/addition_copy_files.output

echo "building libcodec2_client^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_client,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2_client^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_client,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_64_static/addition_copy_files.output

echo "building libcodec2_client^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_client,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_shared/addition_copy_files.output

echo "building libcodec2_client^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libcodec2_client,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libcodec2_client^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/client/libcodec2_client^android_x86_x86_64_static/addition_copy_files.output

echo "building libsfplugin_ccodec^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libsfplugin_ccodec,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libsfplugin_ccodec^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libsfplugin_ccodec^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libsfplugin_ccodec^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libsfplugin_ccodec,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libsfplugin_ccodec^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libsfplugin_ccodec^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/libsfplugin_ccodec^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libaacextractor^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaacextractor,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaacextractor^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaacextractor^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building libaacextractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaacextractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaacextractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaacextractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/aac/libaacextractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libamrextractor^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libamrextractor,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libamrextractor^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libamrextractor^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libamrextractor^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libamrextractor,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libamrextractor^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libamrextractor^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/amr/libamrextractor^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libflacextractor^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libflacextractor,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libflacextractor^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libflacextractor^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building libflacextractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libflacextractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libflacextractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libflacextractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/flac/libflacextractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libmidiextractor^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmidiextractor,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmidiextractor^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmidiextractor^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmidiextractor^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmidiextractor,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmidiextractor^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmidiextractor^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/midi/libmidiextractor^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libmkvextractor^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmkvextractor,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmkvextractor^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmkvextractor^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building libmkvextractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmkvextractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmkvextractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmkvextractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mkv/libmkvextractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libmp3extractor^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmp3extractor,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp3extractor^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp3extractor^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmp3extractor^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmp3extractor,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp3extractor^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp3extractor^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp3/libmp3extractor^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libmp4extractor^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmp4extractor,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp4extractor^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp4extractor^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmp4extractor^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmp4extractor,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp4extractor^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmp4extractor^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mp4/libmp4extractor^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libmpeg2extractor^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmpeg2extractor,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building libmpeg2extractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmpeg2extractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmpeg2extractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmpeg2extractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/mpeg2/libmpeg2extractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building liboggextractor^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja liboggextractor,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/liboggextractor^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/liboggextractor^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building liboggextractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja liboggextractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/liboggextractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/liboggextractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/ogg/liboggextractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libwavextractor^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libwavextractor,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libwavextractor^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libwavextractor^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libwavextractor^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libwavextractor,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libwavextractor^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libwavextractor^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/extractors/wav/libwavextractor^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libheif^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libheif,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libheif^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libheif^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_64_shared/addition_copy_files.output

echo "building libheif^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libheif,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libheif^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libheif^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libheif/libheif^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmedia_omx_client^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia_omx_client,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia_omx_client^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia_omx_client^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia_omx_client^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia_omx_client,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia_omx_client^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia_omx_client^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx_client^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi/addition_copy_files.output

echo "building libmedia^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmedia,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmedia^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libmediaformatshaper^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediaformatshaper,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmediaformatshaper^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediaformatshaper,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediaformatshaper,android_x86_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmediaformatshaper^android_x86_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediaformatshaper,android_x86_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaformatshaper/libmediaformatshaper^android_x86_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libmediaplayerservice^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediaplayerservice,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaplayerservice^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediaplayerservice^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/libmediaplayerservice^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_nuplayer^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_nuplayer,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_nuplayer^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_nuplayer^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/nuplayer/libstagefright_nuplayer^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libmediatranscoding^android_x86_64_shared_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscoding,android_x86_64_shared_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoding^android_x86_64_shared_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoding^android_x86_64_shared_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_shared_cfi_com.android.media/addition_copy_files.output

echo "building libmediatranscoding^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscoding,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoding^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoding^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libmediatranscoding^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libmediatranscoder^android_x86_64_shared_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscoder,android_x86_64_shared_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoder^android_x86_64_shared_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoder^android_x86_64_shared_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_shared_cfi_apex29/addition_copy_files.output

echo "building libmediatranscoder^android_x86_64_static_cfi_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscoder,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoder^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_static_cfi_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscoder^android_x86_64_static_cfi_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_static_cfi_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/transcoder/libmediatranscoder^android_x86_64_static_cfi_apex29/addition_copy_files.output

echo "building libstagefright_codecbase^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_codecbase,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_codecbase^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_codecbase^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_codecbase^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_codecbase,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_codecbase^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_codecbase^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_codecbase^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_framecapture_utils^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_framecapture_utils,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_framecapture_utils^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_framecapture_utils^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_64_shared/addition_copy_files.output

echo "building libstagefright_framecapture_utils^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_framecapture_utils,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_framecapture_utils^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_framecapture_utils^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_framecapture_utils^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_bufferqueue_helper^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_bufferqueue_helper,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_bufferqueue_helper,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_mediafilter^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_mediafilter,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_mediafilter^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_mediafilter^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_mediafilter^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_mediafilter,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_mediafilter^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_mediafilter^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/filters/libstagefright_mediafilter^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_httplive^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_httplive,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_httplive^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_httplive^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/httplive/libstagefright_httplive^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_omx^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_omx,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_omx^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_omx^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_omx^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_omx,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_omx^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_omx^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_rtsp^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_rtsp,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_rtsp^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_rtsp^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/rtsp/libstagefright_rtsp^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_timedtext^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_timedtext,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_timedtext^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_timedtext^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_timedtext^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libstagefright_timedtext,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_timedtext^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libstagefright_timedtext^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/timedtext/libstagefright_timedtext^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libaudiopolicycomponents^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicycomponents,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicycomponents^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicycomponents^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_64_static/addition_copy_files.output

echo "building libaudiopolicycomponents^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicycomponents,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicycomponents^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicycomponents^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/common/managerdefinitions/libaudiopolicycomponents^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudiopolicyengine_common^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyengine_common,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengine_common^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengine_common^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_64_static/addition_copy_files.output

echo "building libaudiopolicyengine_common^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyengine_common,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengine_common^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengine_common^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/common/libaudiopolicyengine_common^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudiopolicyengineconfigurable^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyengineconfigurable,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengineconfigurable^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengineconfigurable^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicyengineconfigurable^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyengineconfigurable,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengineconfigurable^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyengineconfigurable^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/libaudiopolicyengineconfigurable^android_x86_x86_64_shared/addition_copy_files.output

echo "building libpolicy-subsystem^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libpolicy-subsystem,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libpolicy-subsystem^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libpolicy-subsystem^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_64_shared/addition_copy_files.output

echo "building libpolicy-subsystem^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libpolicy-subsystem,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libpolicy-subsystem^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libpolicy-subsystem^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engineconfigurable/parameter-framework/plugin/libpolicy-subsystem^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicyenginedefault^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyenginedefault,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyenginedefault^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyenginedefault^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/enginedefault/libaudiopolicyenginedefault^android_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicymanagerdefault^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicymanagerdefault,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicymanagerdefault^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicymanagerdefault^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/managerdefault/libaudiopolicymanagerdefault^android_x86_64_shared/addition_copy_files.output

echo "building libaudiopolicyservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libaudiopolicyservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libaudiopolicyservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/service/libaudiopolicyservice^android_x86_64_shared/addition_copy_files.output

echo "building libresourcemanagerservice^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libresourcemanagerservice,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libresourcemanagerservice^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libresourcemanagerservice^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_shared/addition_copy_files.output

echo "building libresourcemanagerservice^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libresourcemanagerservice,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libresourcemanagerservice^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libresourcemanagerservice^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/libresourcemanagerservice^android_x86_x86_64_static/addition_copy_files.output

echo "building libmediatranscodingservice^android_x86_64_shared_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscodingservice,android_x86_64_shared_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscodingservice^android_x86_64_shared_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscodingservice^android_x86_64_shared_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_shared_com.android.media/addition_copy_files.output

echo "building libmediatranscodingservice^android_x86_64_static_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja libmediatranscodingservice,android_x86_64_static_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_static_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscodingservice^android_x86_64_static_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_static_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/libmediatranscodingservice^android_x86_64_static_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_static_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/libmediatranscodingservice^android_x86_64_static_com.android.media/addition_copy_files.output

echo "building mediatranscoding^android_x86_64_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_12.ninja mediatranscoding,android_x86_64_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/mediatranscoding^android_x86_64_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_12/frameworks/av/mediatranscoding^android_x86_64_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediatranscoding/mediatranscoding^android_x86_64_com.android.media/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_12 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_boringssl.tar.zst" ]; then
  echo "Compressing external/boringssl -> external_boringssl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_boringssl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/boringssl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_clang.tar.zst" ]; then
  echo "Compressing external/clang -> external_clang.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_clang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/clang/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_expat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.zst" ]; then
  echo "Compressing external/flac -> external_flac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst" ]; then
  echo "Compressing external/jsoncpp -> external_jsoncpp.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsoncpp.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsoncpp/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libogg.tar.zst" ]; then
  echo "Compressing external/libogg -> external_libogg.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libogg.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libogg/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_parameter-framework.tar.zst" ]; then
  echo "Compressing external/parameter-framework -> external_parameter-framework.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_parameter-framework.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/parameter-framework/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sonic.tar.zst" ]; then
  echo "Compressing external/sonic -> external_sonic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sonic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sonic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sonivox.tar.zst" ]; then
  echo "Compressing external/sonivox -> external_sonivox.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sonivox.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sonivox/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tremolo.tar.zst" ]; then
  echo "Compressing external/tremolo -> external_tremolo.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tremolo.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tremolo/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst" ]; then
  echo "Compressing frameworks/rs -> frameworks_rs.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_rs.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/rs/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst" ]; then
  echo "Compressing hardware/interfaces -> hardware_interfaces.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/hardware_interfaces.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/hardware/interfaces/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libfmq.tar.zst" ]; then
  echo "Compressing system/libfmq -> system_libfmq.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libfmq.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libfmq/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhidl.tar.zst" ]; then
  echo "Compressing system/libhidl -> system_libhidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst" ]; then
  echo "Compressing system/libhwbinder -> system_libhwbinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libhwbinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libhwbinder/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst" ]; then
  echo "Compressing system/memory/libmemunreachable -> system_memory_libmemunreachable.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libmemunreachable/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
