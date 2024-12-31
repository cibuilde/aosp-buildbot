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
clone_depth_platform build/soong
clone_project platform/cts cts android12-gsi "/libs/json"
clone_depth_platform external/expat
clone_depth_platform external/fmtlib
clone_depth_platform external/googletest
clone_depth_platform external/javaparser
clone_depth_platform external/javapoet
clone_depth_platform external/kotlinc
clone_depth_platform external/libcxx
clone_depth_platform external/libcxxabi
clone_depth_platform external/libpng
clone_depth_platform external/mime-support
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
clone_depth_platform packages/modules/Connectivity
clone_depth_platform packages/modules/Permission
clone_depth_platform packages/modules/StatsD
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 android12-gsi "/sysroot" "/lib/gcc/x86_64-linux/4.8.3" "/x86_64-linux/lib64" "/x86_64-linux/lib32"
clone_depth_platform prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/jdk/jdk8 prebuilts/jdk/jdk8 android12-gsi "/linux-x86"
clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"
clone_project platform/prebuilts/tools prebuilts/tools android12-gsi "/common/m2/repository/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar" "/common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110/symbol-processing-api-1.4.10-dev-experimental-20201110.jar" "/common/m2/repository/com/google/guava/guava/23.0/guava-23.0.jar" "/common/m2/repository/com/google/guava/guava/listenablefuture/1.0/listenablefuture-1.0.jar" "/common/m2/repository/commons-codec/commons-codec/1.10/commons-codec-1.10.jar" "/common/m2/repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar" "/common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041/jaxb-api-2.2.12-b140109.1041.jar" "/common/m2/repository/org/jetbrains/annotations/13.0/annotations-13.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0/kotlinx-coroutines-android-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0/kotlinx-coroutines-core-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0/kotlinx-metadata-jvm-0.1.0.jar" "/common/m2/repository/org/jetbrains/trove4j/trove4j/20160824/trove4j-20160824.jar" "/common/m2/repository/org/ow2/asm/asm/6.1.1/asm-6.1.1.jar" "/common/m2/repository/org/ow2/asm/asm-tree/6.1.1/asm-tree-6.1.1.jar" "/common/m2/repository/org/xerial/sqlite-jdbc/3.28.0/sqlite-jdbc-3.28.0.jar"
clone_depth_platform system/bt
clone_depth_platform system/connectivity/wificond
clone_depth_platform system/core
clone_depth_platform system/gsid
clone_depth_platform system/incremental_delivery
clone_depth_platform system/libbase
clone_depth_platform system/libziparchive
clone_depth_platform system/logging
clone_depth_platform system/media
clone_depth_platform system/security
clone_depth_platform system/tools/aidl
clone_depth_platform system/unwinding
clone_depth_platform system/update_engine
clone_depth_platform system/vold
clone_depth_platform tools/metalava

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cc/libbuildversion/libbuildversion^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/cts/libs/json/json^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/expat/libexpat^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/javaparser/javaparser^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/javapoet/javapoet^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++_static^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libpng/libpng^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/mime-support/debian.mime.types.minimized^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-cpp-full^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-java-full^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/zlib/libz^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/mime/android.mime.types.minimized^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/libs/androidfw/libandroidfw^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/cmds/idmap2/libidmap2_policies^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/streaming_proto/protoc-gen-cppstream^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/streaming_proto/protoc-gen-javastream^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/mime/vendor.mime.types.minimized^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/javapoet-prebuilt-jar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libcutils/libcutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/core/libutils/libutils^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libbase/libbase^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/libziparchive/libziparchive^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/logging/liblog/liblog^linux_glibc_x86_64_static/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl-cpp^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/stub-annotations^linux_glibc_common/ .

echo "building SettingsLib-annotation-processor^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja SettingsLib-annotation-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/search/SettingsLib-annotation-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/SettingsLib-annotation-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/packages/SettingsLib/search/SettingsLib-annotation-processor^linux_glibc_common

echo "building aapt2^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja aapt2,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/aapt2^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64

echo "building android.os.permissions_aidl-rust-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.os.permissions_aidl-rust-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/android.os.permissions_aidl-rust-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust-source^

echo "building android.os.permissions_aidl-rust^android_x86_64_source"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja android.os.permissions_aidl-rust,android_x86_64_source
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust^android_x86_64_source
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/android.os.permissions_aidl-rust^android_x86_64_source.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/java/android.os.permissions_aidl-rust^android_x86_64_source

echo "building audio_common-aidl-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audio_common-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/audio_common-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/audio_common-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/audio_common-aidl-cpp-source^

