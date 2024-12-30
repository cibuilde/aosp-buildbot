set -e

echo "entering frameworks/wilhelm"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform bionic
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/fmtlib
clone_depth_platform external/icu
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/wilhelm
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/unwinding

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
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/libaudioclient_aidl_conversion^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudiofoundation/libaudiofoundation^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libdatasource/libdatasource^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libdatasource/libdatasource^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia^android_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_codeclist^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmedia/libmedia_omx^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/foundation/libstagefright_foundation^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/http/libstagefright_http_support^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/libstagefright_metadatautils^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/media/audio_common-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/jni/libandroid_runtime^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/jni/libandroid_runtime^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/permission/framework-permission-aidl-cpp^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/sysprop/libLibGuiProperties^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/audiomanager/libaudiomanager^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/services/audiomanager/libaudiomanager^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/binder/libbinder^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/gui/libgui_aidl_static^android_x86_x86_64_static_lto-thin/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/input/libinput^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/native/libs/nativewindow/libnativewindow^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libOpenSLESUT^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libOpenSLESUT^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libopensles_helper^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/wilhelm/src/libopensles_helper^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/common/aidl/android.hardware.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/1.0/android.hardware.graphics.bufferqueue@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/bufferqueue/2.0/android.hardware.graphics.bufferqueue@2.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/aidl/android.hardware.graphics.common-V2-ndk_platform-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.0/android.hardware.graphics.common@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.1/android.hardware.graphics.common@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/common/1.2/android.hardware.graphics.common@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/graphics/mapper/4.0/android.hardware.graphics.mapper@4.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/omx/1.0/android.hardware.media.omx@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/hardware/interfaces/media/1.0/android.hardware.media@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/allocator/1.0/android.hidl.allocator@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/base/1.0/android.hidl.base@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.0/android.hidl.manager@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.1/android.hidl.manager@1.1_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/manager/1.2/android.hidl.manager@1.2_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/token/1.0/android.hidl.memory.token@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libhidl/transport/memory/1.0/android.hidl.memory@1.0_genc++_headers^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .

echo "building libOpenMAXAL^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libOpenMAXAL,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenMAXAL^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libOpenMAXAL^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenMAXAL^android_x86_64_shared

echo "building libOpenMAXAL^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libOpenMAXAL,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenMAXAL^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libOpenMAXAL^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenMAXAL^android_x86_x86_64_shared

echo "building libOpenSLES^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libOpenSLES,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenSLES^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libOpenSLES^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenSLES^android_x86_64_shared

echo "building libOpenSLES^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libOpenSLES,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenSLES^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libOpenSLES^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libOpenSLES^android_x86_x86_64_shared

echo "building libwilhelm^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libwilhelm,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libwilhelm^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libwilhelm^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libwilhelm^android_x86_64_shared

echo "building libwilhelm^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_16.ninja libwilhelm,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libwilhelm^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_16/frameworks/wilhelm/libwilhelm^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/src/libwilhelm^android_x86_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/wilhelm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_16 frameworks_wilhelm.tar.zst --clobber

du -ah -d1 frameworks_wilhelm*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst" ]; then
  echo "Compressing frameworks/wilhelm -> frameworks_wilhelm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_wilhelm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/wilhelm/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi

rm -rf aosp
