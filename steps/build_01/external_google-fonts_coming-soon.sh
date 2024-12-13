set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-fonts/coming-soon

echo "building ComingSoon.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja ComingSoon.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/coming-soon/ComingSoon.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/coming-soon/ComingSoon.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/coming-soon/ComingSoon.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_coming-soon.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/coming-soon/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_coming-soon.tar.zst" ]; then
  echo "Compressing external/google-fonts/coming-soon -> external_google-fonts_coming-soon.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_coming-soon.tar.zst -C $GITHUB_WORKSPACE/aosp/external/google-fonts/coming-soon/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
