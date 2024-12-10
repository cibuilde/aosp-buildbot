set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

clone_sparse cts libs/json
clone_depth_platform system/apex

echo "building com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.apex.cts.shim.v1_prebuilt,android_common_com.android.apex.cts.shim.v1_prebuilt
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/apex/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt.output . $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_apex.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/apex/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.xz -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_apex.tar.xz -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
rm -rf aosp