echo "building audio_common-aidl-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja audio_common-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/audio_common-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/audio_common-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/audio_common-aidl-java-source^

echo "building codegen-version-info^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja codegen-version-info,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/codegen/codegen-version-info^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/codegen-version-info^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/codegen/codegen-version-info^linux_glibc_common

echo "building framework-cppstream-protos^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-cppstream-protos,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-cppstream-protos^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/framework-cppstream-protos^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-cppstream-protos^

echo "building framework-javastream-protos^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-javastream-protos,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-javastream-protos^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/framework-javastream-protos^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-javastream-protos^

echo "building framework-minus-apex^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja framework-minus-apex,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/framework-minus-apex^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-minus-apex^android_common

echo "building incident-section-gen^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja incident-section-gen,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/incident_section_gen/incident-section-gen^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/incident-section-gen^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/incident_section_gen/incident-section-gen^linux_glibc_x86_64

echo "building incident_sections^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja incident_sections,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incident/incident_sections^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/incident_sections^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incident/incident_sections^

echo "building incidentd_section_list^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja incidentd_section_list,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incidentd/incidentd_section_list^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/incidentd_section_list^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/incidentd/incidentd_section_list^

echo "building libaapt2^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libaapt2,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/libaapt2^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libaapt2^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/libaapt2^linux_glibc_x86_64_static

echo "building libidmap2_protos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libidmap2_protos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_protos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libidmap2_protos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2_protos^android_x86_64_static

echo "building libidmap2daidl^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libidmap2daidl,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2daidl^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libidmap2daidl^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/libidmap2daidl^android_x86_64_static

echo "building libplatformprotos^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libplatformprotos,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libplatformprotos^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^android_x86_64_static

echo "building libplatformprotos^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libplatformprotos,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libplatformprotos^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^android_x86_x86_64_static

echo "building libplatformprotos^linux_glibc_x86_64_shared"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libplatformprotos,linux_glibc_x86_64_shared
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^linux_glibc_x86_64_shared
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libplatformprotos^linux_glibc_x86_64_shared.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^linux_glibc_x86_64_shared

echo "building libplatformprotos^linux_glibc_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja libplatformprotos,linux_glibc_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^linux_glibc_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/libplatformprotos^linux_glibc_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/libplatformprotos^linux_glibc_x86_64_static

echo "building lockedregioncodeinjection^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja lockedregioncodeinjection,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/locked_region_code_injection/lockedregioncodeinjection^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/lockedregioncodeinjection^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/locked_region_code_injection/lockedregioncodeinjection^linux_glibc_common

echo "building media_permission-aidl-cpp-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja media_permission-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/media_permission-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/media_permission-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/media_permission-aidl-cpp-source^

echo "building media_permission-aidl-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja media_permission-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/media_permission-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/media_permission-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/media_permission-aidl-java-source^

echo "building mimemap-res.jar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja mimemap-res.jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/mime/mimemap-res.jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/mimemap-res.jar^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/mime/mimemap-res.jar^android_common

echo "building overlayable_policy_aidl-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja overlayable_policy_aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/overlayable_policy_aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/overlayable_policy_aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/cmds/idmap2/overlayable_policy_aidl-java-source^

echo "building platformprotos^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja platformprotos,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/platformprotos^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/platformprotos^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/platformprotos^linux_glibc_common

echo "building protologtool-lib^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja protologtool-lib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool-lib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/protologtool-lib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool-lib^linux_glibc_common

echo "building protologtool^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja protologtool,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/protologtool^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/protologtool/protologtool^linux_glibc_common

echo "building remote-color-resources-apk^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja remote-color-resources-apk,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-apk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/remote-color-resources-apk^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-apk^

echo "building remote-color-resources-arsc-zip^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja remote-color-resources-arsc-zip,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-arsc-zip^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/remote-color-resources-arsc-zip^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-arsc-zip^

echo "building remote-color-resources-arsc^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja remote-color-resources-arsc,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-arsc^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/remote-color-resources-arsc^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-arsc^

echo "building remote-color-resources-compile-colors^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja remote-color-resources-compile-colors,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-compile-colors^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/remote-color-resources-compile-colors^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-compile-colors^

echo "building remote-color-resources-compile-public^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja remote-color-resources-compile-public,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-compile-public^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/remote-color-resources-compile-public^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/core/res/remote-color-resources-compile-public^

echo "building sdkparcelables^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja sdkparcelables,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/sdkparcelables^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_common

echo "building sdkparcelables^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja sdkparcelables,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/sdkparcelables^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_x86_64

