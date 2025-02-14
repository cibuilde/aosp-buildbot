
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

echo "Preparing for packages/apps/Settings"

clone_depth build/make platform/build
ln -s make/core build/
ln -s make/target build/
ln -s make/tools build/
clone_depth_platform external/protobuf
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore
clone_depth_platform packages/apps/Settings
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/aprotoc^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/protobuf/libprotobuf-java-lite^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/turbine/turbine^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/ext^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable-core-platform-api-stubs-system-modules^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/packages/apps/Settings/statslog-settings-java-gen^/ .

echo "building settings-logtags^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja settings-logtags,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/settings-logtags^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-logtags^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/settings-logtags^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-logtags^android_common.output $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/settings-logtags^android_common $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/settings-logtags^android_common/addition_copy_files.output

echo "building statslog-settings^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja statslog-settings,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/statslog-settings^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/statslog-settings^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/statslog-settings^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/statslog-settings^android_common.output $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/statslog-settings^android_common $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/statslog-settings^android_common/addition_copy_files.output

echo "building settings-contextual-card-protos-lite^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja settings-contextual-card-protos-lite,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-contextual-card-protos-lite^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-contextual-card-protos-lite^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-contextual-card-protos-lite^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-contextual-card-protos-lite^android_common.output $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-contextual-card-protos-lite^android_common $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-contextual-card-protos-lite^android_common/addition_copy_files.output

echo "building settings-log-bridge-protos-lite^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_25.ninja settings-log-bridge-protos-lite,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-log-bridge-protos-lite^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-log-bridge-protos-lite^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-log-bridge-protos-lite^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_25/packages/apps/Settings/settings-log-bridge-protos-lite^android_common.output $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-log-bridge-protos-lite^android_common $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/protos/settings-log-bridge-protos-lite^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_apps_Settings.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_25 packages_apps_Settings.tar.zst --clobber

du -ah -d1 packages_apps_Settings*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_make.tar.zst" ]; then
  echo "Compressing build/make -> build_make.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_make.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/make/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_protobuf.tar.zst" ]; then
  echo "Compressing external/protobuf -> external_protobuf.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_protobuf.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/protobuf/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_apps_Settings.tar.zst" ]; then
  echo "Compressing packages/apps/Settings -> packages_apps_Settings.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_apps_Settings.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/apps/Settings/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
