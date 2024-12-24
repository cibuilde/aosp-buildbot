set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/firebase-messaging

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building firebase-encoders-jar^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja firebase-encoders-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/firebase-messaging/firebase-encoders-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-jar^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ external_firebase-messaging.tar.zst -C $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_firebase-messaging.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst" ]; then
  echo "Compressing external/firebase-messaging -> external_firebase-messaging.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst -C $GITHUB_WORKSPACE/aosp/external/firebase-messaging/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
