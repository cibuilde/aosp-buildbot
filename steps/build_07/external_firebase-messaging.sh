set -e

echo "entering external/firebase-messaging"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/firebase-messaging
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/symbol_inject/cmd/symbol_inject^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .

echo "building firebase-common-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-common-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-common-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-common-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-common-aar^android_common

echo "building firebase-components-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-components-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-components-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-components-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-components-aar^android_common

echo "building firebase-datatransport-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-datatransport-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-datatransport-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-datatransport-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-datatransport-aar^android_common

echo "building firebase-encoders-json-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-encoders-json-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-json-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-encoders-json-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-json-aar^android_common

echo "building firebase-iid-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-iid-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-iid-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-iid-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-iid-aar^android_common

echo "building firebase-iid-interop-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-iid-interop-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-iid-interop-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-iid-interop-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-iid-interop-aar^android_common

echo "building firebase-installations-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-installations-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-installations-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-installations-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-installations-aar^android_common

echo "building firebase-installations-interop-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-installations-interop-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-installations-interop-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-installations-interop-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-installations-interop-aar^android_common

echo "building firebase-measurement-connector-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-measurement-connector-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-measurement-connector-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-measurement-connector-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-measurement-connector-aar^android_common

echo "building firebase-messaging-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja firebase-messaging-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-messaging-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/firebase-messaging-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-messaging-aar^android_common

echo "building play-services-basement-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja play-services-basement-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-basement-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/play-services-basement-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-basement-aar^android_common

echo "building play-services-cloud-messaging-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja play-services-cloud-messaging-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-cloud-messaging-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/play-services-cloud-messaging-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-cloud-messaging-aar^android_common

echo "building play-services-stats-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja play-services-stats-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-stats-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/play-services-stats-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-stats-aar^android_common

echo "building play-services-tasks-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja play-services-tasks-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-tasks-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/play-services-tasks-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/play-services-tasks-aar^android_common

echo "building transport-api-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja transport-api-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-api-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/transport-api-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-api-aar^android_common

echo "building transport-backend-cct-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja transport-backend-cct-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-backend-cct-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/transport-backend-cct-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-backend-cct-aar^android_common

echo "building transport-runtime-aar^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja transport-runtime-aar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-runtime-aar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/firebase-messaging/transport-runtime-aar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/transport-runtime-aar^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_firebase-messaging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_firebase-messaging.tar.zst --clobber

du -ah -d1 external_firebase-messaging*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst" ]; then
  echo "Compressing external/firebase-messaging -> external_firebase-messaging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/firebase-messaging/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
