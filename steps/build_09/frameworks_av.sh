
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

clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/boringssl
clone_depth_platform external/compiler-rt
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/jsoncpp
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/protobuf
clone_depth_platform external/sonic
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
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
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/malloc_debug/libc_malloc_debug_backtrace^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libcrypto^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/boringssl/libssl^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/libandroidicu^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/libandroidicu/libandroidicu^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsoncpp/libjsoncpp^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sonic/libsonic^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/common/util/libdrmutility^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/common/libfwdlock-common^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/converter/libfwdlock-converter^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/drm/libdrmframework/plugins/forward-lock/internal-format/decoder/libfwdlock-decoder^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/lib/libreverb^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/lib/libmusicbundle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_midiiowrapper^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libplatformprotos^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/vibrator/libvibrator^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/statslog.h^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/1.0/android.hardware.cas@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/cas/native/1.0/android.hardware.cas.native@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/bufferpool/2.0/android.hardware.media.bufferpool@2.0^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libfmq/libfmq^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/libhidlbase^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .

echo "building av-types-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja av-types-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building av-types-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja av-types-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building av-types-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja av-types-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building av-types-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja av-types-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building libdrmframeworkcommon^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframeworkcommon,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_shared/addition_copy_files.output

echo "building libdrmframeworkcommon^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframeworkcommon,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_64_static/addition_copy_files.output

echo "building libdrmframeworkcommon^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframeworkcommon,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_shared/addition_copy_files.output

echo "building libdrmframeworkcommon^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframeworkcommon,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframeworkcommon^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/common/libdrmframeworkcommon^android_x86_x86_64_static/addition_copy_files.output

echo "building libdrmframework^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframework,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframework^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframework^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_64_shared/addition_copy_files.output

echo "building libdrmframework^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdrmframework,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframework^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdrmframework^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/libdrmframework^android_x86_x86_64_shared/addition_copy_files.output

echo "building libfwdlockengine^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libfwdlockengine,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libfwdlockengine^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libfwdlockengine^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_64_shared/addition_copy_files.output

echo "building libfwdlockengine^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libfwdlockengine,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libfwdlockengine^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libfwdlockengine^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/drm/libdrmframework/plugins/forward-lock/FwdLockEngine/libfwdlockengine^android_x86_x86_64_shared/addition_copy_files.output

echo "building libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_bufferpool@2.0.1,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/bufferpool/2.0/libstagefright_bufferpool@2.0.1^android_x86_64_shared_apex29/addition_copy_files.output

echo "building libaaudio^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaaudio,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_64_static/addition_copy_files.output

echo "building libaaudio^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaaudio,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio^android_x86_x86_64_static/addition_copy_files.output

echo "building aaudio-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja aaudio-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/aaudio-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/aaudio-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building aaudio-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja aaudio-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/aaudio-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/aaudio-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building libaaudio_internal^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaaudio_internal,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio_internal^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio_internal^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_64_static/addition_copy_files.output

echo "building libaaudio_internal^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaaudio_internal,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio_internal^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudio_internal^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/libaaudio_internal^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudioclient_aidl_conversion^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioclient_aidl_conversion,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient_aidl_conversion^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient_aidl_conversion^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_static/addition_copy_files.output

echo "building libaudioclient_aidl_conversion^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioclient_aidl_conversion,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient_aidl_conversion^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient_aidl_conversion^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_static/addition_copy_files.output

echo "building capture_state_listener-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja capture_state_listener-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building capture_state_listener-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja capture_state_listener-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building capture_state_listener-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja capture_state_listener-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building capture_state_listener-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja capture_state_listener-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/capture_state_listener-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building effect-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja effect-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building effect-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja effect-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building effect-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja effect-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building effect-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja effect-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/effect-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building audioclient-types-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audioclient-types-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioclient-types-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioclient-types-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building audioclient-types-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audioclient-types-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioclient-types-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioclient-types-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building audiopolicy-types-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audiopolicy-types-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building audiopolicy-types-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audiopolicy-types-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-types-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building audioflinger-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audioflinger-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioflinger-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioflinger-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building audioflinger-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audioflinger-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioflinger-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audioflinger-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building audiopolicy-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audiopolicy-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building audiopolicy-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja audiopolicy-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/audiopolicy-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudioclient^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioclient,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/addition_copy_files.output

