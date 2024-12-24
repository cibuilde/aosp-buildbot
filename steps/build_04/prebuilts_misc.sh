set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_sparse_exclude prebuilts/misc "!/common/robolectric" "!/darwin-x86" "!/darwin-x86_64"

rsync -a -r $GITHUB_WORKSPACE/artifacts/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building asm-6.0^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-6.0^linux_glibc_common

echo "building asm-7.0^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-7.0^android_common

echo "building asm-analysis-6.0^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-analysis-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-analysis-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-analysis-6.0^linux_glibc_common

echo "building asm-commons-6.0^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-commons-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-commons-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-6.0^linux_glibc_common

echo "building asm-commons-7.0^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-commons-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-commons-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-commons-7.0^android_common

echo "building asm-tree-6.0^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-tree-6.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-tree-6.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-6.0^linux_glibc_common

echo "building asm-tree-7.0^android_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja asm-tree-7.0,android_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/asm-tree-7.0^android_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/asm/asm-tree-7.0^android_common

echo "building commons-cli-1.2^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja commons-cli-1.2,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/commons-cli-1.2^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/commons-cli/commons-cli-1.2^linux_glibc_common

echo "building guava-21.0^linux_glibc_common"
ninja -f $GITHUB_WORKSPACE/steps/build_04.ninja guava-21.0,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/prebuilts/misc/guava-21.0^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/misc/common/guava/guava-21.0^linux_glibc_common

rm -rf out

cd $GITHUB_WORKSPACE/
tar cfJ prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/artifacts/prebuilts/misc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 prebuilts_misc.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst" ]; then
  echo "Compressing prebuilts/misc -> prebuilts_misc.tar.zst"
  tar cfJ $GITHUB_WORKSPACE/cache/prebuilts_misc.tar.zst -C $GITHUB_WORKSPACE/aosp/prebuilts/misc/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
