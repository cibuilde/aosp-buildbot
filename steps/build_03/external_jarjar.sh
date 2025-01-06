
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

echo "Preparing for external/jarjar"

clone_depth_platform external/jarjar

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building jarjar-maven-plugin-api^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja jarjar-maven-plugin-api,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common/addition_copy_files.output

echo "building jarjar-apache-ant^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja jarjar-apache-ant,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/jarjar/jarjar-apache-ant^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/jarjar/jarjar-apache-ant^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/jarjar/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_jarjar.tar.zst --clobber

du -ah -d1 external_jarjar*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_jarjar.tar.zst" ]; then
  echo "Compressing external/jarjar -> external_jarjar.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jarjar/ .
fi


rm -rf aosp
