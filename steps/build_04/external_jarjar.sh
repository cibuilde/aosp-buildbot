
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
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar-maven-plugin-api^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/jarjar/jarjar-apache-ant^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common/ .

echo "building jarjar^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja jarjar,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/external/jarjar/jarjar^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/external/jarjar/jarjar^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common $GITHUB_WORKSPACE/artifacts/external/jarjar/jarjar^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/jarjar/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 external_jarjar.tar.zst --clobber

du -ah -d1 external_jarjar*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_jarjar.tar.zst" ]; then
  echo "Compressing external/jarjar -> external_jarjar.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_jarjar.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/jarjar/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi


rm -rf aosp
