set -e

echo "entering frameworks/base"

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
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/auto
clone_depth_platform external/error_prone
clone_depth_platform external/fmtlib
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/protobuf
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform packages/modules/StatsD
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/core
clone_depth_platform system/libbase
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd
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
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/manifest_fixer^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zip2zip/zip2zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/libconscrypt_openjdk_jni^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/error_prone/error_prone_core^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxxabi/libc++demangle^android_x86_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/remote-color-resources-arsc-zip^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase_ndk^android_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^android_x86_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/client/libnetd_client^android_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/client/libnetd_client^android_x86_x86_64_shared_cfi/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_checker^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_dump^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_java^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/dexter/slicer/slicer_ndk_no_rtti^android_x86_64_static/ .

echo "building DisplayCutoutEmulationCornerOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja DisplayCutoutEmulationCornerOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/DisplayCutoutEmulationCornerOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationCornerOverlay/DisplayCutoutEmulationCornerOverlay^android_common

echo "building DisplayCutoutEmulationDoubleOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja DisplayCutoutEmulationDoubleOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/DisplayCutoutEmulationDoubleOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationDoubleOverlay/DisplayCutoutEmulationDoubleOverlay^android_common

echo "building DisplayCutoutEmulationHoleOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja DisplayCutoutEmulationHoleOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/DisplayCutoutEmulationHoleOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationHoleOverlay/DisplayCutoutEmulationHoleOverlay^android_common

echo "building DisplayCutoutEmulationTallOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja DisplayCutoutEmulationTallOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/DisplayCutoutEmulationTallOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationTallOverlay/DisplayCutoutEmulationTallOverlay^android_common

echo "building DisplayCutoutEmulationWaterfallOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja DisplayCutoutEmulationWaterfallOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/DisplayCutoutEmulationWaterfallOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/DisplayCutoutEmulationWaterfallOverlay/DisplayCutoutEmulationWaterfallOverlay^android_common

echo "building FontNotoSerifSourceOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja FontNotoSerifSourceOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/FontNotoSerifSourceOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/FontNotoSerifSourceOverlay/FontNotoSerifSourceOverlay^android_common

echo "building NavigationBarMode3ButtonOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja NavigationBarMode3ButtonOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/NavigationBarMode3ButtonOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarMode3ButtonOverlay/NavigationBarMode3ButtonOverlay^android_common

echo "building NavigationBarModeGesturalOverlayExtraWideBack^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja NavigationBarModeGesturalOverlayExtraWideBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/NavigationBarModeGesturalOverlayExtraWideBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayExtraWideBack/NavigationBarModeGesturalOverlayExtraWideBack^android_common

echo "building NavigationBarModeGesturalOverlayNarrowBack^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja NavigationBarModeGesturalOverlayNarrowBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/NavigationBarModeGesturalOverlayNarrowBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayNarrowBack/NavigationBarModeGesturalOverlayNarrowBack^android_common

echo "building NavigationBarModeGesturalOverlayWideBack^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja NavigationBarModeGesturalOverlayWideBack,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/NavigationBarModeGesturalOverlayWideBack^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlayWideBack/NavigationBarModeGesturalOverlayWideBack^android_common

echo "building NavigationBarModeGesturalOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja NavigationBarModeGesturalOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/NavigationBarModeGesturalOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/NavigationBarModeGesturalOverlay/NavigationBarModeGesturalOverlay^android_common

echo "building OneHandedModeGesturalOverlay^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja OneHandedModeGesturalOverlay,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/OneHandedModeGesturalOverlay^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/overlays/OneHandedModeGesturalOverlay/OneHandedModeGesturalOverlay^android_common

echo "building com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja com.android.appsearch-systemserverclasspath-fragment,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/com.android.appsearch-systemserverclasspath-fragment^android_common_apex10000

echo "building com.android.sysprop.localization_java_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja com.android.sysprop.localization_java_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_java_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/com.android.sysprop.localization_java_gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_java_gen^

