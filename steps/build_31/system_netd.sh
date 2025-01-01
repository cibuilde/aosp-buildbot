set -e

echo "entering system/netd"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform system/netd

rsync -a -r $GITHUB_WORKSPACE/downloads/art/build/boot/art-bootclasspath-fragment^android_common_apex31/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/art/dex2oat/dex2oatd^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/scripts/construct_context^linux_glibc_x86_64_PY2/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-current-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/server/netd_aidl_interface-V7-java-source^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/netd/server/netd_event_listener_interface-V1-java-source^/ .

echo "building netd_aidl_interface-V7-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja netd_aidl_interface-V7-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_aidl_interface-V7-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_aidl_interface-V7-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java^android_common $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-V7-java^android_common/addition_copy_files.output

echo "building netd_aidl_interface-lateststable-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja netd_aidl_interface-lateststable-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-lateststable-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_aidl_interface-lateststable-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-lateststable-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_aidl_interface-lateststable-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-lateststable-java^android_common $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_aidl_interface-lateststable-java^android_common/addition_copy_files.output

echo "building netd_event_listener_interface-V1-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja netd_event_listener_interface-V1-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_event_listener_interface-V1-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_event_listener_interface-V1-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java^android_common $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-V1-java^android_common/addition_copy_files.output

echo "building netd_event_listener_interface-lateststable-java^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_31.ninja netd_event_listener_interface-lateststable-java,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-java^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_event_listener_interface-lateststable-java^android_common.output . $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-java^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_31/system/netd/netd_event_listener_interface-lateststable-java^android_common.output $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-java^android_common $GITHUB_WORKSPACE/artifacts/system/netd/server/netd_event_listener_interface-lateststable-java^android_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/system/netd/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_31 system_netd.tar.zst --clobber

du -ah -d1 system_netd*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_netd.tar.zst" ]; then
  echo "Compressing system/netd -> system_netd.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/system_netd.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/system/netd/ .
fi

rm -rf aosp
