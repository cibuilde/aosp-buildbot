set -e

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
mkdir -p out/soong/.minibootstrap && ln -sf $GITHUB_WORKSPACE/bpglob out/soong/.minibootstrap/bpglob
ln -sf $GITHUB_WORKSPACE/ndk.ninja .
ln -sf $GITHUB_WORKSPACE/ninja-ndk .
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/llvm

rsync -a -r $GITHUB_WORKSPACE/downloads/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/downloads/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/ .

echo "building llvm-gen-aarch64^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-aarch64,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-aarch64^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/AArch64/llvm-gen-aarch64^

echo "building llvm-gen-arm^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-arm,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-arm^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/ARM/llvm-gen-arm^

echo "building llvm-gen-attributes^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-attributes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-attributes^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-attributes^

echo "building llvm-gen-core^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-core,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-core^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/IR/llvm-gen-core^

echo "building llvm-gen-intrinsics^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-intrinsics,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-intrinsics^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/llvm-gen-intrinsics^

echo "building llvm-gen-libdriver^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-libdriver,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-libdriver^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/LibDriver/llvm-gen-libdriver^

echo "building llvm-gen-x86^"
ninja -d keepdepfile -f $GITHUB_WORKSPACE/steps/build_05.ninja llvm-gen-x86,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/external/llvm/llvm-gen-x86^.output . $GITHUB_WORKSPACE/artifacts/external/llvm/lib/Target/X86/llvm-gen-x86^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/llvm/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 external_llvm.tar.zst --clobber

du -ah -d1 external_llvm*.tar.zst | sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi

rm -rf aosp
