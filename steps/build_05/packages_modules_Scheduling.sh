set -e

echo "entering packages/modules/Scheduling"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform packages/modules/Scheduling
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/system/tools/xsdc/xsdc^linux_glibc_x86_64/ .

echo "building reboot-stats-parser^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja reboot-stats-parser,
mkdir -p $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/reboot-stats-parser/reboot-stats-parser^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/packages/modules/Scheduling/reboot-stats-parser^.output . $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/service/reboot-stats-parser/reboot-stats-parser^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf packages_modules_Scheduling.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/packages/modules/Scheduling/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 packages_modules_Scheduling.tar.zst --clobber

du -ah -d1 packages_modules_Scheduling*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst" ]; then
  echo "Compressing packages/modules/Scheduling -> packages_modules_Scheduling.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/packages_modules_Scheduling.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/packages/modules/Scheduling/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp