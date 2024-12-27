set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/apache-commons-bcel
clone_depth_platform external/guava
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/apache-commons-bcel/apache-bcel^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/guava/guava-jre^linux_glibc_common/ .

echo "building annotationvisitor^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja annotationvisitor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/annotationvisitor/annotationvisitor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/tools/platform-compat/annotationvisitor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/annotationvisitor/annotationvisitor^linux_glibc_common

echo "building compat-processor^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_08.ninja compat-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/compat-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_08/tools/platform-compat/compat-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/compat-processor^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_08 tools_platform-compat.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-commons-bcel.tar.zst" ]; then
  echo "Compressing external/apache-commons-bcel -> external_apache-commons-bcel.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_apache-commons-bcel.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/apache-commons-bcel/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
