
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/av"

clone_depth_platform art
clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/aac
clone_depth_platform external/compiler-rt
clone_depth_platform external/expat
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/libavc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libgsm
clone_depth_platform external/libhevc
clone_depth_platform external/libmpeg2
clone_depth_platform external/libopus
clone_depth_platform external/libvpx
clone_depth_platform external/libyuv
clone_depth_platform external/tremolo
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/memory/libdmabufheap
clone_depth_platform system/memory/libion
clone_depth_platform system/memory/libmemunreachable
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/aac/libFraunhoferAAC^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flac/src/libFLAC/libFLAC^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libavc/libavcdec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libavc/libavcenc^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libgsm/libgsm^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libhevc/libhevcdec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libmpeg2/libmpeg2dec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libopus/libopus^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libvpx/libvpx^android_vendor.31_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv_static^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libyuv/files/libyuv_static^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tremolo/libvorbisidec^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libcpustats/libcpustats^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediahelper/libmedia_helper^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libnblog/libnblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/utils/libmediautils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/medialog/libmedialogservice^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/minijail/libavservices_minijail^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/arect/libarect^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_bufferqueue_static^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_bufferqueue_static^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/libpermission^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/ui/libui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/opengl/libs/libEGL^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/powermanager/libpowermanager^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/libhardware/libhardware^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libvndksupport/libvndksupport^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlmemory/libhidlmemory^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/token/1.0/utils/android.hidl.token@1.0-utils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libsndfile^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudiospdif^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/libdmabufheap^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libdmabufheap/libdmabufheap^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libion/libion^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libion/libion^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/memory/libmemunreachable/libmemunreachable^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .

echo "building libsfplugin_ccodec_utils^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsfplugin_ccodec_utils,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libsfplugin_ccodec_utils^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libsfplugin_ccodec_utils,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/sfplugin/utils/libsfplugin_ccodec_utils^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libcodec2_vndk,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2_vndk^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2_vndk^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_shared/addition_copy_files.output

echo "building libcodec2_vndk^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libcodec2_vndk,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2_vndk^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2_vndk^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_shared/addition_copy_files.output

echo "building libmedia_omx^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libmedia_omx,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libmedia_omx^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libmedia_omx,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libmedia_omx^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libmedia_omx,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmedia_omx^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libmedia_omx,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libmedia_omx^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_bufferqueue_helper,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_bufferqueue_helper,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/bqhelper/libstagefright_bufferqueue_helper^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_aacdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacdec/libstagefright_soft_aacdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_aacenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/aacenc/libstagefright_soft_aacenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_amrdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/dec/libstagefright_soft_amrdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_amrnbenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrnb/enc/libstagefright_soft_amrnbenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_amrwbenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/amrwbenc/libstagefright_soft_amrwbenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_avcdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcdec/libstagefright_soft_avcdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_avcenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/avcenc/libstagefright_soft_avcenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_flacdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/dec/libstagefright_soft_flacdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_flacenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/flac/enc/libstagefright_soft_flacenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_g711dec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/g711/dec/libstagefright_soft_g711dec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_gsmdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/gsm/dec/libstagefright_soft_gsmdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_hevcdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/hevcdec/libstagefright_soft_hevcdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_mpeg4dec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/dec/libstagefright_soft_mpeg4dec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_mpeg4enc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/m4v_h263/enc/libstagefright_soft_mpeg4enc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_mp3dec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mp3dec/libstagefright_soft_mp3dec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_mpeg2dec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/mpeg2dec/libstagefright_soft_mpeg2dec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_vpxdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/dec/libstagefright_soft_vpxdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_vpxenc,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/on2/enc/libstagefright_soft_vpxenc^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_opusdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/opus/dec/libstagefright_soft_opusdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_rawdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/raw/libstagefright_soft_rawdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_soft_vorbisdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/vorbis/dec/libstagefright_soft_vorbisdec^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_softomx_plugin,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx_plugin^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_omx^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libstagefright_omx^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_omx_utils^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx_utils,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx_utils,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_omx_utils^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx_utils,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_omx_utils^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_omx_utils,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_omx_utils^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_omx_utils^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_softomx,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/omx/libstagefright_softomx^android_vendor.31_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_xmlparser^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_xmlparser,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_xmlparser,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_xmlparser^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_xmlparser,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_xmlparser^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_xmlparser,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_xmlparser^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/xmlparser/libstagefright_xmlparser^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libaudioflinger^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libaudioflinger,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libaudioflinger^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libaudioflinger^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audioflinger/libaudioflinger^android_x86_64_shared/addition_copy_files.output

echo "building android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja android.hardware.media.omx@1.0-service,android_vendor.31_x86_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64 $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediacodec/android.hardware.media.omx@1.0-service^android_vendor.31_x86_x86_64/addition_copy_files.output

echo "building libaaudioservice^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libaaudioservice,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libaaudioservice^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libaaudioservice^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_shared/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 frameworks_av.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_aac.tar.zst" ]; then
  echo "Compressing external/aac -> external_aac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_aac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/aac/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libavc.tar.zst" ]; then
  echo "Compressing external/libavc -> external_libavc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libavc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libavc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libgsm.tar.zst" ]; then
  echo "Compressing external/libgsm -> external_libgsm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libgsm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libgsm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libhevc.tar.zst" ]; then
  echo "Compressing external/libhevc -> external_libhevc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libhevc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libhevc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst" ]; then
  echo "Compressing external/libmpeg2 -> external_libmpeg2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libmpeg2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libmpeg2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libopus.tar.zst" ]; then
  echo "Compressing external/libopus -> external_libopus.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libopus.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libopus/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libvpx.tar.zst" ]; then
  echo "Compressing external/libvpx -> external_libvpx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libvpx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libvpx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst" ]; then
  echo "Compressing system/memory/libdmabufheap -> system_memory_libdmabufheap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libdmabufheap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst" ]; then
  echo "Compressing system/memory/libion -> system_memory_libion.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libion/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst" ]; then
  echo "Compressing system/memory/libmemunreachable -> system_memory_libmemunreachable.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libmemunreachable.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libmemunreachable/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
