
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

echo "Preparing for frameworks/base"

clone_depth_platform external/libphonenumber
clone_depth_platform external/rappor
clone_depth_platform external/tagsoup
clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform libcore

rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libphonenumber/libphonenumber-platform^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/rappor/rappor^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/tagsoup/tagsoup^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/core-lambda-stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/libcore/mmodules/core_platform_api/stable.core.platform.api.stubs^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/r8/d8^linux_glibc_x86_64/ .

echo "building ext^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_15.ninja ext,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_15/frameworks/base/ext^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_15/frameworks/base/ext^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common $GITHUB_WORKSPACE/artifacts/frameworks/base/ext^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/base/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_15 frameworks_base.tar.zst --clobber

du -ah -d1 frameworks_base*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst" ]; then
  echo "Compressing external/libphonenumber -> external_libphonenumber.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libphonenumber/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_rappor.tar.zst" ]; then
  echo "Compressing external/rappor -> external_rappor.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_rappor.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/rappor/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_tagsoup.tar.zst" ]; then
  echo "Compressing external/tagsoup -> external_tagsoup.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_tagsoup.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/tagsoup/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/libcore.tar.zst" ]; then
  echo "Compressing libcore -> libcore.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/libcore.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/libcore/ .
fi


rm -rf aosp
