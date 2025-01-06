
set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

echo "Preparing for frameworks/opt/telephony"

clone_depth_platform frameworks/opt/telephony

rsync -a -r $GITHUB_WORKSPACE/downloads/art/tools/hiddenapi/hiddenapi^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/make/tools/zipalign/zipalign^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/base/boot/platform-bootclasspath^android_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/frameworks/opt/telephony/telephony-common^android_common/ .

echo "building telephony-common^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_29.ninja telephony-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_29/frameworks/opt/telephony/telephony-common^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_29/frameworks/opt/telephony/telephony-common^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_29 frameworks_opt_telephony.tar.zst --clobber

du -ah -d1 frameworks_opt_telephony*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst" ]; then
  echo "Compressing frameworks/opt/telephony -> frameworks_opt_telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/telephony/ .
fi


rm -rf aosp
