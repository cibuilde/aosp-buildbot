set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/guice
clone_depth_platform external/junit
clone_sparse prebuilts/jdk/jdk11 linux-x86

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guice/guice_munge_manifest^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guice/guice_munge_srcjar^/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/junit/junit^linux_glibc_common/ .

echo "building guice_munge^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja guice_munge,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/guice/guice_munge^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/guice/guice_munge^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/guice/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_guice.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_guice.tar.zst" ]; then
  echo "Compressing external/guice -> external_guice.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guice/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_junit.tar.zst" ]; then
  echo "Compressing external/junit -> external_junit.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/junit/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp