
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

echo "Preparing for prebuilts/misc"

clone_project platform/prebuilts/misc prebuilts/misc android12-gsi "/common/asm/asm-6.0.jar" "/common/asm/asm-7.0.jar" "/common/asm/asm-analysis-6.0.jar" "/common/asm/asm-commons-6.0.jar" "/common/asm/asm-commons-7.0.jar" "/common/asm/asm-tree-6.0.jar" "/common/asm/asm-tree-7.0.jar" "/common/commons-cli/commons-cli-1.2.jar" "/common/guava/guava-21.0.jar" "/gdbserver/android-x86_64/gdbserver64" "/gdbserver/android-x86/gdbserver" "/linux-x86/yasm/yasm"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building asm-commons-7.0^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-commons-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-commons-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-commons-7.0^android_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common/addition_copy_files.output

echo "building asm-tree-7.0^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-tree-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-tree-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-tree-7.0^android_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common/addition_copy_files.output

echo "building asm-6.0^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-6.0^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common/addition_copy_files.output

echo "building asm-analysis-6.0^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-analysis-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-analysis-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-analysis-6.0^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common/addition_copy_files.output

echo "building asm-commons-6.0^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-commons-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-commons-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-commons-6.0^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common/addition_copy_files.output

echo "building asm-tree-6.0^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-tree-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-tree-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-tree-6.0^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common/addition_copy_files.output

echo "building asm-7.0^android_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja asm-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/asm-7.0^android_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common/addition_copy_files.output

echo "building commons-cli-1.2^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja commons-cli-1.2,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/commons-cli-1.2^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/commons-cli-1.2^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common/addition_copy_files.output

echo "building guava-21.0^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -j $(nproc) -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja guava-21.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/guava-21.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/misc/guava-21.0^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 prebuilts_misc.tar.zst --clobber

du -ah -d1 prebuilts_misc*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi


rm -rf aosp
