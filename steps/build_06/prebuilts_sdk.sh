set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/kotlinc
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"
clone_sparse prebuilts/tools common/m2/repository/com/google/code/gson/gson/2.8.0 common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110 common/m2/repository/com/google/guava/guava/23.0 common/m2/repository/com/google/guava/guava/listenablefuture/1.0 common/m2/repository/commons-codec/commons-codec/1.10 common/m2/repository/com/squareup/javapoet/1.8.0 common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041 common/m2/repository/org/jetbrains/annotations/13.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0 common/m2/repository/org/jetbrains/trove4j/trove4j/20160824 common/m2/repository/org/ow2/asm/asm/6.1.1 common/m2/repository/org/ow2/asm/asm-tree/6.1.1 common/m2/repository/org/xerial/sqlite-jdbc/3.28.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration-nodeps^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/gson-prebuilt-jar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/guava-listenablefuture-prebuilt-jar^android_common/ .

echo "building android-arch-core-common^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android-arch-core-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/android-arch-core-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-core-common^android_common

echo "building android-arch-lifecycle-common^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android-arch-lifecycle-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/android-arch-lifecycle-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/app-toolkit/android-arch-lifecycle-common^android_common

echo "building android-support-collections^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja android-support-collections,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/android-support-collections^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-collections^android_common

echo "building androidx.annotation_annotation-experimental-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.annotation_annotation-experimental-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.annotation_annotation-experimental-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common

echo "building androidx.annotation_annotation-experimental-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.annotation_annotation-experimental-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.annotation_annotation-experimental-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation-experimental-nodeps^android_common_apex30

echo "building androidx.arch.core_core-common^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.arch.core_core-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.arch.core_core-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common

echo "building androidx.arch.core_core-common^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.arch.core_core-common,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.arch.core_core-common^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-common^android_common_apex30

echo "building androidx.arch.core_core-runtime-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.arch.core_core-runtime-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.arch.core_core-runtime-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common

echo "building androidx.arch.core_core-runtime-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.arch.core_core-runtime-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.arch.core_core-runtime-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.arch.core_core-runtime-nodeps^android_common_apex30

echo "building androidx.collection_collection^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.collection_collection,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.collection_collection^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common

echo "building androidx.collection_collection^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.collection_collection,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.collection_collection^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common_apex30

echo "building androidx.concurrent_concurrent-futures^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.concurrent_concurrent-futures,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.concurrent_concurrent-futures^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.concurrent_concurrent-futures^android_common

echo "building androidx.cursoradapter_cursoradapter-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.cursoradapter_cursoradapter-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.cursoradapter_cursoradapter-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common

echo "building androidx.cursoradapter_cursoradapter-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.cursoradapter_cursoradapter-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.cursoradapter_cursoradapter-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.cursoradapter_cursoradapter-nodeps^android_common_apex30

echo "building androidx.documentfile_documentfile-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.documentfile_documentfile-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.documentfile_documentfile-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common

echo "building androidx.documentfile_documentfile-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.documentfile_documentfile-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.documentfile_documentfile-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.documentfile_documentfile-nodeps^android_common_apex30

echo "building androidx.exifinterface_exifinterface-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.exifinterface_exifinterface-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.exifinterface_exifinterface-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.exifinterface_exifinterface-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.exifinterface_exifinterface-nodeps^android_common

echo "building androidx.interpolator_interpolator-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.interpolator_interpolator-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.interpolator_interpolator-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common

echo "building androidx.interpolator_interpolator-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.interpolator_interpolator-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.interpolator_interpolator-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.interpolator_interpolator-nodeps^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.lifecycle_lifecycle-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.lifecycle_lifecycle-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common

echo "building androidx.lifecycle_lifecycle-common^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.lifecycle_lifecycle-common,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.lifecycle_lifecycle-common^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common_apex30

echo "building androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.lifecycle_lifecycle-viewmodel-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common

echo "building androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.lifecycle_lifecycle-viewmodel-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-viewmodel-nodeps^android_common_apex30

echo "building androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.localbroadcastmanager_localbroadcastmanager-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common

echo "building androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.localbroadcastmanager_localbroadcastmanager-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.localbroadcastmanager_localbroadcastmanager-nodeps^android_common_apex30

echo "building androidx.print_print-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.print_print-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.print_print-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common

echo "building androidx.print_print-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.print_print-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.print_print-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.print_print-nodeps^android_common_apex30

echo "building androidx.remotecallback_remotecallback-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.remotecallback_remotecallback-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.remotecallback_remotecallback-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.remotecallback_remotecallback-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.remotecallback_remotecallback-nodeps^android_common

echo "building androidx.room_room-common^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.room_room-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.room_room-common^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^android_common

echo "building androidx.room_room-migration^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.room_room-migration,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.room_room-migration^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration^linux_glibc_common

echo "building androidx.savedstate_savedstate-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.savedstate_savedstate-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.savedstate_savedstate-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common

echo "building androidx.savedstate_savedstate-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.savedstate_savedstate-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.savedstate_savedstate-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.savedstate_savedstate-nodeps^android_common_apex30

echo "building androidx.sqlite_sqlite-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.sqlite_sqlite-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.sqlite_sqlite-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.sqlite_sqlite-nodeps^android_common

echo "building androidx.tracing_tracing-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.tracing_tracing-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.tracing_tracing-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common

echo "building androidx.tracing_tracing-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.tracing_tracing-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.tracing_tracing-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.tracing_tracing-nodeps^android_common_apex30

echo "building androidx.versionedparcelable_versionedparcelable-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.versionedparcelable_versionedparcelable-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.versionedparcelable_versionedparcelable-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common

echo "building androidx.versionedparcelable_versionedparcelable-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja androidx.versionedparcelable_versionedparcelable-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/sdk/androidx.versionedparcelable_versionedparcelable-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.versionedparcelable_versionedparcelable-nodeps^android_common_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
