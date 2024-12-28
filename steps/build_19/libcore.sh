set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-all-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-all^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common/ .

echo "building core-generated-annotation-stubs^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja core-generated-annotation-stubs,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-generated-annotation-stubs^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/libcore/core-generated-annotation-stubs^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-generated-annotation-stubs^android_common

echo "building core-lambda-stubs-for-system-modules^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja core-lambda-stubs-for-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-lambda-stubs-for-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/libcore/core-lambda-stubs-for-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-lambda-stubs-for-system-modules^android_common

echo "building core-oj-hiddenapi-annotations^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja core-oj-hiddenapi-annotations,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/core-oj-hiddenapi-annotations^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/libcore/core-oj-hiddenapi-annotations^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/core-oj-hiddenapi-annotations^android_common

echo "building framework-api-annotations-lib^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja framework-api-annotations-lib,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/libcore/framework-api-annotations-lib^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/libcore/framework-api-annotations-lib^android_common.output . $GITHUB_WORKSPACE/artifacts/libcore/framework-api-annotations-lib^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/libcore/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_19 libcore.tar.zst --clobber

du -ah -d1 libcore*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi

rm -rf aosp
