
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

echo "Preparing for external/zxing"

clone_depth_platform external/zxing

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building zxing-core-1.7^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja zxing-core-1.7,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/zxing/zxing-core-1.7^android_common.output . $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/zxing/zxing-core-1.7^android_common.output $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common $GITHUB_WORKSPACE/artifacts/external/zxing/core/zxing-core-1.7^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_zxing.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/zxing/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_zxing.tar.zst --clobber

du -ah -d1 external_zxing*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_zxing.tar.zst" ]; then
  echo "Compressing external/zxing -> external_zxing.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_zxing.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/zxing/ .
fi


rm -rf aosp
