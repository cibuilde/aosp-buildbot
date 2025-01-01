set -e

echo "entering external/guava"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/error_prone
clone_depth_platform external/guava
clone_depth_platform external/jsr305
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/jdk/jdk8 prebuilts/jdk/jdk8 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/error_prone/error_prone_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guava/guava-android-annotation-stubs^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsr305/jsr305^linux_glibc_common/ .

echo "building guava-android-host^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guava-android-host,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava-android-host^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-android-host^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava-android-host^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-android-host^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/guava/guava-android-host^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/guava/guava-android-host^linux_glibc_common/addition_copy_files.output

echo "building guava-both^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guava-both,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava-both^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-both^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava-both^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-both^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/guava/guava-both^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/guava/guava-both^linux_glibc_common/addition_copy_files.output

echo "building guava-jre^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guava-jre,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-jre^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava-jre^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common/addition_copy_files.output

echo "building guava^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guava,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava^android_common.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava^android_common.output $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common/addition_copy_files.output

echo "building guava^android_common_apex30"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja guava,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/guava/guava^android_common_apex30.output $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30 $GITHUB_WORKSPACE/artifacts/external/guava/guava^android_common_apex30/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/guava/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_guava.tar.zst --clobber

du -ah -d1 external_guava*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_error_prone.tar.zst" ]; then
  echo "Compressing external/error_prone -> external_error_prone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_error_prone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/error_prone/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsr305.tar.zst" ]; then
  echo "Compressing external/jsr305 -> external_jsr305.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsr305.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsr305/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk8 -> prebuilts_jdk_jdk8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk8/ .
fi

rm -rf aosp
