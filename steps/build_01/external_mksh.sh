set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/mksh

echo "building mkshrc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mkshrc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/mksh/mkshrc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc^android_x86_64

echo "building mkshrc_vendor^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mkshrc_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/mksh/mkshrc_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc_vendor^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_mksh.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/mksh/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/external_mksh.tar.zst" ]; then
  echo "Compressing external/mksh -> external_mksh.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_mksh.tar.zst -C $GITHUB_WORKSPACE/aosp/external/mksh/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
