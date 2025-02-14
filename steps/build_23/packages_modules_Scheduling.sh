
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

echo "Preparing for packages/modules/Scheduling"

clone_depth_platform art
clone_project platform/cts cts android12-gsi "/libs/json"
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore
clone_depth_platform packages/modules/Scheduling
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/hiddenapi/generate_hiddenapi_lists^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/common/libicuuc^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/icu4c/source/i18n/libicui18n^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/sqlite/dist/libsqlite^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android-non-updatable.stubs.test^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/art.module.public.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling.stubs.source.module_lib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling.stubs.source.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling.stubs.source^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling.stubs.system^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/framework/framework-scheduling^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/Scheduling/service/statslog-scheduling-java-gen^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/modules/common/tools/conv_classpaths_proto^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/metalava/metalava^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64/ .

echo "building com.android.scheduling-bootclasspath-fragment^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja com.android.scheduling-bootclasspath-fragment,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/packages/modules/Scheduling/com.android.scheduling-bootclasspath-fragment^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/packages/modules/Scheduling/com.android.scheduling-bootclasspath-fragment^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/apex/com.android.scheduling-bootclasspath-fragment^android_common_apex10000/addition_copy_files.output

echo "building scheduling-statsd^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja scheduling-statsd,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/scheduling-statsd^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/packages/modules/Scheduling/scheduling-statsd^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/scheduling-statsd^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/packages/modules/Scheduling/scheduling-statsd^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/scheduling-statsd^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/scheduling-statsd^android_common_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Scheduling.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_23 packages_modules_Scheduling.tar.zst --clobber

du -ah -d1 packages_modules_Scheduling*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/cts.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst" ]; then
  echo "Compressing packages/modules/Scheduling -> packages_modules_Scheduling.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Scheduling/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
