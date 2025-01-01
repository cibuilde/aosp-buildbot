set -e

echo "entering frameworks/compile/slang"

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/llvm
clone_depth_platform frameworks/compile/slang
clone_project platform/prebuilts/build-tools prebuilts/build-tools android12-gsi "/linux-x86/bin" "/linux-x86/lib64" "/path" "/common"

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/ .

echo "building slang-gen-options^"
prebuilts/build-tools/linux-x86/bin/ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_04.ninja slang-gen-options,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/slang-gen-options^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_04/frameworks/compile/slang/slang-gen-options^.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/slang-gen-options^
python3 $GITHUB_WORKSPACE/copy_symlink.py $GITHUB_WORKSPACE/steps/outputs_04/frameworks/compile/slang/slang-gen-options^.output $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/slang-gen-options^ $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/slang-gen-options^/addition_copy_files.output

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_compile_slang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/slang/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_04 frameworks_compile_slang.tar.zst --clobber

du -ah -d1 frameworks_compile_slang*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_compile_slang.tar.zst" ]; then
  echo "Compressing frameworks/compile/slang -> frameworks_compile_slang.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_compile_slang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/compile/slang/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst" ]; then
  echo "Compressing prebuilts/build-tools -> prebuilts_build-tools.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/prebuilts_build-tools.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/prebuilts/build-tools/ .
fi

rm -rf aosp
