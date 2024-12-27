set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/native
clone_depth_platform system/tools/aidl

rsync -a -r $GITHUB_WORKSPACE/downloads/build/blueprint/bpmodify^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building aaudio-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja aaudio-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/aaudio-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaaudio/src/aaudio-aidl-cpp-source^

echo "building audioclient-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audioclient-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/audioclient-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioclient-types-aidl-cpp-source^

echo "building audioflinger-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audioflinger-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/audioflinger-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audioflinger-aidl-cpp-source^

echo "building audiopolicy-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audiopolicy-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/audiopolicy-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-aidl-cpp-source^

echo "building audiopolicy-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja audiopolicy-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/audiopolicy-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/audiopolicy-types-aidl-cpp-source^

echo "building av-types-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja av-types-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/av-types-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-cpp-source^

echo "building av-types-aidl-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja av-types-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/av-types-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java-source^

echo "building capture_state_listener-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja capture_state_listener-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/capture_state_listener-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-cpp-source^

echo "building capture_state_listener-aidl-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja capture_state_listener-aidl-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/capture_state_listener-aidl-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java-source^

echo "building effect-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja effect-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/effect-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/effect-aidl-cpp-source^

echo "building mediametricsservice-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja mediametricsservice-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/mediametricsservice-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediametrics/mediametricsservice-aidl-cpp-source^

echo "building mediatranscoding_aidl_interface-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja mediatranscoding_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/mediatranscoding_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java-source^

echo "building mediatranscoding_aidl_interface-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja mediatranscoding_aidl_interface-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/mediatranscoding_aidl_interface-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-ndk_platform-source^

echo "building resourcemanager_aidl_interface-ndk_platform-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja resourcemanager_aidl_interface-ndk_platform-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/resourcemanager_aidl_interface-ndk_platform-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourcemanager_aidl_interface-ndk_platform-source^

echo "building resourceobserver_aidl_interface-api^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja resourceobserver_aidl_interface-api,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-api^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/resourceobserver_aidl_interface-api^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/mediaresourcemanager/resourceobserver_aidl_interface-api^

echo "building shared-file-region-aidl-cpp-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja shared-file-region-aidl-cpp-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/shared-file-region-aidl-cpp-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libshmem/shared-file-region-aidl-cpp-source^

echo "building tv_tuner_frontend_info_aidl_interface-java-source^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja tv_tuner_frontend_info_aidl_interface-java-source,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java-source^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/frameworks/av/tv_tuner_frontend_info_aidl_interface-java-source^.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java-source^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 frameworks_av.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_native.tar.zst" ]; then
  echo "Compressing frameworks/native -> frameworks_native.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_native.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/native/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst" ]; then
  echo "Compressing system/tools/aidl -> system_tools_aidl.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_tools_aidl.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/tools/aidl/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
