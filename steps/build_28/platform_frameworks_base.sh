set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform platform/frameworks/base

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/framework-minus-apex^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/build/process-compat-config^linux_glibc_x86_64_PY2/ .

echo "building framework-platform-compat-config^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_28.ninja framework-platform-compat-config,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_28/platform/frameworks/base/framework-platform-compat-config^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/framework-platform-compat-config^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf platform_frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/platform/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_28 platform_frameworks_base.tar.zst --clobber

du -ah -d1 platform_frameworks_base*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/platform_frameworks_base.tar.zst" ]; then
  echo "Compressing platform/frameworks/base -> platform_frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/platform_frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/platform/frameworks/base/ .
fi

rm -rf aosp
