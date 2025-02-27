
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

echo "Preparing for frameworks/opt/telephony"

clone_depth_platform external/libphonenumber
clone_depth_platform frameworks/opt/telephony
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/libphonenumber/libphonenumber-nogeocoder^android_common/ .

echo "building telephony-common^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_09.ninja telephony-common,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_09/frameworks/opt/telephony/telephony-common^android_common.output . $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_09/frameworks/opt/telephony/telephony-common^android_common.output $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/telephony-common^android_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/opt/telephony/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_09 frameworks_opt_telephony.tar.zst --clobber

du -ah -d1 frameworks_opt_telephony*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst" ]; then
  echo "Compressing external/libphonenumber -> external_libphonenumber.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_libphonenumber.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/libphonenumber/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst" ]; then
  echo "Compressing frameworks/opt/telephony -> frameworks_opt_telephony.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_opt_telephony.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/opt/telephony/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
