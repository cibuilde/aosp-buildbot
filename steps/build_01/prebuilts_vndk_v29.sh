set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

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

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_vndk_v29.tar.xz -C $GITHUB_WORKSPACE/artifacts/prebuilts/vndk/v29/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_vndk_v29.tar.xz -C $GITHUB_WORKSPACE/aosp/prebuilts/vndk/v29/ .
fi
rm -rf aosp