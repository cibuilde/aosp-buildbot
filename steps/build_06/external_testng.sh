
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

echo "Preparing for external/testng"

clone_depth_platform external/guice
clone_depth_platform external/jcommander
clone_depth_platform external/junit
clone_depth_platform external/snakeyaml
clone_depth_platform external/testng
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guice/guice^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jcommander/jcommander^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/junit/junit^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/snakeyaml/snakeyaml^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/testng/testng-generated-srcs^/ .

echo "building testng^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja testng,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/testng/testng^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/external/testng/testng^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/testng/testng^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/external/testng/testng^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/testng/testng^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/testng/testng^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/testng/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 external_testng.tar.zst --clobber

du -ah -d1 external_testng*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_guice.tar.zst" ]; then
  echo "Compressing external/guice -> external_guice.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guice.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guice/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_jcommander.tar.zst" ]; then
  echo "Compressing external/jcommander -> external_jcommander.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jcommander.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jcommander/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_junit.tar.zst" ]; then
  echo "Compressing external/junit -> external_junit.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_junit.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/junit/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_snakeyaml.tar.zst" ]; then
  echo "Compressing external/snakeyaml -> external_snakeyaml.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_snakeyaml.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/snakeyaml/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_testng.tar.zst" ]; then
  echo "Compressing external/testng -> external_testng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/testng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi


rm -rf aosp
