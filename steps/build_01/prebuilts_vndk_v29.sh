set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse prebuilts/vndk/v29 x86_64


echo "building llndk.libraries.29.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/llndk.libraries.29.txt^android_x86_64

echo "building vndkcore.libraries.29.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkcore.libraries.29.txt^android_x86_64

echo "building vndkprivate.libraries.29.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkprivate.libraries.29.txt^android_x86_64

echo "building vndkproduct.libraries.29.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndkproduct.libraries.29.txt^android_x86_64

echo "building vndksp.libraries.29.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.29.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/vndksp.libraries.29.txt^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_vndk_v29.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_vndk_v29.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v29 -> prebuilts_vndk_v29.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v29/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
