set -e

df -h

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
clone_sparse cts libs/json
clone_depth_platform external/compiler-rt
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libyuv
clone_depth_platform external/pffft
clone_depth_platform external/protobuf
clone_depth_platform external/rnnoise
clone_depth_platform external/tinyxml2
clone_depth_platform external/webrtc
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
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
clone_depth_platform system/memory/libdmabufheap
clone_depth_platform system/memory/libion
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/conv_linker_config^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/statslog_media.cpp^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/statslog_media.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.0/android.hardware.media.c2@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.1/android.hardware.media.c2@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/c2/1.2/android.hardware.media.c2@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/safe_union/1.0/android.hidl.safe_union@1.0_genc++_headers^/ .

echo "building com.android.media-systemserverclasspath-fragment^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja com.android.media-systemserverclasspath-fragment,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media-systemserverclasspath-fragment^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/com.android.media-systemserverclasspath-fragment^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/com.android.media-systemserverclasspath-fragment^android_common_apex29

echo "building libaudiopreprocessing^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudiopreprocessing,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libaudiopreprocessing^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_static

echo "building libaudiopreprocessing^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libaudiopreprocessing,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libaudiopreprocessing^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_static

echo "building libbundlewrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbundlewrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libbundlewrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_static

echo "building libbundlewrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libbundlewrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libbundlewrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_static

echo "building libclearkeycommon^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libclearkeycommon,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libclearkeycommon^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_64_static

echo "building libclearkeycommon^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libclearkeycommon,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libclearkeycommon^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_x86_64_static

echo "building libclearkeydevicefiles-protos^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libclearkeydevicefiles-protos,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static

echo "building libcodec2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_static

echo "building libcodec2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_static

echo "building libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_hidl@1.0,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.0/utils/libcodec2_hidl@1.0^android_x86_64_static_com.android.media.swcodec

echo "building libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_hidl@1.1,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.1/utils/libcodec2_hidl@1.1^android_x86_64_static_com.android.media.swcodec

echo "building libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_hidl@1.2,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/hidl/1.2/utils/libcodec2_hidl@1.2^android_x86_64_static_com.android.media.swcodec

echo "building libcodec2_vndk^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_vndk,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_vndk^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static

echo "building libcodec2_vndk^android_x86_64_static_com.android.media.swcodec"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_vndk,android_x86_64_static_com.android.media.swcodec
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_64_static_com.android.media.swcodec

echo "building libcodec2_vndk^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libcodec2_vndk,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libcodec2_vndk^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/vndk/libcodec2_vndk^android_x86_x86_64_static

echo "building libdownmix^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdownmix,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libdownmix^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_static

echo "building libdownmix^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libdownmix,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libdownmix^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_static

echo "building libeffectsconfig^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libeffectsconfig,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libeffectsconfig^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_static

echo "building libeffectsconfig^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libeffectsconfig,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libeffectsconfig^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_static

echo "building libmedia_helper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmedia_helper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libmedia_helper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_static

echo "building libmedia_helper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmedia_helper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libmedia_helper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_static

echo "building libmusicbundle^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmusicbundle,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libmusicbundle^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_64_static

echo "building libmusicbundle^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libmusicbundle,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libmusicbundle^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_x86_64_static

echo "building librenderfright^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja librenderfright,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/librenderfright^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_64_static

echo "building librenderfright^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja librenderfright,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/librenderfright^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/renderfright/librenderfright^android_x86_x86_64_static

echo "building libreverb^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libreverb,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libreverb^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_64_static

echo "building libreverb^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libreverb,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libreverb^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_x86_64_static

echo "building libreverbwrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libreverbwrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libreverbwrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_static

echo "building libreverbwrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libreverbwrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libreverbwrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_static

echo "building libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_amrnb_common,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static

echo "building libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_amrnbdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_amrnbenc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_amrwbdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_amrwbenc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_64_static

echo "building libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_bufferpool@2.0,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0^android_vendor.31_x86_x86_64_static

echo "building libstagefright_color_conversion^android_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_color_conversion,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_color_conversion^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_64_static_cfi

echo "building libstagefright_color_conversion^android_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_color_conversion,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_color_conversion^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/colorconversion/libstagefright_color_conversion^android_x86_x86_64_static_cfi

echo "building libstagefright_enc_common^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_enc_common,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_enc_common^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_static

echo "building libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_flacdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_foundation^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_foundation,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_foundation^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_static

echo "building libstagefright_foundation^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_foundation,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_foundation^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_static

echo "building libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_m4vh263dec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_m4vh263enc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstagefright_mp3dec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstatslog_media^android_x86_64_static_cfi_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja libstatslog_media,android_x86_64_static_cfi_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libstatslog_media^android_x86_64_static_cfi_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/libstatslog_media^android_x86_64_static_cfi_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/libstatslog_media^android_x86_64_static_cfi_apex29

echo "building media-linker-config^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja media-linker-config,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/media-linker-config^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/media-linker-config^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/apex/media-linker-config^android_x86_64

echo "building resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja resourceobserver_aidl_interface-V1-ndk_platform,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media

echo "building resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja resourceobserver_aidl_interface-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/frameworks/av/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 frameworks_av.tar.zst --clobber

du -ah -d1| sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.zst" ]; then
  echo "Compressing external/flac -> external_flac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libyuv.tar.zst" ]; then
  echo "Compressing external/libyuv -> external_libyuv.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libyuv.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libyuv/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_pffft.tar.zst" ]; then
  echo "Compressing external/pffft -> external_pffft.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_pffft.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/pffft/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rnnoise.tar.zst" ]; then
  echo "Compressing external/rnnoise -> external_rnnoise.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rnnoise.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rnnoise/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst" ]; then
  echo "Compressing external/tinyxml2 -> external_tinyxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tinyxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tinyxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_webrtc.tar.zst" ]; then
  echo "Compressing external/webrtc -> external_webrtc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_webrtc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/webrtc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst" ]; then
  echo "Compressing system/memory/libdmabufheap -> system_memory_libdmabufheap.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libdmabufheap.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libdmabufheap/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst" ]; then
  echo "Compressing system/memory/libion -> system_memory_libion.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_memory_libion.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/memory/libion/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
