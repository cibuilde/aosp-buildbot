
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

echo "Preparing for external/auto"

clone_depth_platform external/auto
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .

echo "building auto_android_annotation_stubs^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja auto_android_annotation_stubs,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/android-annotation-stubs/auto_android_annotation_stubs^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_android_annotation_stubs^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/android-annotation-stubs/auto_android_annotation_stubs^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_android_annotation_stubs^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/auto/android-annotation-stubs/auto_android_annotation_stubs^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/auto/android-annotation-stubs/auto_android_annotation_stubs^linux_glibc_common/addition_copy_files.output

echo "building auto_factory_annotations^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja auto_factory_annotations,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_annotations^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_factory_annotations^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_annotations^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_factory_annotations^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_annotations^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_annotations^linux_glibc_common/addition_copy_files.output

echo "building auto_service_annotations^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja auto_service_annotations,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/service/auto_service_annotations^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_service_annotations^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/service/auto_service_annotations^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_service_annotations^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/auto/service/auto_service_annotations^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/auto/service/auto_service_annotations^linux_glibc_common/addition_copy_files.output

echo "building auto_value_annotations^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja auto_value_annotations,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_annotations^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_value_annotations^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_annotations^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_value_annotations^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_annotations^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_annotations^linux_glibc_common/addition_copy_files.output

echo "building auto_value_memoized_extension_annotations^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja auto_value_memoized_extension_annotations,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_memoized_extension_annotations^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_value_memoized_extension_annotations^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_memoized_extension_annotations^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/auto/auto_value_memoized_extension_annotations^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_memoized_extension_annotations^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_memoized_extension_annotations^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/auto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_auto.tar.zst --clobber

du -ah -d1 external_auto*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
