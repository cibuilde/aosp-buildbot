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
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/harfbuzz_ng
clone_depth_platform external/icu
clone_depth_platform external/javaparser
clone_depth_platform external/kotlinc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libxml2
clone_depth_platform external/protobuf
clone_depth_platform external/skia
clone_depth_platform external/vulkan-headers
clone_depth_platform external/zlib
clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/minikin
clone_depth_platform frameworks/native
clone_depth_platform frameworks/proto_logging
clone_depth_platform hardware/interfaces
clone_depth_platform hardware/libhardware
clone_depth_platform hardware/libhardware_legacy
clone_depth_platform hardware/ril
clone_depth_platform libnativehelper
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"
clone_depth_platform system/bt
clone_depth_platform system/core
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libfmq
clone_depth_platform system/libhidl
clone_depth_platform system/libhwbinder
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/netd
clone_depth_platform system/tools/aidl
clone_depth_platform system/unwinding

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/api_levels^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndk_api_coverage_parser/ndk_api_coverage_parser^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/ndkstubgen/ndkstubgen^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/cts/libs/json/json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/javaparser/javaparser^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/java/android.os.permissions_aidl-rust-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/incident_section_gen/incident-section-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libplatformprotos^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/platformprotos^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/remote-color-resources-compile-colors^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/remote-color-resources-compile-public^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/libstats_proto_host^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/proto_logging/stats/stats_log_api_gen/stats-log-api-gen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_checker^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/sysprop/sysprop_api_dump^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building android.os.permissions_aidl-rust^android_x86_64_source"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja android.os.permissions_aidl-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/android.os.permissions_aidl-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust^android_x86_64_source

echo "building codegen-version-info^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja codegen-version-info,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/codegen/codegen-version-info^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/codegen-version-info^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/codegen/codegen-version-info^linux_glibc_common

echo "building com.android.sysprop.localization_sysprop_library^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja com.android.sysprop.localization_sysprop_library,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_sysprop_library^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/com.android.sysprop.localization_sysprop_library^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.localization_sysprop_library^

echo "building com.android.sysprop.watchdog_sysprop_library^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja com.android.sysprop.watchdog_sysprop_library,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_sysprop_library^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/com.android.sysprop.watchdog_sysprop_library^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/sysprop/com.android.sysprop.watchdog_sysprop_library^

echo "building device-state-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja device-state-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/device-state-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/device-state-config^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/device-state-config^

echo "building display-device-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja display-device-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/display-device-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/display-device-config^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/display-device-config^

echo "building display-layout-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja display-layout-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/display-layout-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/display-layout-config^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/display-layout-config^

echo "building incident_sections^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja incident_sections,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incident/incident_sections^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/incident_sections^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incident/incident_sections^

echo "building incidentd_section_list^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja incidentd_section_list,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incidentd/incidentd_section_list^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/incidentd_section_list^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incidentd/incidentd_section_list^

echo "building libamidi.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_29

echo "building libamidi.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_30

echo "building libamidi.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_31

echo "building libamidi.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_REL

echo "building libamidi.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_64_sdk_shared_current

echo "building libamidi.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_29

echo "building libamidi.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_30

echo "building libamidi.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_31

echo "building libamidi.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libamidi.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libamidi.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libamidi.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/native/midi/libamidi.ndk^android_x86_x86_64_sdk_shared_current

echo "building libandroid.ndk^android_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_21

echo "building libandroid.ndk^android_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_22

echo "building libandroid.ndk^android_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_23

echo "building libandroid.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_24

echo "building libandroid.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_25

echo "building libandroid.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_26

echo "building libandroid.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_27

echo "building libandroid.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_28

echo "building libandroid.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_29

echo "building libandroid.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_30

echo "building libandroid.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_31

echo "building libandroid.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_REL

echo "building libandroid.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_64_sdk_shared_current

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_16"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_16

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_17"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_17

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_18"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_18

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_19"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_19

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_20"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_20

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_21

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_22

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_23

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_24

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_25

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_26

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_27

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_28

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_29

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_30

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_31

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libandroid.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid.ndk^android_x86_x86_64_sdk_shared_current

