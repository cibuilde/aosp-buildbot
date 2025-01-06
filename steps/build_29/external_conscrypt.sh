
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

echo "Preparing for external/conscrypt"

clone_depth_platform external/conscrypt

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/conscrypt/conscrypt^android_common_apex29/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .

echo "building conscrypt^android_common_apex29"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja conscrypt,android_common_apex29
mkdir -p $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt^android_common_apex29
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/external/conscrypt/conscrypt^android_common_apex29.output . $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt^android_common_apex29
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/external/conscrypt/conscrypt^android_common_apex29.output $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt^android_common_apex29 $GITHUB_WORKSPACE/artifacts/external/conscrypt/conscrypt^android_common_apex29/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/conscrypt/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 external_conscrypt.tar.zst --clobber

du -ah -d1 external_conscrypt*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst" ]; then
  echo "Compressing external/conscrypt -> external_conscrypt.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_conscrypt.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/conscrypt/ .
fi


rm -rf aosp
