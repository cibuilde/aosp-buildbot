
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

echo "Preparing for prebuilts/build-tools"



echo "building prebuilt_py3-launcher-autorun^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja prebuilt_py3-launcher-autorun,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/prebuilt_py3-launcher-autorun^linux_glibc_x86_64/addition_copy_files.output

echo "building bison^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja bison,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/bison^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/bison^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/bison^linux_glibc_x86_64/addition_copy_files.output

echo "building flex^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja flex,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/flex^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/flex^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/flex^linux_glibc_x86_64/addition_copy_files.output

echo "building m4^linux_glibc_x86_64"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_01.ninja m4,linux_glibc_x86_64
mkdir -p $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/m4^linux_glibc_x86_64.output . $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_01/prebuilts/build-tools/m4^linux_glibc_x86_64.output $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64 $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/m4^linux_glibc_x86_64/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/prebuilts/build-tools/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_01 prebuilts_build-tools.tar.zst --clobber

du -ah -d1 prebuilts_build-tools*.tar.zst | sort -h




rm -rf aosp
