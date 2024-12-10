set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

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

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_source-sans-pro.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/source-sans-pro/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_source-sans-pro.tar.xz -C $GITHUB_WORKSPACE/aosp/external/google-fonts/source-sans-pro/ .
fi
rm -rf aosp