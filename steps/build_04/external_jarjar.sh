set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/jarjar

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building jarjar-apache-ant^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja jarjar-apache-ant,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/jarjar/jarjar-apache-ant^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-apache-ant^linux_glibc_common

echo "building jarjar-maven-plugin-api^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja jarjar-maven-plugin-api,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/jarjar/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_jarjar.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_jarjar.tar.zst" ]; then
  echo "Compressing external/jarjar -> external_jarjar.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jarjar/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
