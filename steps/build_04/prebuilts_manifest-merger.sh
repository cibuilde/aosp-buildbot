
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

echo "Preparing for prebuilts/manifest-merger"

clone_depth_platform build/soong
clone_depth_platform external/kotlinc
clone_depth_platform prebuilts/manifest-merger
clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"
clone_project platform/prebuilts/tools prebuilts/tools android12-gsi "/common/m2/repository/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar" "/common/m2/repository/com/google/devtools/ksp/symbol-processing-api/1.4.10-dev-experimental-20201110/symbol-processing-api-1.4.10-dev-experimental-20201110.jar" "/common/m2/repository/com/google/guava/guava/23.0/guava-23.0.jar" "/common/m2/repository/com/google/guava/guava/listenablefuture/1.0/listenablefuture-1.0.jar" "/common/m2/repository/commons-codec/commons-codec/1.10/commons-codec-1.10.jar" "/common/m2/repository/com/squareup/javapoet/1.8.0/javapoet-1.8.0.jar" "/common/m2/repository/javax/xml/bind/jaxb-api/2.2.12-b140109.1041/jaxb-api-2.2.12-b140109.1041.jar" "/common/m2/repository/org/jetbrains/annotations/13.0/annotations-13.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-android/1.3.0/kotlinx-coroutines-android-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-coroutines-core/1.3.0/kotlinx-coroutines-core-1.3.0.jar" "/common/m2/repository/org/jetbrains/kotlinx/kotlinx-metadata-jvm/0.1.0/kotlinx-metadata-jvm-0.1.0.jar" "/common/m2/repository/org/jetbrains/trove4j/trove4j/20160824/trove4j-20160824.jar" "/common/m2/repository/org/ow2/asm/asm/6.1.1/asm-6.1.1.jar" "/common/m2/repository/org/ow2/asm/asm-tree/6.1.1/asm-tree-6.1.1.jar" "/common/m2/repository/org/xerial/sqlite-jdbc/3.28.0/sqlite-jdbc-3.28.0.jar"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/manifest-merger/manifest-merger-jars^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/tools/common/m2/gson-prebuilt-jar^linux_glibc_common/ .

echo "building manifest-merger^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja manifest-merger,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/manifest-merger/manifest-merger^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/prebuilts/manifest-merger/manifest-merger^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_common/addition_copy_files.output

echo "building manifest-merger^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja manifest-merger,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/manifest-merger^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/manifest-merger/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_manifest-merger.tar.zst --clobber

du -ah -d1 prebuilts_manifest-merger*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst" ]; then
  echo "Compressing prebuilts/manifest-merger -> prebuilts_manifest-merger.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_manifest-merger.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/manifest-merger/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi


rm -rf aosp
