
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

echo "Preparing for external/icu"

clone_depth_platform external/icu

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/icu/android_icu4j/core-icu4j^android_common_apex10000/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .

echo "building core-icu4j^android_common_apex10000"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja core-icu4j,android_common_apex10000
mkdir -p $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/core-icu4j^android_common_apex10000
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/external/icu/core-icu4j^android_common_apex10000.output . $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/core-icu4j^android_common_apex10000
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/external/icu/core-icu4j^android_common_apex10000.output $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/core-icu4j^android_common_apex10000 $GITHUB_WORKSPACE/artifacts/external/icu/android_icu4j/core-icu4j^android_common_apex10000/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/icu/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 external_icu.tar.zst --clobber

du -ah -d1 external_icu*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_icu.tar.zst" ]; then
  echo "Compressing external/icu -> external_icu.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_icu.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/icu/ .
fi


rm -rf aosp
