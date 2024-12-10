set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform external/mksh

echo "building mkshrc^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mkshrc,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/mksh/mkshrc^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc^android_x86_64

echo "building mkshrc_vendor^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja mkshrc_vendor,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc_vendor^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/external/mksh/mkshrc_vendor^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/external/mksh/mkshrc_vendor^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ external_mksh.tar.xz -C $GITHUB_WORKSPACE/artifacts/external/mksh/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/external_mksh.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/external_mksh.tar.xz -C $GITHUB_WORKSPACE/aosp/external/mksh/ .
fi
rm -rf aosp