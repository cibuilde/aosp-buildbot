set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
source $GITHUB_WORKSPACE/envsetup.sh
ln -sf $GITHUB_WORKSPACE/ninja .

clone_depth_platform system/bt

echo "building bt_did.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_did.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_did.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_did.conf^android_x86_64

echo "building bt_stack.conf^android_x86_64"
ninja -f $GITHUB_WORKSPACE/steps/build_01.ninja bt_stack.conf,android_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/system/bt/bt_stack.conf^android_x86_64.output . $GITHUB_WORKSPACE/artifacts/system/bt/conf/bt_stack.conf^android_x86_64

rm -rf aosp

cd $GITHUB_WORKSPACE/
tar cfJ system_bt.tar.xz -C $GITHUB_WORKSPACE/artifacts/system/bt/ .

mkdir -p $GITHUB_WORKSPACE/cache
if [ ! -f "$GITHUB_WORKSPACE/cache/system_bt.tar.xz" ]; then
  tar cfJ $GITHUB_WORKSPACE/cache/system_bt.tar.xz -C $GITHUB_WORKSPACE/aosp/system/bt/ .
fi
rm -rf aosp