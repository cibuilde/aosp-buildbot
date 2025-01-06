
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

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform packages/apps/Settings

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/extract_jar_packages/extract_jar_packages^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/core/res/framework-res^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/aapt2/aapt2^linux_glibc_x86_64/ .

echo "building contextualcards^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja contextualcards,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/contextualcards^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/packages/apps/Settings/contextualcards^android_common.output . $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/contextualcards^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/packages/apps/Settings/contextualcards^android_common.output $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/contextualcards^android_common $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/contextualcards^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_apps_Settings.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/apps/Settings/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 packages_apps_Settings.tar.zst --clobber

du -ah -d1 packages_apps_Settings*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/packages_apps_Settings.tar.zst" ]; then
  echo "Compressing packages/apps/Settings -> packages_apps_Settings.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_apps_Settings.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/apps/Settings/ .
fi


rm -rf aosp
