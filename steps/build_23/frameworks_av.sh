
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/av"

clone_depth_platform frameworks/av
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/av-types-aidl-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .

echo "building av-types-aidl-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja av-types-aidl-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/av-types-aidl-java^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/av-types-aidl-java^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java^android_common $GITHUB_WORKSPACE/artifacts/frameworks/av/av-types-aidl-java^android_common/addition_copy_files.output

echo "building capture_state_listener-aidl-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja capture_state_listener-aidl-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/capture_state_listener-aidl-java^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/capture_state_listener-aidl-java^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libaudioclient/capture_state_listener-aidl-java^android_common/addition_copy_files.output

echo "building mediatranscoding_aidl_interface-java^android_common_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja mediatranscoding_aidl_interface-java,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/mediatranscoding_aidl_interface-java^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java^android_common_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/mediatranscoding_aidl_interface-java^android_common_apex29.output $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java^android_common_apex29 $GITHUB_WORKSPACE/artifacts/frameworks/av/media/libmediatranscoding/mediatranscoding_aidl_interface-java^android_common_apex29/addition_copy_files.output

echo "building tv_tuner_frontend_info_aidl_interface-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja tv_tuner_frontend_info_aidl_interface-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/tv_tuner_frontend_info_aidl_interface-java^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/frameworks/av/tv_tuner_frontend_info_aidl_interface-java^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java^android_common $GITHUB_WORKSPACE/artifacts/frameworks/av/services/tuner/tv_tuner_frontend_info_aidl_interface-java^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/av/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_23 frameworks_av.tar.zst --clobber

du -ah -d1 frameworks_av*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_av.tar.zst" ]; then
  echo "Compressing frameworks/av -> frameworks_av.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_av.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/av/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
