set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-fonts/source-sans-pro

echo "building SourceSansPro-Bold.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Bold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Bold.ttf^android_x86_64

echo "building SourceSansPro-BoldItalic.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-BoldItalic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-BoldItalic.ttf^android_x86_64

echo "building SourceSansPro-Italic.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Italic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Italic.ttf^android_x86_64

echo "building SourceSansPro-Regular.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-Regular.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-Regular.ttf^android_x86_64

echo "building SourceSansPro-SemiBold.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-SemiBold.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBold.ttf^android_x86_64

echo "building SourceSansPro-SemiBoldItalic.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja SourceSansPro-SemiBoldItalic.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/SourceSansPro-SemiBoldItalic.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_source-sans-pro.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.zst" ]; then
  echo "Compressing external/google-fonts/source-sans-pro -> external_google-fonts_source-sans-pro.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.zst -C $GITHUB_WORKSPACE/aosp/external/google-fonts/source-sans-pro/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
