set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/kotlinc
clone_sparse prebuilts/gradle-plugin com/android/tools/build/manifest-merger/30.0.0-alpha14 com/android/tools/common/30.0.0-alpha14 com/android/tools/external/com-intellij/intellij-core/30.0.0-alpha14 com/android/tools/external/com-intellij/kotlin-compiler/30.0.0-alpha14 com/android/tools/external/org-jetbrains/uast/30.0.0-alpha14 com/android/tools/lint/lint/30.0.0-alpha14 com/android/tools/lint/lint-api/30.0.0-alpha14 com/android/tools/lint/lint-checks/30.0.0-alpha14 com/android/tools/lint/lint-gradle/30.0.0-alpha14 com/android/tools/lint/lint-model/30.0.0-alpha14 com/android/tools/repository/30.0.0-alpha14 com/android/tools/sdk-common/30.0.0-alpha14 com/android/tools/sdklib/30.0.0-alpha14
clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse prebuilts/tools common/m2/repository/com/google/code/gson/gson/2.8.0 common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110 common/m2/repository/com/google/guava/guava/23.0 common/m2/repository/com/google/guava/guava/listenablefuture/1.0 common/m2/repository/commons-codec/commons-codec/1.10 common/m2/repository/com/squareup/javapoet/1.8.0 common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041 common/m2/repository/org/jetbrains/annotations/13.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0 common/m2/repository/org/jetbrains/trove4j/trove4j/20160824 common/m2/repository/org/ow2/asm/asm/6.1.1 common/m2/repository/org/ow2/asm/asm-tree/6.1.1 common/m2/repository/org/xerial/sqlite-jdbc/3.28.0
clone_depth_platform tools/metalava

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/gen-kotlin-build-file.py^linux_glibc_x86_64_PY3/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-reflect^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk7^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib-jdk8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/gradle-plugin/metalava-gradle-plugin-deps^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/metalava-tools-common-m2-deps^linux_glibc_common/ .

echo "building metalava^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja metalava,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/tools/metalava/metalava^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/metalava/metalava^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/metalava/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 tools_metalava.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_gradle-plugin.tar.zst" ]; then
  echo "Compressing prebuilts/gradle-plugin -> prebuilts_gradle-plugin.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_gradle-plugin.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/gradle-plugin/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_metalava.tar.zst" ]; then
  echo "Compressing tools/metalava -> tools_metalava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_metalava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/metalava/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp