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
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/compiler-rt
clone_depth_platform external/flac
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/pffft
clone_depth_platform external/protobuf
clone_depth_platform external/rnnoise
clone_depth_platform external/tinyxml2
clone_depth_platform external/webrtc
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/tools/aidl
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building tv_tuner_frontend_info_aidl_interface-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja tv_tuner_frontend_info_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/tv_tuner_frontend_info_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java-source^

echo "building shared-file-region-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja shared-file-region-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/shared-file-region-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^

echo "building resourceobserver_aidl_interface-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourceobserver_aidl_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourceobserver_aidl_interface-api^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-api^

echo "building resourceobserver_aidl_interface-V1-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourceobserver_aidl_interface-V1-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourceobserver_aidl_interface-V1-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform-source^

echo "building resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourceobserver_aidl_interface-V1-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_x86_64_static

echo "building resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourceobserver_aidl_interface-V1-ndk_platform,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-V1-ndk_platform^android_x86_64_static_cfi_com.android.media

echo "building resourcemanager_aidl_interface-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourcemanager_aidl_interface-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourcemanager_aidl_interface-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^

echo "building resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourcemanager_aidl_interface-ndk_platform,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static_cfi

echo "building resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourcemanager_aidl_interface-ndk_platform,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_x86_64_static

echo "building resourcemanager_aidl_interface-ndk_platform^android_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourcemanager_aidl_interface-ndk_platform,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static_cfi

echo "building resourcemanager_aidl_interface-ndk_platform^android_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja resourcemanager_aidl_interface-ndk_platform,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform^android_x86_64_static

echo "building mediatranscoding_aidl_interface-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mediatranscoding_aidl_interface-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/mediatranscoding_aidl_interface-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform-source^

echo "building mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_com.android.media"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mediatranscoding_aidl_interface-ndk_platform,android_x86_64_static_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_com.android.media

echo "building mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_cfi_com.android.media"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mediatranscoding_aidl_interface-ndk_platform,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform^android_x86_64_static_cfi_com.android.media

echo "building mediatranscoding_aidl_interface-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mediatranscoding_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/mediatranscoding_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java-source^

echo "building mediametricsservice-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mediametricsservice-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/mediametricsservice-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^

echo "building libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_mp3dec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/mp3dec/libstagefright_mp3dec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_m4vh263enc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/enc/libstagefright_m4vh263enc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_m4vh263dec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/m4v_h263/dec/libstagefright_m4vh263dec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_foundation^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_foundation,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_foundation^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_x86_64_static

echo "building libstagefright_foundation^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_foundation,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_foundation^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_vendor.31_x86_64_static

echo "building libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_flacdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_enc_common^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_enc_common,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_enc_common^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_static

echo "building libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_amrwbenc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/enc/libstagefright_amrwbenc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_amrwbdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrwb/dec/libstagefright_amrwbdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_amrnbenc,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/enc/libstagefright_amrnbenc^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_amrnbdec,android_vendor.31_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/dec/libstagefright_amrnbdec^android_vendor.31_x86_x86_64_static_cfi

echo "building libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libstagefright_amrnb_common,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static

echo "building libreverbwrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libreverbwrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libreverbwrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_static

echo "building libreverbwrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libreverbwrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libreverbwrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_static

echo "building libreverb^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libreverb,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libreverb^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_x86_64_static

echo "building libreverb^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libreverb,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libreverb^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_64_static

echo "building libmusicbundle^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libmusicbundle,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libmusicbundle^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_x86_64_static

echo "building libmusicbundle^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libmusicbundle,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libmusicbundle^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_64_static

echo "building libmedia_helper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libmedia_helper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libmedia_helper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_x86_64_static

echo "building libmedia_helper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libmedia_helper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libmedia_helper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediahelper/libmedia_helper^android_vendor.31_x86_64_static

echo "building libeffectsconfig^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libeffectsconfig,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libeffectsconfig^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_x86_64_static

echo "building libeffectsconfig^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libeffectsconfig,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libeffectsconfig^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/config/libeffectsconfig^android_vendor.31_x86_64_static

echo "building libdownmix^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libdownmix,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libdownmix^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_static

echo "building libdownmix^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libdownmix,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libdownmix^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_static

echo "building libcodec2^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcodec2,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libcodec2^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_static

echo "building libcodec2^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libcodec2,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libcodec2^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_static

echo "building libclearkeydevicefiles-protos^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libclearkeydevicefiles-protos,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/hidl/libclearkeydevicefiles-protos^android_vendor.31_x86_64_static

echo "building libclearkeycommon^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libclearkeycommon,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libclearkeycommon^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_x86_64_static

echo "building libclearkeycommon^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libclearkeycommon,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libclearkeycommon^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/mediadrm/plugins/clearkey/common/libclearkeycommon^android_vendor.31_x86_64_static

echo "building libbundlewrapper^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbundlewrapper,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libbundlewrapper^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_static

echo "building libbundlewrapper^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libbundlewrapper,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libbundlewrapper^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_static

echo "building libaudiopreprocessing^android_vendor.31_x86_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaudiopreprocessing,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libaudiopreprocessing^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_x86_64_static

echo "building libaudiopreprocessing^android_vendor.31_x86_64_static"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaudiopreprocessing,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/libaudiopreprocessing^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/preprocessing/libaudiopreprocessing^android_vendor.31_x86_64_static

echo "building effect-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja effect-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/effect-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^

echo "building capture_state_listener-aidl-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja capture_state_listener-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/capture_state_listener-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java-source^

echo "building capture_state_listener-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja capture_state_listener-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/capture_state_listener-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^

echo "building av-types-aidl-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja av-types-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/av-types-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java-source^

echo "building av-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja av-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/av-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp-source^

echo "building audiopolicy-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audiopolicy-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/audiopolicy-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^

echo "building audiopolicy-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audiopolicy-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/audiopolicy-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^

echo "building audioflinger-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audioflinger-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/audioflinger-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^

echo "building audioclient-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audioclient-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/audioclient-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^

echo "building aaudio-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja aaudio-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/av/aaudio-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_av.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_flac.tar.zst" ]; then
  echo "Compressing external/flac -> external_flac.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_flac.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/flac/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxx.tar.zst" ]; then
  echo "Compressing external/libcxx -> external_libcxx.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxx.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxx/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst" ]; then
  echo "Compressing external/libcxxabi -> external_libcxxabi.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libcxxabi.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libcxxabi/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
