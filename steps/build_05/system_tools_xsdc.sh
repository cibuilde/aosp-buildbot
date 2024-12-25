set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse prebuilts/jdk/jdk11 linux-x86
clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"
clone_depth_platform system/tools/xsdc

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common/ .

echo "building xsdc^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja xsdc,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/system/tools/xsdc/xsdc^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/xsdc^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ system_tools_xsdc.tar.zst -C $GITHUB_WORKSPACE/artifacts/system/tools/xsdc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 system_tools_xsdc.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/system_tools_xsdc.tar.zst" ]; then
  echo "Compressing system/tools/xsdc -> system_tools_xsdc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/system_tools_xsdc.tar.zst -C $GITHUB_WORKSPACE/aosp/system/tools/xsdc/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
