
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

echo "Preparing for tools/apifinder"

clone_depth_platform external/auto
clone_depth_platform external/error_prone
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_depth_platform tools/apifinder

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_annotations^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/auto/service/auto_service_plugin^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/error_prone/error_prone_core^linux_glibc_common/ .

echo "building java_api_used_by_mainline_module^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_06.ninja java_api_used_by_mainline_module,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_06/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_06/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common $GITHUB_WORKSPACE/artifacts/tools/apifinder/java_api_used_by_mainline_module^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/apifinder/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_06 tools_apifinder.tar.zst --clobber

du -ah -d1 tools_apifinder*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_auto.tar.zst" ]; then
  echo "Compressing external/auto -> external_auto.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_auto.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/auto/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_error_prone.tar.zst" ]; then
  echo "Compressing external/error_prone -> external_error_prone.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_error_prone.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/error_prone/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst" ]; then
  echo "Compressing tools/apifinder -> tools_apifinder.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_apifinder.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/apifinder/ .
fi


rm -rf aosp
