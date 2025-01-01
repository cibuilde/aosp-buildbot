set -e

echo "entering external/google-fonts/source-sans-pro"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_depth_platform external/google-fonts/source-sans-pro
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"


echo "building SourceSansPro-Bold.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64/addition_copy_files.output

echo "building SourceSansPro-BoldItalic.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-BoldItalic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64/addition_copy_files.output

echo "building SourceSansPro-Italic.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Italic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64/addition_copy_files.output

echo "building SourceSansPro-Regular.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64/addition_copy_files.output

echo "building SourceSansPro-SemiBold.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-SemiBold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64/addition_copy_files.output

echo "building SourceSansPro-SemiBoldItalic.ttf^android_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-SemiBoldItalic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64.output $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64 $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_google-fonts_source-sans-pro.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_google-fonts_source-sans-pro.tar.zst --clobber

du -ah -d1 external_google-fonts_source-sans-pro*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.zst" ]; then
  echo "Compressing external/google-fonts/source-sans-pro -> external_google-fonts_source-sans-pro.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/google-fonts/source-sans-pro/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
