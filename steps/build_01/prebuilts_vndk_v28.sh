set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse prebuilts/vndk/v28 x86_64

echo "building llndk.libraries.28.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/llndk.libraries.28.txt^android_x86_64

echo "building vndkcore.libraries.28.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkcore.libraries.28.txt^android_x86_64

echo "building vndkprivate.libraries.28.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkprivate.libraries.28.txt^android_x86_64

echo "building vndkproduct.libraries.28.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndkproduct.libraries.28.txt^android_x86_64

echo "building vndksp.libraries.28.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.28.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/vndksp.libraries.28.txt^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_vndk_v28.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v28/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst" ]; then
  echo "Compressing prebuilts/vndk/v28 -> prebuilts_vndk_v28.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_vndk_v28.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v28/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
