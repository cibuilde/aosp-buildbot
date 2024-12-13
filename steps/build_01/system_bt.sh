set -e

df -h
mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform system/bt

echo "building bt_did.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_did.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_did.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64

echo "building bt_stack.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_stack.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_stack.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_bt.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/bt/ .

du -ah -d1

if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.zst" ]; then
  echo "Compressing system/bt -> system_bt.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_bt.tar.zst -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache

rm -rf aosp
