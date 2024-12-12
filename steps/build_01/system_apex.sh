set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
tar xf $GITHUB_WORKSPACE/ninja.tar.xz

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse cts libs/json
clone_depth_platform system/apex

echo "building com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja com.android.apex.cts.shim.v1_prebuilt,android_common_com.android.apex.cts.shim.v1_prebuilt
mkdir -p $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/apex/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt.output . $GITHUB_WORKSPACE/artifacts/system/apex/shim/com.android.apex.cts.shim.v1_prebuilt^android_common_com.android.apex.cts.shim.v1_prebuilt

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_apex.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/apex/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/cts.tar.zst" ]; then
  echo "Compressing cts -> cts.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/cts.tar.zst -C $GITHUB_WORKSPACE/aosp/cts/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_apex.tar.zst" ]; then
  echo "Compressing system/apex -> system_apex.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_apex.tar.zst -C $GITHUB_WORKSPACE/aosp/system/apex/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