echo "building com.android.sysprop.localization_sysprop_library^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja com.android.sysprop.localization_sysprop_library,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_sysprop_library^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/com.android.sysprop.localization_sysprop_library^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_sysprop_library^

echo "building com.android.sysprop.watchdog_java_gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja com.android.sysprop.watchdog_java_gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_java_gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/com.android.sysprop.watchdog_java_gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_java_gen^

echo "building com.android.sysprop.watchdog_sysprop_library^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja com.android.sysprop.watchdog_sysprop_library,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_sysprop_library^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/com.android.sysprop.watchdog_sysprop_library^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_sysprop_library^

echo "building error_prone_android_framework_lib^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja error_prone_android_framework_lib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/errorprone/error_prone_android_framework_lib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/error_prone_android_framework_lib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/errorprone/error_prone_android_framework_lib^linux_glibc_common

echo "building framework-res-package-jar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja framework-res-package-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res-package-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/framework-res-package-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res-package-jar^android_common

echo "building framework-res^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja framework-res,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/framework-res^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/framework-res^android_common

echo "building libandroid_net^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libandroid_net,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid_net^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libandroid_net^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid_net^android_x86_64_shared

echo "building libandroid_net^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libandroid_net,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid_net^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libandroid_net^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid_net^android_x86_x86_64_shared

echo "building liblockagent^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja liblockagent,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/liblockagent^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/liblockagent^android_x86_64_shared

echo "building libstatslog_hwui^android_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libstatslog_hwui,android_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libstatslog_hwui^android_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libstatslog_hwui^android_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libstatslog_hwui^android_x86_64_static_lto-thin

echo "building libstatslog_hwui^android_x86_x86_64_static_lto-thin"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libstatslog_hwui,android_x86_x86_64_static_lto-thin
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libstatslog_hwui^android_x86_x86_64_static_lto-thin
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libstatslog_hwui^android_x86_x86_64_static_lto-thin.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/libstatslog_hwui^android_x86_x86_64_static_lto-thin

echo "building libwebviewchromium_loader^android_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libwebviewchromium_loader,android_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libwebviewchromium_loader^android_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_64_shared

echo "building libwebviewchromium_loader^android_x86_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja libwebviewchromium_loader,android_x86_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/libwebviewchromium_loader^android_x86_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/webview/loader/libwebviewchromium_loader^android_x86_x86_64_shared

echo "building lockagent_crasher^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja lockagent_crasher,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/lockagent_crasher^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/lock_agent/lockagent_crasher^android_x86_64

echo "building platform-bootclasspath^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja platform-bootclasspath,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/platform-bootclasspath^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-bootclasspath^android_common

echo "building platform-systemserverclasspath^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja platform-systemserverclasspath,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-systemserverclasspath^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/platform-systemserverclasspath^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/boot/platform-systemserverclasspath^android_common

echo "building statslog-SystemUI-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-SystemUI-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/statslog-SystemUI-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog-SystemUI-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/statslog-SystemUI-java-gen^

echo "building statslog-appsearch-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-appsearch-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog-appsearch-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-java-gen^

echo "building statslog-art-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-art-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/statslog-art-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog-art-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/statslog-art-java-gen^

echo "building statslog-framework-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-framework-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/statslog-framework-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog-framework-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/statslog-framework-java-gen^

echo "building statslog-telephony-common-java-gen^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog-telephony-common-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/telephony/common/statslog-telephony-common-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog-telephony-common-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/telephony/common/statslog-telephony-common-java-gen^

echo "building statslog_hwui.cpp^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog_hwui.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog_hwui.cpp^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.cpp^

echo "building statslog_hwui.h^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja statslog_hwui.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/base/statslog_hwui.h^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 frameworks_base.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_error_prone.tar.zst" ]; then
  echo "Compressing external/error_prone -> external_error_prone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_error_prone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/error_prone/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst" ]; then
  echo "Compressing frameworks/proto_logging -> frameworks_proto_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_proto_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/proto_logging/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_dexter.tar.zst" ]; then
  echo "Compressing tools/dexter -> tools_dexter.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_dexter.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/dexter/ .
fi

rm -rf aosp
