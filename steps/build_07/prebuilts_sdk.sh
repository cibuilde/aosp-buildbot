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
clone_sparse_exclude prebuilts/sdk "!/tools/windows" "!/tools/darwin" "!/*/test/" "!/**/android-non-updatable.jar"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/kotlinc/kotlin-stdlib^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.annotation_annotation^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.collection_collection^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8-nodeps^android_common_apex30/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common^android_common_apex30/ .

echo "building androidx.collection_collection-ktx^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja androidx.collection_collection-ktx,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/androidx.collection_collection-ktx^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx^android_common

echo "building androidx.collection_collection-ktx^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja androidx.collection_collection-ktx,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/androidx.collection_collection-ktx^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.collection_collection-ktx^android_common_apex30

echo "building androidx.lifecycle_lifecycle-common-java8^android_common_apex30"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja androidx.lifecycle_lifecycle-common-java8,android_common_apex30
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8^android_common_apex30
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/androidx.lifecycle_lifecycle-common-java8^android_common_apex30.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/current/androidx/androidx.lifecycle_lifecycle-common-java8^android_common_apex30

echo "building sdk_public_30_core-for-system-modules^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdk_public_30_core-for-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_30_core-for-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/sdk_public_30_core-for-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_30_core-for-system-modules^android_common

echo "building sdk_public_31_core-for-system-modules^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdk_public_31_core-for-system-modules,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_31_core-for-system-modules^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/sdk_public_31_core-for-system-modules^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_public_31_core-for-system-modules^android_common

echo "building sdk_system_current_android.net.ipsec.ike^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdk_system_current_android.net.ipsec.ike,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_system_current_android.net.ipsec.ike^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/sdk_system_current_android.net.ipsec.ike^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_system_current_android.net.ipsec.ike^android_common

echo "building sdk_system_current_android^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja sdk_system_current_android,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_system_current_android^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/prebuilts/sdk/sdk_system_current_android^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/sdk_system_current_android^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/sdk/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 prebuilts_sdk.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst" ]; then
  echo "Compressing external/kotlinc -> external_kotlinc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_kotlinc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/kotlinc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst" ]; then
  echo "Compressing prebuilts/sdk -> prebuilts_sdk.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_sdk.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/sdk/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
