
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

echo "Preparing for frameworks/opt/net/voip"

clone_sparse_exclude frameworks/base "!/data/videos" "!/media/tests/contents" "!/docs" "!/native/graphics/jni/fuzz" "!/cmd/incidentd/testdata"
clone_depth_platform frameworks/opt/net/voip

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/dep_fixer/dep_fixer^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/aidl/aidl^linux_glibc_x86_64/ .

echo "building voip-common^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja voip-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/voip/voip-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/opt/net/voip/voip-common^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/voip/voip-common^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/opt/net/voip/voip-common^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/voip/voip-common^android_common $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/voip/voip-common^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_opt_net_voip.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/net/voip/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_opt_net_voip.tar.zst --clobber

du -ah -d1 frameworks_opt_net_voip*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_base.tar.zst" ]; then
  echo "Compressing frameworks/base -> frameworks_base.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_base.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/base/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst" ]; then
  echo "Compressing frameworks/opt/net/voip -> frameworks_opt_net_voip.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_net_voip.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/net/voip/ .
fi


rm -rf aosp