echo "building libaudioclient^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioclient,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioclient^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudiofoundation^android_vendor.31_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiofoundation,android_vendor.31_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_vendor.31_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_vendor.31_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_64_static/addition_copy_files.output

echo "building libaudiofoundation^android_vendor.31_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiofoundation,android_vendor.31_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_vendor.31_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_vendor.31_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_vendor.31_x86_x86_64_static/addition_copy_files.output

echo "building libaudiofoundation^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiofoundation,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_static/addition_copy_files.output

echo "building libaudiofoundation^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiofoundation,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiofoundation^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudiohal^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiohal,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiohal,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudiohal_deathhandler^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiohal_deathhandler,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal_deathhandler^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal_deathhandler^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_64_shared/addition_copy_files.output

echo "building libaudiohal_deathhandler^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiohal_deathhandler,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal_deathhandler^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiohal_deathhandler^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudiohal/libaudiohal_deathhandler^android_x86_x86_64_shared/addition_copy_files.output

echo "building libaudioprocessing^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioprocessing,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioprocessing^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioprocessing^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing^android_x86_64_shared/addition_copy_files.output

echo "building libaudioprocessing_base^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudioprocessing_base,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing_base^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioprocessing_base^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing_base^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudioprocessing_base^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing_base^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioprocessing/libaudioprocessing_base^android_x86_64_static/addition_copy_files.output

echo "building libdatasource^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdatasource,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libdatasource^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdatasource,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_64_static_cfi/addition_copy_files.output

echo "building libdatasource^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdatasource,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libdatasource^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdatasource,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdatasource^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libdownmix^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdownmix,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdownmix^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdownmix^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libdownmix^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libdownmix,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdownmix^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libdownmix^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/downmix/libdownmix^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libhapticgenerator^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libhapticgenerator,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libhapticgenerator^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libhapticgenerator^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libhapticgenerator^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libhapticgenerator,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libhapticgenerator^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libhapticgenerator^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/hapticgenerator/libhapticgenerator^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libbundlewrapper^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbundlewrapper,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libbundlewrapper^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libbundlewrapper^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libbundlewrapper^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libbundlewrapper,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libbundlewrapper^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libbundlewrapper^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libbundlewrapper^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libreverbwrapper^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libreverbwrapper,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libreverbwrapper^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libreverbwrapper^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libreverbwrapper^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libreverbwrapper,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libreverbwrapper^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libreverbwrapper^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/lvm/wrapper/libreverbwrapper^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libmediametrics^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediametrics,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmediametrics^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediametrics,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_64_static_cfi/addition_copy_files.output

echo "building libmediametrics^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediametrics,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libmediametrics^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediametrics,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametrics^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/libmediametrics^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building mediametricsservice-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja mediametricsservice-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building mediametricsservice-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja mediametricsservice-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building mediametricsservice-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja mediametricsservice-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building mediametricsservice-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja mediametricsservice-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/mediametricsservice-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building libplayerservice_datasource^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libplayerservice_datasource,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libplayerservice_datasource^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libplayerservice_datasource^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediaplayerservice/datasource/libplayerservice_datasource^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libnbaio_mono^android_vendor.31_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnbaio_mono,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio_mono^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio_mono^android_vendor.31_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_64_shared/addition_copy_files.output

echo "building libnbaio_mono^android_vendor.31_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnbaio_mono,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio_mono^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio_mono^android_vendor.31_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio_mono^android_vendor.31_x86_x86_64_shared/addition_copy_files.output

echo "building libnbaio^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnbaio,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnbaio^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnbaio/libnbaio^android_x86_64_shared/addition_copy_files.output

echo "building libnblog^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnblog,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnblog^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnblog^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_64_shared/addition_copy_files.output

echo "building libnblog^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libnblog,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnblog^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libnblog^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libnblog/libnblog^android_x86_x86_64_shared/addition_copy_files.output

echo "building shared-file-region-aidl-cpp^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja shared-file-region-aidl-cpp,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_shared/addition_copy_files.output

echo "building shared-file-region-aidl-cpp^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja shared-file-region-aidl-cpp,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_64_static/addition_copy_files.output

echo "building shared-file-region-aidl-cpp^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja shared-file-region-aidl-cpp,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_shared/addition_copy_files.output

echo "building shared-file-region-aidl-cpp^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja shared-file-region-aidl-cpp,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/shared-file-region-aidl-cpp^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp^android_x86_x86_64_static/addition_copy_files.output

