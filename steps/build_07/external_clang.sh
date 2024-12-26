set -e

df -h

mkdir -p $GITHUB_WORKSPACE/aosp && cd $GITHUB_WORKSPACE/aosp
mkdir -p out/soong/ && echo userdebug.buildbot.20240101.000000 > out/soong/build_number.txt
ln -sf $GITHUB_WORKSPACE/ninja .

mkdir -p prebuilts/clang/host/ && ln -sf $GITHUB_WORKSPACE/prebuilts/clang/host/linux-x86 prebuilts/clang/host/linux-x86

clone_depth_platform external/clang
clone_depth_platform external/llvm

rsync -a -r $GITHUB_WORKSPACE/artifacts/external/clang/utils/TableGen/clang-tblgen^linux_glibc_x86_64/ .
rsync -a -r $GITHUB_WORKSPACE/artifacts/external/libcxx/libc++^linux_glibc_x86_64_shared/ .

echo "building clang-gen-arm-neon^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-arm-neon,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-arm-neon^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-arm-neon^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-arm-neon^

echo "building clang-gen-attributes^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-attributes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-attributes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-attributes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-attributes^

echo "building clang-gen-checkers^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-checkers,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-checkers^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-checkers^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-checkers^

echo "building clang-gen-comment-commands^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-comment-commands,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-commands^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-comment-commands^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-commands^

echo "building clang-gen-comment-html-named-character-references^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-comment-html-named-character-references,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-html-named-character-references^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-comment-html-named-character-references^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-html-named-character-references^

echo "building clang-gen-comment-nodes^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-comment-nodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-nodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-comment-nodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-comment-nodes^

echo "building clang-gen-declnodes^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-declnodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-declnodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-declnodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-declnodes^

echo "building clang-gen-diagnostics^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-diagnostics,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-diagnostics^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-diagnostics^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-diagnostics^

echo "building clang-gen-html-tags^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-html-tags,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-html-tags^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-html-tags^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-html-tags^

echo "building clang-gen-statnodes^"
ninja -f $GITHUB_WORKSPACE/steps/build_07.ninja clang-gen-statnodes,
mkdir -p $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-statnodes^
rsync -a -r --files-from=$GITHUB_WORKSPACE/steps/outputs_07/external/clang/clang-gen-statnodes^.output . $GITHUB_WORKSPACE/artifacts/external/clang/clang-gen-statnodes^

rm -rf out

cd $GITHUB_WORKSPACE/
tar -cf external_clang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/artifacts/external/clang/ .
gh release --repo cibuilde/aosp-buildbot upload android12-gsi_07 external_clang.tar.zst --clobber

du -ah -d1| sort -h

if [ ! -f "$GITHUB_WORKSPACE/cache/external_clang.tar.zst" ]; then
  echo "Compressing external/clang -> external_clang.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_clang.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/clang/ .
fi
if [ ! -f "$GITHUB_WORKSPACE/cache/external_llvm.tar.zst" ]; then
  echo "Compressing external/llvm -> external_llvm.tar.zst"
  tar -cf $GITHUB_WORKSPACE/cache/external_llvm.tar.zst --use-compress-program zstdmt -C $GITHUB_WORKSPACE/aosp/external/llvm/ .
fi
du -ah -d1 $GITHUB_WORKSPACE/cache| sort -h

rm -rf aosp
