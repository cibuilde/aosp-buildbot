set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/firebase-messaging

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building firebase-encoders-jar^android_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja firebase-encoders-jar,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-jar^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/firebase-messaging/firebase-encoders-jar^android_common.output . $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/firebase-encoders-jar^android_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_firebase-messaging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/firebase-messaging/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_firebase-messaging.tar.zst --clobber

du -ah -d1 external_firebase-messaging*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst" ]; then
  echo "Compressing external/firebase-messaging -> external_firebase-messaging.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_firebase-messaging.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/firebase-messaging/ .
fi

rm -rf aosp