echo "building libandroid^android_x86_64_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid,android_x86_64_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_64_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid^android_x86_64_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_64_shared_31

echo "building libandroid^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_64_shared_current

echo "building libandroid^android_x86_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libandroid,android_x86_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libandroid^android_x86_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/android/libandroid^android_x86_x86_64_shared_current

echo "building libincident^android_x86_64_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libincident,android_x86_64_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/incident/libincident^android_x86_64_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libincident^android_x86_64_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/incident/libincident^android_x86_64_shared_current

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_21

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_22

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_23

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_24

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_25

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_26

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_27

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_28

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_29

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_30

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_31

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_REL

echo "building libjnigraphics.ndk^android_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_64_sdk_shared_current

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_16
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_16

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_17
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_17

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_18
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_18

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_19
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_19

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_20
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_20

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_21
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_21

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_22
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_22

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_23
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_23

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_24
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_24

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_25
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_25

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_26
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_26

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_27
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_27

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_28
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_28

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_29

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_30

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_31
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_31

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_REL
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_REL

echo "building libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja libjnigraphics.ndk,android_x86_x86_64_sdk_shared_current
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/native/graphics/jni/libjnigraphics.ndk^android_x86_x86_64_sdk_shared_current

echo "building platform-compat-config^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja platform-compat-config,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/platform-compat-config^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/platform-compat-config^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/platform-compat-config^

echo "building platform-compat-overrides^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja platform-compat-overrides,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/platform-compat-overrides^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/platform-compat-overrides^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/xsd/platform-compat-overrides^

echo "building protologtool-lib^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja protologtool-lib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool-lib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/protologtool-lib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool-lib^linux_glibc_common

echo "building remote-color-resources-apk^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja remote-color-resources-apk,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-apk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/remote-color-resources-apk^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-apk^

echo "building sdkparcelables^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdkparcelables,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/sdkparcelables^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_common

echo "building statslog-SystemUI-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-SystemUI-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/statslog-SystemUI-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog-SystemUI-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SystemUI/shared/statslog-SystemUI-java-gen^

echo "building statslog-appsearch-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-appsearch-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog-appsearch-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/apex/appsearch/service/statslog-appsearch-java-gen^

echo "building statslog-art-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-art-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/statslog-art-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog-art-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/core/statslog-art-java-gen^

echo "building statslog-framework-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-framework-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/statslog-framework-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog-framework-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/statslog-framework-java-gen^

echo "building statslog-telephony-common-java-gen^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog-telephony-common-java-gen,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/telephony/common/statslog-telephony-common-java-gen^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog-telephony-common-java-gen^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/telephony/common/statslog-telephony-common-java-gen^

echo "building statslog_hwui.cpp^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_hwui.cpp,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.cpp^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog_hwui.cpp^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.cpp^

echo "building statslog_hwui.h^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja statslog_hwui.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/frameworks/base/statslog_hwui.h^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libs/hwui/statslog_hwui.h^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 frameworks_base.tar.zst --clobber

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_harfbuzz_ng.tar.zst" ]; then
  echo "Compressing external/harfbuzz_ng -> external_harfbuzz_ng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_harfbuzz_ng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/harfbuzz_ng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javaparser.tar.zst" ]; then
  echo "Compressing external/javaparser -> external_javaparser.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javaparser.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javaparser/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_skia.tar.zst" ]; then
  echo "Compressing external/skia -> external_skia.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_skia.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/skia/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst" ]; then
  echo "Compressing external/vulkan-headers -> external_vulkan-headers.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_vulkan-headers.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/vulkan-headers/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_minikin.tar.zst" ]; then
  echo "Compressing frameworks/minikin -> frameworks_minikin.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_minikin.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/minikin/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/libnativehelper.tar.zst" ]; then
  echo "Compressing libnativehelper -> libnativehelper.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libnativehelper.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libnativehelper/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
