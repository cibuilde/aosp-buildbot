set -e

echo "entering prebuilts/r8"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

if [ -d "$GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86" ]; then
  mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86
fi

clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"
clone_depth_platform prebuilts/r8

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/merge_zips/merge_zips^linux_glibc_x86_64/ .

echo "building d8^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja d8,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/d8^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/d8^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_common/addition_copy_files.output

echo "building d8^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja d8,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/d8^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/d8^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/r8/d8^linux_glibc_x86_64/addition_copy_files.output

echo "building r8-compat-proguard^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja r8-compat-proguard,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8-compat-proguard^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8-compat-proguard^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_common/addition_copy_files.output

echo "building r8-compat-proguard^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja r8-compat-proguard,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8-compat-proguard^linux_glibc_x86_64/addition_copy_files.output

echo "building r8^linux_glibc_common"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja r8,linux_glibc_common
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8^linux_glibc_common.output . $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/prebuilts/r8/r8^linux_glibc_common.output $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common $GITHUB_WORKSPACE/artifacts/prebuilts/r8/r8^linux_glibc_common/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_r8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/r8/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 prebuilts_r8.tar.zst --clobber

du -ah -d1 prebuilts_r8*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst" ]; then
  echo "Compressing prebuilts/r8 -> prebuilts_r8.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_r8.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/r8/ .
fi

rm -rf aosp