echo "building libshmemcompat^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemcompat,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_shared/addition_copy_files.output

echo "building libshmemcompat^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemcompat,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_64_static/addition_copy_files.output

echo "building libshmemcompat^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemcompat,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_shared/addition_copy_files.output

echo "building libshmemcompat^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemcompat,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemcompat^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemcompat^android_x86_x86_64_static/addition_copy_files.output

echo "building libshmemutil^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemutil,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_shared/addition_copy_files.output

echo "building libshmemutil^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemutil,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_64_static/addition_copy_files.output

echo "building libshmemutil^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemutil,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_x86_64_shared.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_shared/addition_copy_files.output

echo "building libshmemutil^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libshmemutil,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libshmemutil^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/libshmemutil^android_x86_x86_64_static/addition_copy_files.output

echo "building libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_mpeg2extractor,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_mpeg2extractor^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libstagefright_metadatautils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_metadatautils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static/addition_copy_files.output

echo "building libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_metadatautils,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libstagefright_metadatautils^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_metadatautils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static/addition_copy_files.output

echo "building libstagefright_metadatautils^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_metadatautils,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_metadatautils^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_foundation^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_foundation,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_foundation^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_foundation,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_foundation^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_foundation,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libstagefright_foundation^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_foundation,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_foundation^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_mpeg2support^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_mpeg2support,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2support^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2support^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_mpeg2support_nocrypto,android_x86_64_static_cfi_com.android.media
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/mpeg2ts/libstagefright_mpeg2support_nocrypto^android_x86_64_static_cfi_com.android.media/addition_copy_files.output

echo "building libstagefright_webm^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_webm,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_webm^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_webm^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_64_static_cfi/addition_copy_files.output

echo "building libstagefright_webm^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libstagefright_webm,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_webm^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libstagefright_webm^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/webm/libstagefright_webm^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libmediandk_utils^android_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediandk_utils,android_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_shared_cfi/addition_copy_files.output

echo "building libmediandk_utils^android_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediandk_utils,android_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_64_static_cfi/addition_copy_files.output

echo "building libmediandk_utils^android_x86_x86_64_shared_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediandk_utils,android_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_x86_64_shared_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_shared_cfi/addition_copy_files.output

echo "building libmediandk_utils^android_x86_x86_64_static_cfi"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediandk_utils,android_x86_x86_64_static_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_static_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_x86_64_static_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_static_cfi
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediandk_utils^android_x86_x86_64_static_cfi.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_static_cfi $GITHUB_WORKSPACE/artifacts/frameworks/av/media/ndk/libmediandk_utils^android_x86_x86_64_static_cfi/addition_copy_files.output

echo "building libmediautils^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediautils,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediautils^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediautils^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_64_static/addition_copy_files.output

echo "building libmediautils^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediautils,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediautils^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediautils^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/media/utils/libmediautils^android_x86_x86_64_static/addition_copy_files.output

echo "building libaudiopolicyengine_config^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiopolicyengine_config,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiopolicyengine_config^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiopolicyengine_config^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_64_static/addition_copy_files.output

echo "building libaudiopolicyengine_config^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaudiopolicyengine_config,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiopolicyengine_config^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaudiopolicyengine_config^android_x86_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/audiopolicy/engine/config/libaudiopolicyengine_config^android_x86_x86_64_static/addition_copy_files.output

echo "building libmedialogservice^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmedialogservice,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmedialogservice^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmedialogservice^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/medialog/libmedialogservice^android_x86_64_static/addition_copy_files.output

echo "building libmediametricsservice^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libmediametricsservice,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametricsservice^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libmediametricsservice^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediametrics/libmediametricsservice^android_x86_64_static/addition_copy_files.output

echo "building libaaudioservice^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja libaaudioservice,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudioservice^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_static
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/av/libaaudioservice^android_x86_64_static.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_static $GITHUB_WORKSPACE/artifacts/frameworks/av/services/oboeservice/libaaudioservice^android_x86_64_static/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h


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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst" ]; then
  echo "Compressing external/compiler-rt -> external_compiler-rt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_compiler-rt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/compiler-rt/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libxml2.tar.zst" ]; then
  echo "Compressing external/libxml2 -> external_libxml2.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libxml2.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libxml2/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_sonic.tar.zst" ]; then
  echo "Compressing external/sonic -> external_sonic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_sonic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/sonic/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi


rm -rf aosp
