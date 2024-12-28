set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/auto
clone_depth_platform external/google-java-format
clone_depth_platform external/guava
clone_depth_platform external/javapoet
clone_depth_platform external/jsr330
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/android-annotation-stubs/auto_android_annotation_stubs^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/common/auto_common^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/factory/auto_factory_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/value/auto_value_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/value/auto_value_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/google-java-format/google_java_format^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guava/guava-jre^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/javapoet/javapoet^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jsr330/jsr330^linux_glibc_common/ .

echo "building auto_factory_plugin^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_11.ninja auto_factory_plugin,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_plugin^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_11/external/auto/auto_factory_plugin^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/auto/factory/auto_factory_plugin^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/auto/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_11 external_auto.tar.zst --clobber

du -ah -d1 external_auto*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-java-format.tar.zst" ]; then
  echo "Compressing external/google-java-format -> external_google-java-format.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_google-java-format.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/google-java-format/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javapoet.tar.zst" ]; then
  echo "Compressing external/javapoet -> external_javapoet.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javapoet.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javapoet/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jsr330.tar.zst" ]; then
  echo "Compressing external/jsr330 -> external_jsr330.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jsr330.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jsr330/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
