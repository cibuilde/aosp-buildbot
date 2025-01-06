
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/ && ln -sf $GITHUB_WORKSPACE/prebuilts/build-tools prebuilts/
if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/opt/net/ims"

clone_depth_platform art
clone_depth_platform frameworks/opt/net/ims


echo "building ims-common^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja ims-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/ims/ims-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/frameworks/opt/net/ims/ims-common^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/ims/ims-common^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/frameworks/opt/net/ims/ims-common^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/ims/ims-common^android_common $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/ims/ims-common^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_opt_net_ims.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/ims/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 frameworks_opt_net_ims.tar.zst --clobber

du -ah -d1 frameworks_opt_net_ims*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/art.tar.zst" ]; then
  echo "Compressing art -> art.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/art.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/art/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/ims -> frameworks_opt_net_ims.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_ims.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/ims/ .
fi


rm -rf aosp
