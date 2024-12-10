set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_sparse prebuilts/vndk/v30 x86_64

echo "building llndk.libraries.30.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja llndk.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/llndk.libraries.30.txt^android_x86_64

echo "building vndkcore.libraries.30.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkcore.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkcore.libraries.30.txt^android_x86_64

echo "building vndkprivate.libraries.30.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkprivate.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkprivate.libraries.30.txt^android_x86_64

echo "building vndkproduct.libraries.30.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndkproduct.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndkproduct.libraries.30.txt^android_x86_64

echo "building vndksp.libraries.30.txt^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja vndksp.libraries.30.txt,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/vndksp.libraries.30.txt^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_vndk_v30.tar.xz -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v30/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_vndk_v30.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v30/ .
fi
rm -rf aosp