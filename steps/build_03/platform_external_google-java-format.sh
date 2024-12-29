set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-java-format
clone_depth_platform platform/external/google-java-format
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building google_java_format_android_annotation_stubs^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja google_java_format_android_annotation_stubs,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-java-format/google_java_format_android_annotation_stubs^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/platform/external/google-java-format/google_java_format_android_annotation_stubs^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/google-java-format/google_java_format_android_annotation_stubs^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_external_google-java-format.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/external/google-java-format/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 platform_external_google-java-format.tar.zst --clobber

du -ah -d1 platform_external_google-java-format*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-java-format.tar.zst" ]; then
  echo "Compressing external/google-java-format -> external_google-java-format.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_google-java-format.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/google-java-format/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_external_google-java-format.tar.zst" ]; then
  echo "Compressing platform/external/google-java-format -> platform_external_google-java-format.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_external_google-java-format.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/external/google-java-format/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp
