
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/libs/modules-utils"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/libs/modules-utils
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/singletons/sdk^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_module_lib_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-module-lib-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building modules-utils-os^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja modules-utils-os,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common/addition_copy_files.output

echo "building modules-utils-os^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja modules-utils-os,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex10000/addition_copy_files.output

echo "building modules-utils-os^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_19.ninja modules-utils-os,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_19/frameworks/libs/modules-utils/modules-utils-os^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex30 $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/java/com/android/modules/utils/modules-utils-os^android_common_apex30/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/libs/modules-utils/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_19 frameworks_libs_modules-utils.tar.zst --clobber

du -ah -d1 frameworks_libs_modules-utils*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst" ]; then
  echo "Compressing frameworks/libs/modules-utils -> frameworks_libs_modules-utils.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_libs_modules-utils.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/libs/modules-utils/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
