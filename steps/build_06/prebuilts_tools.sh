set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/kotlinc
clone_sparse prebuilts/tools common/m2/repository/com/google/code/gson/gson/2.8.0 common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110 common/m2/repository/com/google/guava/guava/23.0 common/m2/repository/com/google/guava/guava/listenablefuture/1.0 common/m2/repository/commons-codec/commons-codec/1.10 common/m2/repository/com/squareup/javapoet/1.8.0 common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041 common/m2/repository/org/jetbrains/annotations/13.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0 common/m2/repository/org/jetbrains/trove4j/trove4j/20160824 common/m2/repository/org/ow2/asm/asm/6.1.1 common/m2/repository/org/ow2/asm/asm-tree/6.1.1 common/m2/repository/org/xerial/sqlite-jdbc/3.28.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core^android_common_apex30/ .

echo "building kotlinx-coroutines-android^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja kotlinx-coroutines-android,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/tools/kotlinx-coroutines-android^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common

echo "building kotlinx-coroutines-android^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_06.ninja kotlinx-coroutines-android,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/prebuilts/tools/kotlinx-coroutines-android^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android^android_common_apex30

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 prebuilts_tools.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp