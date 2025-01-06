
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

echo "Preparing for external/bc"

clone_depth_platform external/bc

rsync -a -r $GITHUB_WORKSPACE/downloads/build/soong/cmd/sbox/sbox^linux_glibc_x86_64/ .

echo "building bc-lib.c^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja bc-lib.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-lib.c^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-lib.c^.output $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^ $GITHUB_WORKSPACE/artifacts/external/bc/bc-lib.c^/addition_copy_files.output

echo "building bc-bc_help.c^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja bc-bc_help.c,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-bc_help.c^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-bc_help.c^.output $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^ $GITHUB_WORKSPACE/artifacts/external/bc/bc-bc_help.c^/addition_copy_files.output

echo "building bc-version.h^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_03.ninja bc-version.h,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-version.h^.output . $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_03/external/bc/bc-version.h^.output $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^ $GITHUB_WORKSPACE/artifacts/external/bc/bc-version.h^/addition_copy_files.output


rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/bc/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_03 external_bc.tar.zst --clobber

du -ah -d1 external_bc*.tar.zst | sort -h


if [ ! -f "$GITHUB_WORKSPACE/cache/external_bc.tar.zst" ]; then
  echo "Compressing external/bc -> external_bc.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_bc.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/bc/ .
fi


rm -rf aosp
