
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

echo "Preparing for development"

clone_project platform/development development android12-gsi "/sdk"

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building platform_tools_version^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja platform_tools_version,
mkdir -p $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/development/platform_tools_version^.output . $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/development/platform_tools_version^.output $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^ $GITHUB_WORKSPACE/artifacts/development/sdk/platform_tools_version^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf development.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/development/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 development.tar.zst --clobber

du -ah -d1 development*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/development.tar.zst" ]; then
  echo "Compressing development -> development.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/development.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/development/ .
fi


rm -rf aosp
