set -e

echo "entering external/javaparser"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/javaparser
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .

echo "building javaparser^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja javaparser,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/javaparser/javaparser^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/javaparser/javaparser^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/javaparser/javaparser^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_javaparser.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/javaparser/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_javaparser.tar.zst --clobber

du -ah -d1 external_javaparser*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_javaparser.tar.zst" ]; then
  echo "Compressing external/javaparser -> external_javaparser.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javaparser.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javaparser/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi

rm -rf aosp