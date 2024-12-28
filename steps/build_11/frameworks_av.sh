set -e

df -h

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
clone_depth_platform external/flac
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/minijail
clone_depth_platform frameworks/av
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media

rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_vendor.31_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/flac/src/libFLAC/libFLAC^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/minijail/libminijail^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_static_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^android_x86_64_shared_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_vendor.31_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/media/audio_utils/libaudioutils^android_vendor.31_x86_x86_64_static_cfi/ .

echo "building libavservices_minijail^android_x86_64_shared_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libavservices_minijail,android_x86_64_shared_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libavservices_minijail^android_x86_64_shared_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/minijail/libavservices_minijail^android_x86_64_shared_apex29

echo "building libcodec2^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libcodec2,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_64_shared

echo "building libcodec2^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libcodec2,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libcodec2^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codec2/core/libcodec2^android_vendor.31_x86_x86_64_shared

echo "building libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_amrnb_common,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/codecs/amrnb/common/libstagefright_amrnb_common^android_vendor.31_x86_x86_64_shared

echo "building libstagefright_enc_common^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_enc_common,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/codecs/common/libstagefright_enc_common^android_vendor.31_x86_x86_64_shared

echo "building libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libstagefright_flacdec,android_vendor.31_x86_x86_64_shared_cfi
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libstagefright/flac/dec/libstagefright_flacdec^android_vendor.31_x86_x86_64_shared_cfi

echo "building libvisualizer^android_vendor.31_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libvisualizer,android_vendor.31_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libvisualizer^android_vendor.31_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_64_shared

echo "building libvisualizer^android_vendor.31_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libvisualizer,android_vendor.31_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/av/libvisualizer^android_vendor.31_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libeffects/visualizer/libvisualizer^android_vendor.31_x86_x86_64_shared

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 frameworks_av.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_minijail.tar.zst" ]; then
  echo "Compressing external/minijail -> external_minijail.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_minijail.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/minijail/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi

rm -rf aosp