echo "building service.incremental.proto^android_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja service.incremental.proto,android_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/incremental/service.incremental.proto^android_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/service.incremental.proto^android_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/incremental/service.incremental.proto^android_x86_64_static

echo "building service.incremental.proto^android_x86_x86_64_static"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja service.incremental.proto,android_x86_x86_64_static
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/services/incremental/service.incremental.proto^android_x86_x86_64_static
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/service.incremental.proto^android_x86_x86_64_static.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/services/incremental/service.incremental.proto^android_x86_x86_64_static

echo "building soundtrigger_middleware-aidl-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja soundtrigger_middleware-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/soundtrigger_middleware-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/soundtrigger_middleware-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/soundtrigger_middleware-aidl-java-source^

echo "building staledataclass-annotation-processor^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja staledataclass-annotation-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/processors/staledataclass/staledataclass-annotation-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/staledataclass-annotation-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/processors/staledataclass/staledataclass-annotation-processor^linux_glibc_common

echo "building tv_tuner_resource_manager_aidl_interface-java-source^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja tv_tuner_resource_manager_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/media/java/android/media/tv/tunerresourcemanager/tv_tuner_resource_manager_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/tv_tuner_resource_manager_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/media/java/android/media/tv/tunerresourcemanager/tv_tuner_resource_manager_aidl_interface-java-source^

echo "building view-inspector-annotation-processor^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja view-inspector-annotation-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/processors/view_inspector/view-inspector-annotation-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/base/view-inspector-annotation-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/processors/view_inspector/view-inspector-annotation-processor^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h

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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_expat.tar.zst" ]; then
  echo "Compressing external/expat -> external_expat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_expat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/expat/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst" ]; then
  echo "Compressing external/fmtlib -> external_fmtlib.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_fmtlib.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/fmtlib/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_googletest.tar.zst" ]; then
  echo "Compressing external/googletest -> external_googletest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_googletest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/googletest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javaparser.tar.zst" ]; then
  echo "Compressing external/javaparser -> external_javaparser.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javaparser.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javaparser/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javapoet.tar.zst" ]; then
  echo "Compressing external/javapoet -> external_javapoet.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javapoet.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javapoet/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/external_libpng.tar.zst" ]; then
  echo "Compressing external/libpng -> external_libpng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libpng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libpng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_mime-support.tar.zst" ]; then
  echo "Compressing external/mime-support -> external_mime-support.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_mime-support.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/mime-support/ .
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
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst" ]; then
  echo "Compressing packages/modules/Connectivity -> packages_modules_Connectivity.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Connectivity.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Connectivity/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst" ]; then
  echo "Compressing packages/modules/Permission -> packages_modules_Permission.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Permission.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Permission/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst" ]; then
  echo "Compressing packages/modules/StatsD -> packages_modules_StatsD.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_StatsD.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/StatsD/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8 -> prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_host_x86_64-linux-glibc2.17-4.8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst" ]; then
  echo "Compressing prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 -> prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk8 -> prebuilts_jdk_jdk8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk8/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_bt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_connectivity_wificond.tar.zst" ]; then
  echo "Compressing system/connectivity/wificond -> system_connectivity_wificond.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_connectivity_wificond.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/connectivity/wificond/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_core.tar.zst" ]; then
  echo "Compressing system/core -> system_core.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_core.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/core/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_gsid.tar.zst" ]; then
  echo "Compressing system/gsid -> system_gsid.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_gsid.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/gsid/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst" ]; then
  echo "Compressing system/incremental_delivery -> system_incremental_delivery.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_incremental_delivery.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/incremental_delivery/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libbase.tar.zst" ]; then
  echo "Compressing system/libbase -> system_libbase.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libbase.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libbase/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst" ]; then
  echo "Compressing system/libziparchive -> system_libziparchive.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_libziparchive.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/libziparchive/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_logging.tar.zst" ]; then
  echo "Compressing system/logging -> system_logging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_logging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/logging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_media.tar.zst" ]; then
  echo "Compressing system/media -> system_media.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_media.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/media/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_security.tar.zst" ]; then
  echo "Compressing system/security -> system_security.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_security.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/security/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_unwinding.tar.zst" ]; then
  echo "Compressing system/unwinding -> system_unwinding.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_unwinding.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/unwinding/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_update_engine.tar.zst" ]; then
  echo "Compressing system/update_engine -> system_update_engine.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_update_engine.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/update_engine/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_vold.tar.zst" ]; then
  echo "Compressing system/vold -> system_vold.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_vold.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/vold/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_metalava.tar.zst" ]; then
  echo "Compressing tools/metalava -> tools_metalava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/metalava/ .
fi

rm -rf aosp
