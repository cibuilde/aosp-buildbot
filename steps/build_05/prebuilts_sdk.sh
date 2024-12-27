set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/support/android-support-annotations-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.room_room-common-nodeps^linux_glibc_common/ .

echo "building android-support-annotations^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja android-support-annotations,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/android-support-annotations^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/support/android-support-annotations^android_common

echo "building androidx-constraintlayout_constraintlayout-solver^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx-constraintlayout_constraintlayout-solver,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common

echo "building androidx-constraintlayout_constraintlayout-solver^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx-constraintlayout_constraintlayout-solver,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx-constraintlayout_constraintlayout-solver^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/extras/constraint-layout-x/androidx-constraintlayout_constraintlayout-solver^android_common_apex30

echo "building androidx.annotation_annotation^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx.annotation_annotation,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx.annotation_annotation^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common

echo "building androidx.annotation_annotation^android_common_apex29"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx.annotation_annotation,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx.annotation_annotation^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex29

echo "building androidx.annotation_annotation^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx.annotation_annotation,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx.annotation_annotation^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30

echo "building androidx.room_room-common^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja androidx.room_room-common,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/prebuilts/sdk/androidx.room_room-common^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.room_room-common^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
