set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/changeid/compat-changeid-annotation-processor-lib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor-lib^linux_glibc_common/ .

echo "building compat-changeid-annotation-processor^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja compat-changeid-annotation-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/changeid/compat-changeid-annotation-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/tools/platform-compat/compat-changeid-annotation-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/changeid/compat-changeid-annotation-processor^linux_glibc_common

echo "building unsupportedappusage-annotation-processor^linux_glibc_common"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_10.ninja unsupportedappusage-annotation-processor,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_10/tools/platform-compat/unsupportedappusage-annotation-processor^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/android/processor/compat/unsupportedappusage/unsupportedappusage-annotation-processor^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_10 tools_platform-compat.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp