set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/llvm
clone_depth_platform frameworks/compile/mclinker

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/llvm/utils/TableGen/llvm-tblgen^linux_glibc_x86_64/ .

echo "building mcld-gen-options^"
ninja -f $GITHUB_WORKSPACE/steps/build_05.ninja mcld-gen-options,
mkdir -p $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/tools/mcld/mcld-gen-options^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_05/frameworks/compile/mclinker/mcld-gen-options^.output . $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/tools/mcld/mcld-gen-options^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf frameworks_compile_mclinker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/frameworks/compile/mclinker/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_05 frameworks_compile_mclinker.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/frameworks_compile_mclinker.tar.zst" ]; then
  echo "Compressing frameworks/compile/mclinker -> frameworks_compile_mclinker.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/frameworks_compile_mclinker.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/frameworks/compile/mclinker/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
