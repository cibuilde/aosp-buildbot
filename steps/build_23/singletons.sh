
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

echo "Preparing for singletons"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"

rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_system_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/android_test_stubs_current^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/tools/sdkparcelables/sdkparcelables^linux_glibc_x86_64/ .

echo "building sdk^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_23.ninja sdk,
mkdir -p $GITHUB_WORKSPACE/artifacts/singletons/sdk^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_23/singletons/sdk^.output . $GITHUB_WORKSPACE/artifacts/singletons/sdk^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_23/singletons/sdk^.output $GITHUB_WORKSPACE/artifacts/singletons/sdk^ $GITHUB_WORKSPACE/artifacts/singletons/sdk^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf singletons.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/singletons/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_23 singletons.tar.zst --clobber

du -ah -d1 singletons*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi


rm -rf aosp
