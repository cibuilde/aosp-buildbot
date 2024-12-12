set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/google-fonts/cutive-mono

echo "building CutiveMono.ttf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja CutiveMono.ttf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/CutiveMono.ttf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_google-fonts_cutive-mono.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/google-fonts/cutive-mono/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_google-fonts_cutive-mono.tar.xz" ]; then
  echo "Compressing external/google-fonts/cutive-mono -> external_google-fonts_cutive-mono.tar.xz"
  tar cfJ $GITHUB_WORKSPACE/cache/external_google-fonts_cutive-mono.tar.xz -C $GITHUB_WORKSPACE/aosp/external/google-fonts/cutive-mono/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
