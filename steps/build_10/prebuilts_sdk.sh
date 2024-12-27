set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/auto
clone_depth_platform external/javapoet
clone_depth_platform external/kotlinc
clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"
clone_sparse prebuilts/tools common/m2/repository/com/google/code/gson/gson/2.8.0 common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110 common/m2/repository/com/google/guava/guava/23.0 common/m2/repository/com/google/guava/guava/listenablefuture/1.0 common/m2/repository/commons-codec/commons-codec/1.10 common/m2/repository/com/squareup/javapoet/1.8.0 common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041 common/m2/repository/org/jetbrains/annotations/13.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0 common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0 common/m2/repository/org/jetbrains/trove4j/trove4j/20160824 common/m2/repository/org/ow2/asm/asm/6.1.1 common/m2/repository/org/ow2/asm/asm-tree/6.1.1 common/m2/repository/org/xerial/sqlite-jdbc/3.28.0

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/auto/common/auto_common^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/auto/value/auto_value_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/javapoet/javapoet^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-nodeps^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler-processing^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-migration^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/commons-codec^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/jetbrains-annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-metadata-jvm^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/symbol-processing-api^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/xerial-sqlite-jdbc^linux_glibc_common/ .

echo "building androidx.room_room-compiler^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja androidx.room_room-compiler,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/prebuilts/sdk/androidx.room_room-compiler^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-compiler^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_javapoet.tar.zst" ]; then
  echo "Compressing external/javapoet -> external_javapoet.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_javapoet.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/javapoet/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
