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
clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform build/soong
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_sparse_exclude tools/dexter !/testdata

rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/libnativeloader/libnativeloader^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_dynamic^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtbegin_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_android^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/crtend_so^android_x86_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libc/libc^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libdl/libdl^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/bionic/libm/libm^android_x86_x86_64_shared_current/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/signapk/signapk^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/dexter/slicer/slicer_ndk_no_rtti^android_x86_64_static/ .

echo "building DisplayCutoutEmulationCornerOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja DisplayCutoutEmulationCornerOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/DisplayCutoutEmulationCornerOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common

echo "building DisplayCutoutEmulationDoubleOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja DisplayCutoutEmulationDoubleOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/DisplayCutoutEmulationDoubleOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common

echo "building DisplayCutoutEmulationHoleOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja DisplayCutoutEmulationHoleOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/DisplayCutoutEmulationHoleOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common

echo "building DisplayCutoutEmulationTallOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja DisplayCutoutEmulationTallOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/DisplayCutoutEmulationTallOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common

echo "building DisplayCutoutEmulationWaterfallOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja DisplayCutoutEmulationWaterfallOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/DisplayCutoutEmulationWaterfallOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common

echo "building FontNotoSerifSourceOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja FontNotoSerifSourceOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/FontNotoSerifSourceOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common

echo "building NavigationBarMode3ButtonOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja NavigationBarMode3ButtonOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/NavigationBarMode3ButtonOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common

echo "building NavigationBarModeGesturalOverlayExtraWideBack^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja NavigationBarModeGesturalOverlayExtraWideBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/NavigationBarModeGesturalOverlayExtraWideBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common

echo "building NavigationBarModeGesturalOverlayNarrowBack^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja NavigationBarModeGesturalOverlayNarrowBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/NavigationBarModeGesturalOverlayNarrowBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common

echo "building NavigationBarModeGesturalOverlayWideBack^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja NavigationBarModeGesturalOverlayWideBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/NavigationBarModeGesturalOverlayWideBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common

echo "building NavigationBarModeGesturalOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja NavigationBarModeGesturalOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/NavigationBarModeGesturalOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common

echo "building OneHandedModeGesturalOverlay^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja OneHandedModeGesturalOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/OneHandedModeGesturalOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common

echo "building framework-res-package-jar^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja framework-res-package-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res-package-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/framework-res-package-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res-package-jar^android_common

echo "building liblockagent^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja liblockagent,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/liblockagent^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared

echo "building libwebviewchromium_loader^android_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libwebviewchromium_loader,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/libwebviewchromium_loader^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared

echo "building libwebviewchromium_loader^android_x86_x86_64_shared"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja libwebviewchromium_loader,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/libwebviewchromium_loader^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared

echo "building lockagent_crasher^android_x86_64"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja lockagent_crasher,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/frameworks/base/lockagent_crasher^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/bionic.tar.zst" ]; then
  echo "Compressing bionic -> bionic.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/bionic.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/bionic/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_zlib.tar.zst" ]; then
  echo "Compressing external/zlib -> external_zlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zlib/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_dexter.tar.zst" ]; then
  echo "Compressing tools/dexter -> tools_dexter.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_dexter.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/dexter/ .
fi

rm -rf aosp
