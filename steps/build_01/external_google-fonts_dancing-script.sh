
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

echo "Preparing for external/google-fonts/dancing-script"

clone_depth_platform external/google-fonts/dancing-script


echo "building DancingScript-Regular.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja DancingScript-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Regular.ttf^android_x86_64/addition_copy_files.output

echo "building DancingScript-Bold.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja DancingScript-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/DancingScript-Bold.ttf^android_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_google-fonts_dancing-script.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/dancing-script/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_google-fonts_dancing-script.tar.zst --clobber

du -ah -d1 external_google-fonts_dancing-script*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_dancing-script.tar.zst" ]; then
  echo "Compressing external/google-fonts/dancing-script -> external_google-fonts_dancing-script.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_google-fonts_dancing-script.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/google-fonts/dancing-script/ .
fi


rm -rf aosp
