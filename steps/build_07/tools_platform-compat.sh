
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

echo "Preparing for tools/platform-compat"

clone_depth_platform build/soong
clone_depth_platform external/apache-commons-bcel
clone_depth_platform external/guava
clone_depth_platform external/hamcrest
clone_depth_platform external/testng
clone_project platform/prebuilts/jdk/jdk11 prebuilts/jdk/jdk11 android12-gsi "/linux-x86"
clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"
clone_depth tools/platform-compat

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/javac_wrapper/soong_javac_wrapper^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/zipsync/zipsync^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/zip/cmd/soong_zip^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/apache-commons-bcel/apache-bcel^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/guava/guava-jre^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/hamcrest/hamcrest-library/hamcrest-library^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/testng/testng^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/annotationvisitor/annotationvisitor^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklistlib^linux_glibc_common/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common/ .

echo "building class2nonsdklistlib^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja class2nonsdklistlib,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklistlib^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklistlib^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklistlib^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklistlib^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklistlib^linux_glibc_common $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklistlib^linux_glibc_common/addition_copy_files.output

echo "building class2nonsdklist^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja class2nonsdklist,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklist^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklist^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_common/addition_copy_files.output

echo "building class2nonsdklist^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_07.ninja class2nonsdklist,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklist^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_07/tools/platform-compat/class2nonsdklist^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/tools/platform-compat/java/com/android/class2nonsdklist/class2nonsdklist^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/tools/platform-compat/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 tools_platform-compat.tar.zst --clobber

du -ah -d1 tools_platform-compat*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/build_soong.tar.zst" ]; then
  echo "Compressing build/soong -> build_soong.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/build_soong.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/build/soong/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_apache-commons-bcel.tar.zst" ]; then
  echo "Compressing external/apache-commons-bcel -> external_apache-commons-bcel.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_apache-commons-bcel.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/apache-commons-bcel/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_guava.tar.zst" ]; then
  echo "Compressing external/guava -> external_guava.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_guava.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/guava/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_hamcrest.tar.zst" ]; then
  echo "Compressing external/hamcrest -> external_hamcrest.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_hamcrest.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/hamcrest/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_testng.tar.zst" ]; then
  echo "Compressing external/testng -> external_testng.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_testng.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/testng/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst" ]; then
  echo "Compressing prebuilts/jdk/jdk11 -> prebuilts_jdk_jdk11.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_jdk_jdk11.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/jdk/jdk11/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst" ]; then
  echo "Compressing tools/platform-compat -> tools_platform-compat.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/tools_platform-compat.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/tools/platform-compat/ .
fi


rm -rf aosp
