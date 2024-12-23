set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform prebuilts/tools

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building commons-codec^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja commons-codec,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/commons-codec^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/commons-codec^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/commons-codec^linux_glibc_common

echo "building gson-prebuilt-jar^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja gson-prebuilt-jar,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/gson-prebuilt-jar^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/gson-prebuilt-jar^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/gson-prebuilt-jar^linux_glibc_common

echo "building guava-listenablefuture-prebuilt-jar^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja guava-listenablefuture-prebuilt-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/guava-listenablefuture-prebuilt-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/guava-listenablefuture-prebuilt-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/guava-listenablefuture-prebuilt-jar^android_common

echo "building javapoet-prebuilt-jar^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja javapoet-prebuilt-jar,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/javapoet-prebuilt-jar^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/javapoet-prebuilt-jar^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/javapoet-prebuilt-jar^linux_glibc_common

echo "building jetbrains-annotations^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja jetbrains-annotations,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/jetbrains-annotations^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/jetbrains-annotations^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/jetbrains-annotations^linux_glibc_common

echo "building kotlinx-coroutines-android-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx-coroutines-android-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/kotlinx-coroutines-android-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common

echo "building kotlinx-coroutines-android-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx-coroutines-android-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/kotlinx-coroutines-android-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-android-nodeps^android_common_apex30

echo "building kotlinx-coroutines-core-nodeps^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx-coroutines-core-nodeps,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core-nodeps^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/kotlinx-coroutines-core-nodeps^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core-nodeps^android_common

echo "building kotlinx-coroutines-core-nodeps^android_common_apex30"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx-coroutines-core-nodeps,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core-nodeps^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/kotlinx-coroutines-core-nodeps^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-coroutines-core-nodeps^android_common_apex30

echo "building kotlinx-metadata-jvm^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja kotlinx-metadata-jvm,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-metadata-jvm^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/kotlinx-metadata-jvm^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/kotlinx-metadata-jvm^linux_glibc_common

echo "building metalava-tools-common-m2-deps^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja metalava-tools-common-m2-deps,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/metalava-tools-common-m2-deps^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/metalava-tools-common-m2-deps^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/metalava-tools-common-m2-deps^linux_glibc_common

echo "building symbol-processing-api^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja symbol-processing-api,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/symbol-processing-api^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/symbol-processing-api^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/symbol-processing-api^linux_glibc_common

echo "building xerial-sqlite-jdbc^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja xerial-sqlite-jdbc,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/xerial-sqlite-jdbc^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/tools/xerial-sqlite-jdbc^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/tools/common/m2/xerial-sqlite-jdbc^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/tools/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_tools.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst" ]; then
  echo "Compressing prebuilts/tools -> prebuilts_tools.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_tools.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/tools/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
