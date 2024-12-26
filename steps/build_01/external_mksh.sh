set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

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
tar -cf external_mksh.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/mksh/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 external_mksh.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_mksh.tar.zst" ]; then
  echo "Compressing external/mksh -> external_mksh.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_mksh.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/mksh/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
